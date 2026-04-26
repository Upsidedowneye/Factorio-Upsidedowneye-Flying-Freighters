return function(env)
  local _ENV = env

  local function manifest_meets_departure_threshold(manifest, freighter_inv, active_entry)
    if not freighter_inv then
      return false
    end

    return item_count_manifest_fill_units(manifest) >= freighter_minimum_departure_fill_units(freighter_inv, active_entry)
  end

  local function build_live_load_manifest_for_freighter(freighter, source, freighter_inv, cache)
    if not freighter or not source or not freighter_inv then
      return {}, 0, nil
    end

    local next_entry = next_freighter_schedule_entry(freighter)
    if freighter_schedule_entry_operation(next_entry) == "unload" then
      return build_load_manifest_for_next_unload(freighter, source, next_entry, freighter_inv, cache)
    end

    return build_load_manifest_for_source(source, freighter_inv, cache)
  end

  _ENV.build_live_load_manifest_for_freighter = build_live_load_manifest_for_freighter

  local function count_relevant_idle_load_freighters(freighter)
    if not freighter or not freighter.from_signal_key or not freighter.entity then
      return 0
    end

    local locked_network_id = freighter_route_network_id(freighter)
    local freighter_surface = freighter.entity.surface
    local total = 0

    for _, other in pairs(global.ff.freighters or {}) do
      if is_valid(other and other.entity)
        and other.entity.surface == freighter_surface
        and other.from_signal_key == freighter.from_signal_key
        and freighter_schedule_entry_operation(active_freighter_schedule_entry(other)) == "load"
        and item_count_manifest_is_empty(effective_freighter_cargo_manifest(other))
        and (
          other.state == "idle"
          or (other.idle_waiting_for_load and (other.state == "in_transit" or other.state == "waiting_load"))
        )
        and (locked_network_id == nil or freighter_route_network_id(other) == locked_network_id)
      then
        total = total + 1
      end
    end

    return total
  end

  local function count_buffered_idle_waiters_for_source(freighter, source)
    if not freighter or not source or not source.unit_number or not freighter.from_signal_key or not freighter.entity then
      return 0
    end

    local locked_network_id = freighter_route_network_id(freighter)
    local freighter_surface = freighter.entity.surface
    local total = 0

    for _, other in pairs(global.ff.freighters or {}) do
      if other ~= freighter
        and is_valid(other and other.entity)
        and other.entity.surface == freighter_surface
        and other.from_signal_key == freighter.from_signal_key
        and other.target_station == source.unit_number
        and freighter_schedule_entry_operation(active_freighter_schedule_entry(other)) == "load"
        and item_count_manifest_is_empty(effective_freighter_cargo_manifest(other))
        and other.idle_waiting_for_load
        and (other.state == "in_transit" or other.state == "waiting_load")
        and (locked_network_id == nil or freighter_route_network_id(other) == locked_network_id)
      then
        total = total + 1
      end
    end

    return total
  end

  function build_load_manifest_for_source(source, freighter_inv, cache)
    local manifest = {}
    local total_count = 0
    local source_counts = get_cached_station_inventory_counts(source, cache)
    for item_name, item_count in pairs(source_counts or {}) do
      if not is_defense_item(item_name) and item_count > 0 then
        local insertable = get_freighter_capacity(freighter_inv, item_name)
        local amount = math.min(item_count, insertable)
        if amount > 0 then
          manifest[item_name] = amount
          total_count = total_count + amount
        end
      end
    end
    return manifest, total_count
  end

  -- Load legs that immediately hand off to an unload leg should only reserve cargo that
  -- some currently valid destination can still accept. This keeps pickup manifests aligned
  -- with live requester demand instead of vacuuming arbitrary extra source inventory.
  function cached_unloadable_amount_for_target(target, demand_requests, current_counts, cache, item_name, available_amount, excluded_freighter_unit_number)
    if not target or not cache or type(item_name) ~= "string" or (available_amount or 0) <= 0 then
      return 0
    end

    local insertable = get_cached_station_insertable_count(target, item_name, cache)
    if insertable <= 0 then
      return 0
    end

    local reserved_inbound = reserved_inbound_cargo_for_stop(target.unit_number, item_name, excluded_freighter_unit_number)
    local available_insertable = math.max(0, insertable - reserved_inbound)
    if available_insertable <= 0 then
      return 0
    end

    if not item_count_manifest_is_empty(demand_requests) then
      local requested_amount = demand_requests[item_name] or 0
      if requested_amount <= 0 then
        return 0
      end

      local missing_amount = math.max(0, requested_amount - ((current_counts[item_name] or 0) + reserved_inbound))
      return math.min(available_amount, available_insertable, missing_amount)
    end

    return math.min(available_amount, available_insertable)
  end

  -- When a load leg is immediately followed by an unload leg, build the pickup manifest
  -- against the best currently valid unload target for that next leg. This prevents the
  -- freighter from boarding cargo that no matching requester presently needs.
  function build_load_manifest_for_next_unload(freighter, source, next_unload_entry, freighter_inv, cache)
    if not freighter or not source or not next_unload_entry or not freighter_inv or not cache then
      return {}, 0, nil
    end

    local target_signal_key = freighter_schedule_entry_stop_signal_key(next_unload_entry)
    if not target_signal_key then
      return {}, 0, nil
    end

    local source_counts = get_cached_station_inventory_counts(source, cache)
    local freighter_surface = freighter.entity and freighter.entity.surface or nil
    local target_stations = find_station_candidates(target_signal_key, "demand")
    local best_manifest = nil
    local best_total_count = 0
    local best_target_priority = nil

    for _, target in ipairs(target_stations) do
      if is_valid(target.entity)
        and target.entity.surface == freighter_surface
        and target.unit_number ~= source.unit_number
        and effective_station_network_id(target) == effective_station_network_id(source)
      then
        local manifest = {}
        local total_count = 0
        local demand_requests = station_demand_request_manifest(target)
        local current_counts = get_cached_station_inventory_counts(target, cache)

        for item_name, item_count in pairs(source_counts or {}) do
          if not is_defense_item(item_name) and item_count > 0 then
            local available_amount = math.min(item_count, get_freighter_capacity(freighter_inv, item_name))
            local amount = cached_unloadable_amount_for_target(
              target,
              demand_requests,
              current_counts,
              cache,
              item_name,
              available_amount,
              freighter.unit_number
            )
            if amount > 0 then
              manifest[item_name] = amount
              total_count = total_count + amount
            end
          end
        end

        if total_count > 0 then
          local target_priority = effective_station_priority_value(target)
          if not best_manifest
            or total_count > best_total_count
            or (total_count == best_total_count and target_priority > (best_target_priority or -math.huge))
          then
            best_manifest = manifest
            best_total_count = total_count
            best_target_priority = target_priority
          end
        end
      end
    end

    return best_manifest or {}, best_total_count, best_target_priority
  end

  function build_unload_manifest_for_target(target, cargo_manifest, excluded_freighter_unit_number, cache)
    local manifest = {}
    local total_count = 0
    local demand_requests = station_demand_request_manifest(target)

    if not item_count_manifest_is_empty(demand_requests) then
      local current_counts = get_cached_station_inventory_counts(target, cache)
      for item_name, requested_amount in pairs(demand_requests) do
        local carried_amount = cargo_manifest and cargo_manifest[item_name] or 0
        if requested_amount > 0 and carried_amount > 0 then
          local insertable = get_cached_station_insertable_count(target, item_name, cache)
          local reserved_inbound = reserved_inbound_cargo_for_stop(target.unit_number, item_name, excluded_freighter_unit_number)
          local missing_amount = math.max(0, requested_amount - ((current_counts[item_name] or 0) + reserved_inbound))
          local amount = math.min(carried_amount, insertable, missing_amount)
          if amount > 0 then
            manifest[item_name] = amount
            total_count = total_count + amount
          end
        end
      end
      return manifest, total_count
    end

    for item_name, item_count in pairs(cargo_manifest or {}) do
      if item_count > 0 then
        local insertable = get_cached_station_insertable_count(target, item_name, cache)
        local reserved_inbound = reserved_inbound_cargo_for_stop(target.unit_number, item_name, excluded_freighter_unit_number)
        local amount = math.min(item_count, math.max(0, insertable - reserved_inbound))
        if amount > 0 then
          manifest[item_name] = amount
          total_count = total_count + amount
        end
      end
    end
    return manifest, total_count
  end

  -- Requester inventories can change after a route is chosen. Recomputing the live
  -- unloadable amount right before each transfer prevents overfilling a requester that was
  -- already satisfied by bots, inserters, or another inbound freighter during transit.
  function live_unloadable_amount_for_target(target, dst_inv, demand_requests, current_counts, item_name, carried_amount, planned_amount, excluded_freighter_unit_number)
    if not target or not dst_inv or type(item_name) ~= "string" then
      return 0
    end

    if (carried_amount or 0) <= 0 or (planned_amount or 0) <= 0 then
      return 0
    end

    local insertable = dst_inv.get_insertable_count(item_name)
    if insertable <= 0 then
      return 0
    end

    local reserved_inbound = reserved_inbound_cargo_for_stop(target.unit_number, item_name, excluded_freighter_unit_number)
    local available_insertable = math.max(0, insertable - reserved_inbound)
    if available_insertable <= 0 then
      return 0
    end

    if not item_count_manifest_is_empty(demand_requests) then
      local requested_amount = demand_requests[item_name] or 0
      if requested_amount <= 0 then
        return 0
      end

      local missing_amount = math.max(0, requested_amount - ((current_counts[item_name] or 0) + reserved_inbound))
      return math.min(carried_amount, planned_amount, available_insertable, missing_amount)
    end

    return math.min(carried_amount, planned_amount, available_insertable)
  end

  function choose_load_route_for_freighter(freighter, active_entry, cache)
    if not freighter or not freighter.from_signal_key then
      return nil
    end

    local freighter_inv = get_freighter_inventory(freighter.entity)
    if not freighter_inv then
      return nil
    end

    local freighter_surface = freighter.entity and freighter.entity.surface or nil
    local source_stations = find_station_candidates(freighter.from_signal_key, nil)
    local locked_network_id = freighter_route_network_id(freighter)
    local next_entry = next_freighter_schedule_entry(freighter)
    local best = nil

    for _, source in ipairs(source_stations) do
      if effective_station_type(source) == "demand"
        or not is_valid(source.entity)
        or source.entity.surface ~= freighter_surface
        or (locked_network_id ~= nil and effective_station_network_id(source) ~= locked_network_id)
      then
        goto continue_source
      end

      local manifest, total_count, target_priority = build_live_load_manifest_for_freighter(freighter, source, freighter_inv, cache)
      if total_count > 0 and manifest_meets_departure_threshold(manifest, freighter_inv, active_entry) then
        local source_priority = effective_station_priority_value(source)
        if not best
          or total_count > best.total_count
          or (total_count == best.total_count and source_priority > best.source_priority)
          or (total_count == best.total_count and source_priority == best.source_priority and (target_priority or -math.huge) > (best.target_priority or -math.huge))
        then
          best = {
            operation = "load",
            source = source,
            manifest = manifest,
            total_count = total_count,
            source_priority = source_priority,
            target_priority = target_priority,
            route_network_id = effective_station_network_id(source),
            route_key = "load|" .. tostring(station_route_signal_key(source)),
          }
        end
      end

      ::continue_source::
    end

    return best
  end

  function choose_idle_load_wait_route_for_freighter(freighter, active_entry, cache)
    if not freighter or not freighter.from_signal_key then
      return nil
    end

    local freighter_inv = get_freighter_inventory(freighter.entity)
    if not freighter_inv then
      return nil
    end

    local freighter_surface = freighter.entity and freighter.entity.surface or nil
    local source_stations = find_station_candidates(freighter.from_signal_key, nil)
    local locked_network_id = freighter_route_network_id(freighter)
    local usable_source_count = 0
    local best = nil
    local best_buffered = nil

    for _, source in ipairs(source_stations) do
      if effective_station_type(source) == "demand"
        or not is_valid(source.entity)
        or source.entity.surface ~= freighter_surface
        or (locked_network_id ~= nil and effective_station_network_id(source) ~= locked_network_id)
      then
        goto continue_idle_source
      end

      usable_source_count = usable_source_count + 1

      -- When same-signal load freighters outnumber usable pickup stations, let excess
      -- freighters pre-position at the best matching source so they wait where new stock
      -- will appear instead of lingering at the previous dropoff. This deliberately stays
      -- disabled when the signal already has at least as many usable supply stops as
      -- relevant freighters, because in that case early parking only creates churn.
      local manifest, total_count, target_priority = build_live_load_manifest_for_freighter(freighter, source, freighter_inv, cache)
      local source_priority = effective_station_priority_value(source)
      if not best
        or total_count > best.total_count
        or (total_count == best.total_count and source_priority > best.source_priority)
        or (total_count == best.total_count and source_priority == best.source_priority and (target_priority or -math.huge) > (best.target_priority or -math.huge))
      then
        best = {
          operation = "load",
          source = source,
          manifest = manifest,
          total_count = total_count,
          source_priority = source_priority,
          target_priority = target_priority,
          route_network_id = effective_station_network_id(source),
          route_key = nil,
          idle_wait = true,
        }
      end

      -- A per-station supply buffer lets players keep a small pool of empty load
      -- freighters staged at chosen pickup stops even before enough stock exists to
      -- meet the normal departure threshold. Count only freighters already using the
      -- same idle-wait behavior for this exact source so the configured number remains
      -- a true per-stop cap instead of a loose signal-wide heuristic.
      local configured_buffer_count = station_supply_buffer_count(source)
      local current_buffered_count = count_buffered_idle_waiters_for_source(freighter, source)
      if configured_buffer_count > current_buffered_count then
        if not best_buffered
          or total_count > best_buffered.total_count
          or (total_count == best_buffered.total_count and source_priority > best_buffered.source_priority)
          or (total_count == best_buffered.total_count and source_priority == best_buffered.source_priority and (target_priority or -math.huge) > (best_buffered.target_priority or -math.huge))
        then
          best_buffered = {
            operation = "load",
            source = source,
            manifest = manifest,
            total_count = total_count,
            source_priority = source_priority,
            target_priority = target_priority,
            route_network_id = effective_station_network_id(source),
            route_key = nil,
            idle_wait = true,
          }
        end
      end

      ::continue_idle_source::
    end

    if best_buffered then
      return best_buffered
    end

    if count_relevant_idle_load_freighters(freighter) <= usable_source_count then
      return nil
    end

    return best
  end

  function choose_unload_route_for_freighter(freighter, active_entry, cache)
    if not freighter or not freighter.to_signal_key then
      return nil
    end

    local cargo_manifest = copy_item_count_manifest(freighter.cargo_manifest)
    if item_count_manifest_is_empty(cargo_manifest) then
      return nil
    end

    local freighter_surface = freighter.entity and freighter.entity.surface or nil
    local target_stations = find_station_candidates(freighter.to_signal_key, "demand")
    local locked_network_id = freighter_route_network_id(freighter)
    local best = nil

    for _, target in ipairs(target_stations) do
      if not is_valid(target.entity)
        or target.entity.surface ~= freighter_surface
        or (locked_network_id ~= nil and effective_station_network_id(target) ~= locked_network_id)
      then
        goto continue_target
      end

      local manifest, total_count = build_unload_manifest_for_target(target, cargo_manifest, freighter.unit_number, cache)
      if total_count > 0 then
        local target_priority = effective_station_priority_value(target)
        if not best or total_count > best.total_count or (total_count == best.total_count and target_priority > best.target_priority) then
          best = {
            operation = "unload",
            target = target,
            manifest = manifest,
            total_count = total_count,
            target_priority = target_priority,
            route_network_id = effective_station_network_id(target),
            route_key = "unload|" .. tostring(station_route_signal_key(target)),
          }
        end
      end

      ::continue_target::
    end

    return best
  end

  function choose_route_for_freighter(freighter)
    if not freighter then
      return nil
    end
    local active_entry = active_freighter_schedule_entry(freighter)
    local operation = freighter_schedule_entry_operation(active_entry)
    local cache = get_runtime_cycle_cache()
    if operation == "load" then
      return choose_load_route_for_freighter(freighter, active_entry, cache)
    end
    if operation == "unload" then
      return choose_unload_route_for_freighter(freighter, active_entry, cache)
    end
    return nil
  end
end
