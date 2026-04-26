return function(env)
  local _ENV = env

  -- Complex demand manifests are now controlled per station instead of globally.
  -- The simple dropoff model is now the default for migrated and newly placed
  -- stations. Only an explicit per-station opt-in should activate the curated
  -- requester-style stock-target manifest behavior.
  local function station_uses_complex_demands(rec)
    -- The more advanced request-target demand mode is still a work in progress,
    -- so current public builds intentionally force every station back onto the
    -- simpler drop-off behavior until that later update is ready.
    return false and rec and rec.use_complex_demands == true or false
  end

  -- The original monolithic runtime kept inventory counting as a `control.lua` local,
  -- which meant extracted helper modules could not reliably see it during early
  -- registration paths such as `on_built_entity`. Keep a module-local copy here so
  -- manifest rebuilding stays self-contained and does not depend on declaration order
  -- inside the main runtime file.
  local function sum_inventory_count_value(value)
    if type(value) == "number" then
      return value
    end
    if type(value) ~= "table" then
      return 0
    end

    local total = 0
    for _, nested_value in pairs(value) do
      total = total + sum_inventory_count_value(nested_value)
    end
    return total
  end

  local function inventory_name_counts(inventory)
    local counts = {}
    if not inventory then
      return counts
    end

    local contents = inventory.get_contents()
    for item_key, item_value in pairs(contents) do
      local item_name = nil
      if type(item_key) == "string" then
        item_name = item_key
      elseif type(item_key) == "table" then
        item_name = item_key.name
      end

      if not item_name and type(item_value) == "table" then
        item_name = item_value.name
      end

      if item_name then
        local total = sum_inventory_count_value(item_value)
        if total > 0 then
          counts[item_name] = (counts[item_name] or 0) + total
        end
      end
    end

    return counts
  end

  local function get_or_create_inbound_reservation_bucket(stop_unit_number)
    local inbound = global.ff.inbound_reservations
    local by_stop = inbound[stop_unit_number]
    if not by_stop then
      by_stop = {}
      inbound[stop_unit_number] = by_stop
    end
    return by_stop
  end

  local function add_inbound_reservation(stop_unit_number, item_name, amount)
    if not stop_unit_number or type(item_name) ~= "string" or not amount or amount <= 0 then
      return
    end
    local by_stop = get_or_create_inbound_reservation_bucket(stop_unit_number)
    by_stop[item_name] = (by_stop[item_name] or 0) + amount
  end

  function add_inbound_reservation_manifest(stop_unit_number, manifest)
    if not stop_unit_number or type(manifest) ~= "table" then
      return
    end

    for item_name, amount in pairs(manifest) do
      add_inbound_reservation(stop_unit_number, item_name, amount)
    end
  end

  function remove_inbound_reservation(stop_unit_number, item_name, amount)
    if not stop_unit_number or type(item_name) ~= "string" or not amount or amount <= 0 then
      return
    end
    local inbound = global.ff.inbound_reservations
    local by_stop = inbound[stop_unit_number]
    if not by_stop then
      return
    end
    local remaining = (by_stop[item_name] or 0) - amount
    if remaining > 0 then
      by_stop[item_name] = remaining
    else
      by_stop[item_name] = nil
      if next(by_stop) == nil then
        inbound[stop_unit_number] = nil
      end
    end
  end

  function remove_inbound_reservation_manifest(stop_unit_number, manifest)
    if not stop_unit_number or type(manifest) ~= "table" then
      return
    end

    for item_name, amount in pairs(manifest) do
      remove_inbound_reservation(stop_unit_number, item_name, amount)
    end
  end

  function copy_item_count_manifest(manifest)
    local copy = {}
    for item_name, amount in pairs(manifest or {}) do
      if type(item_name) == "string" and (amount or 0) > 0 then
        copy[item_name] = amount
      end
    end
    return copy
  end

  function single_item_count_manifest(item_name, amount)
    -- Older saves can retain a legacy cargo count after the primary cargo item field was
    -- cleared. Lua cannot build a table with a nil key, so only synthesize the fallback
    -- manifest when both the item name and amount are still valid.
    if type(item_name) ~= "string" or not amount or amount <= 0 then
      return {}
    end
    return {[item_name] = amount}
  end

  function effective_freighter_inbound_manifest(freighter)
    if not freighter then
      return {}
    end
    if type(freighter.inbound_manifest) == "table" then
      return freighter.inbound_manifest
    end
    return single_item_count_manifest(freighter.cargo_item, freighter.cargo_count)
  end

  function effective_freighter_cargo_manifest(freighter)
    if not freighter then
      return {}
    end
    if type(freighter.cargo_manifest) == "table" then
      return freighter.cargo_manifest
    end
    return single_item_count_manifest(freighter.cargo_item, freighter.cargo_count)
  end

  function item_count_manifest_is_empty(manifest)
    for _, amount in pairs(manifest or {}) do
      if (amount or 0) > 0 then
        return false
      end
    end
    return true
  end

  function item_count_manifest_total(manifest)
    local total = 0
    for _, amount in pairs(manifest or {}) do
      if (amount or 0) > 0 then
        total = total + amount
      end
    end
    return total
  end

  function item_count_manifest_primary_name(manifest)
    local best_name = nil
    local best_amount = 0
    for item_name, amount in pairs(manifest or {}) do
      if type(item_name) == "string" and (amount or 0) > best_amount then
        best_name = item_name
        best_amount = amount
      end
    end
    return best_name, best_amount
  end

  function normalize_station_request_amount(value)
    local numeric_value = math.floor(tonumber(value) or 0)
    if numeric_value < 1 then
      return 0
    end
    return numeric_value
  end

  function normalize_station_request_group_name(value)
    local group_name = tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if group_name == "" then
      return nil
    end
    return group_name
  end

  function normalize_station_request_manifest(requests)
    local manifest = {}
    if type(requests) ~= "table" then
      return manifest
    end

    for item_name, amount in pairs(requests) do
      if type(item_name) == "string" then
        local normalized_amount = normalize_station_request_amount(amount)
        if normalized_amount > 0 and has_item_prototype(item_name) then
          manifest[item_name] = normalized_amount
        end
      elseif type(item_name) == "number" and type(amount) == "table" then
        local request_name = amount.name or amount.item or amount[1]
        local request_amount = amount.count or amount.amount or amount[2]
        local normalized_amount = normalize_station_request_amount(request_amount)
        if type(request_name) == "string" and normalized_amount > 0 and has_item_prototype(request_name) then
          manifest[request_name] = normalized_amount
        end
      end
    end

    return manifest
  end

  function get_force_logistic_group(force, group_name)
    local normalized_group_name = normalize_station_request_group_name(group_name)
    if not normalized_group_name or not force or not force.get_logistic_group then
      return nil
    end

    -- Requester chests, characters, and other logistic members can expose different force
    -- logistic-group namespaces. Demand stops should accept requester-style groups, so look
    -- through the known group types instead of relying on the API default bucket.
    local group_types = {
      defines.logistic_group_type and defines.logistic_group_type.roboport or nil,
      defines.logistic_group_type and defines.logistic_group_type.with_trash or nil,
      nil,
    }

    for _, group_type in ipairs(group_types) do
      local ok, logistic_group = pcall(force.get_logistic_group, force, normalized_group_name, group_type)
      if ok and type(logistic_group) == "table" then
        return logistic_group
      end
    end

    return nil
  end

  function station_request_group_manifest(force, group_name)
    local logistic_group = get_force_logistic_group(force, group_name)
    local manifest = {}
    if not logistic_group then
      return manifest
    end

    -- Force logistic groups can include non-item requests and quality-aware item IDs. Stop
    -- demand manifests only care about concrete item counts, so keep just the valid item rows
    -- and treat the group's minimum request count as the desired stock target for the stop.
    for _, filter in ipairs(logistic_group.filters or {}) do
      local value = filter and filter.value or nil
      local item_name = nil
      if type(value) == "string" then
        item_name = value
      elseif type(value) == "table" and (value.type == nil or value.type == "item") then
        item_name = value.name
      end

      local amount = normalize_station_request_amount(filter and (filter.min or filter.max) or nil)
      if type(item_name) == "string" and amount > 0 and has_item_prototype(item_name) then
        manifest[item_name] = amount
      end
    end

    return manifest
  end

  function station_demand_request_manifest(rec)
    if not station_uses_complex_demands(rec) then
      return {}
    end

    local merged_manifest = station_request_group_manifest(rec and rec.entity and rec.entity.force or nil, rec and rec.demand_request_group or nil)
    for item_name, amount in pairs(normalize_station_request_manifest(rec and rec.demand_requests or nil)) do
      merged_manifest[item_name] = amount
    end
    return merged_manifest
  end

  function station_has_demand_requests(rec)
    return not item_count_manifest_is_empty(station_demand_request_manifest(rec))
  end

  function sync_freighter_cargo_summary_from_manifest(freighter, manifest)
    if not freighter then
      return
    end

    local normalized_manifest = copy_item_count_manifest(manifest)
    freighter.cargo_manifest = normalized_manifest
    local primary_name, primary_amount = item_count_manifest_primary_name(normalized_manifest)
    freighter.cargo_item = primary_name
    freighter.cargo_count = item_count_manifest_total(normalized_manifest)
    freighter.primary_cargo_count = primary_amount or 0
  end

  function sync_freighter_cargo_summary_from_inventory(freighter)
    if not freighter or not is_valid(freighter.entity) then
      return
    end

    local cargo_inv = get_freighter_inventory(freighter.entity)
    sync_freighter_cargo_summary_from_manifest(freighter, inventory_name_counts(cargo_inv))
  end

  function freighter_has_inbound_reservation(freighter)
    return freighter
      and freighter.target_station
      and not item_count_manifest_is_empty(effective_freighter_inbound_manifest(freighter))
      and (freighter.state == "in_transit" or freighter.state == "waiting_unload")
  end

  function release_freighter_inbound_reservation(freighter)
    if freighter_has_inbound_reservation(freighter) then
      remove_inbound_reservation_manifest(freighter.target_station, effective_freighter_inbound_manifest(freighter))
    end
  end
end
