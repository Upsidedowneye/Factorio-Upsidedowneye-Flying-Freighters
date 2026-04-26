local __ff_parent_env = _ENV
local _ENV = setmetatable(require("shared.constants"), {
  __index = __ff_parent_env,
})
_ENV.STARTUP_SETTINGS = require("shared.startup-settings")

for key, value in pairs({

  GUI_ROOT = "ff_gui_root",
  GUI_SAVE = "ff_gui_save",
  GUI_NAME = "ff_gui_name",
  GUI_STATION_TYPE = "ff_gui_station_type",
  GUI_COMPLEX_DEMANDS = "ff_gui_complex_demands",
  GUI_COMPLEX_DEMANDS_SECTION = "ff_gui_complex_demands_section",
  GUI_FUEL_STOP = "ff_gui_fuel_stop",
  GUI_AMMO_STOP = "ff_gui_ammo_stop",
  GUI_TRASH_STOP = "ff_gui_trash_stop",
  GUI_CIRCUIT_STATION_TYPE = "ff_gui_circuit_station_type",
  GUI_CIRCUIT_TYPE_SIGNAL = "ff_gui_circuit_type_signal",
  GUI_CIRCUIT_PRIORITY_SIGNAL = "ff_gui_circuit_priority_signal",
  GUI_CIRCUIT_NETWORK_SIGNAL = "ff_gui_circuit_network_signal",
  GUI_CIRCUIT_ENERGY_SIGNAL = "ff_gui_circuit_energy_signal",
  GUI_CHARGE_RATE = "ff_gui_charge_rate",
  GUI_STOP_PRIORITY = "ff_gui_stop_priority",
  GUI_SUPPLY_BUFFER_COUNT = "ff_gui_supply_buffer_count",
  GUI_NETWORK_ID = "ff_gui_network_id",
  GUI_FREIGHTER_NETWORK_ID = "ff_gui_freighter_network_id",
  GUI_STATION_REQUESTS_FLOW = "ff_gui_station_requests_flow",
  GUI_STATION_REQUESTS_ADD = "ff_gui_station_requests_add",
  GUI_STATION_REQUEST_GROUP = "ff_gui_station_request_group",
  GUI_STATION_REQUEST_GROUP_INFO = "ff_gui_station_request_group_info",
  GUI_STATION_REQUEST_GROUP_FLOW = "ff_gui_station_request_group_flow",
  GUI_STATION_REQUEST_ITEM_PREFIX = "ff_gui_station_request_item_",
  GUI_STATION_REQUEST_COUNT_PREFIX = "ff_gui_station_request_count_",
  GUI_STATION_REQUEST_REMOVE_PREFIX = "ff_gui_station_request_remove_",
  GUI_FROM = "ff_gui_from",
  GUI_TO = "ff_gui_to",
  GUI_FORCE_NOW = "ff_gui_force_now",
  GUI_WAIT_STATUS = "ff_gui_wait_status",
  GUI_OPEN_CONFIG_BUTTON = "ff_open_config_button",
  GUI_OPEN_CONFIG_RELATIVE = "ff_open_config_relative",
  GUI_STATION_CIRCUIT_RELATIVE = "ff_station_circuit_relative",
  GUI_OPEN_CARGO = "ff_open_cargo",
  GUI_MAP_ROUTE_TITLE = "ff_map_route_title",
  GUI_MAP_ROUTE_DROPDOWN = "ff_map_route_dropdown",
  GUI_MAP_ROUTE_FROM = "ff_map_route_from",
  GUI_MAP_ROUTE_TO = "ff_map_route_to",
  GUI_MAP_ROUTE_SAVE = "ff_map_route_save",
  GUI_HOTKEY_SUMMARY = "ff_gui_hotkey_summary",
  GUI_HOTKEY_ONLY_HINT = "ff_gui_hotkey_only_hint",
  GUI_CLOSE = "ff_gui_close",
  GUI_SCHEDULE_LIST = "ff_gui_schedule_list",
  GUI_SCHEDULE_ROWS_PANE = "ff_gui_schedule_rows_pane",
  GUI_SCHEDULE_ROWS = "ff_gui_schedule_rows",
  GUI_SCHEDULE_ADD = "ff_gui_schedule_add",
  GUI_SCHEDULE_REMOVE = "ff_gui_schedule_remove",
  GUI_SCHEDULE_UP = "ff_gui_schedule_up",
  GUI_SCHEDULE_DOWN = "ff_gui_schedule_down",
  GUI_SCHEDULE_SUMMARY = "ff_gui_schedule_summary",
  GUI_SCHEDULE_DRAG_STATUS = "ff_gui_schedule_drag_status",
  GUI_SCHEDULE_OPERATION = "ff_gui_schedule_operation",
  GUI_SCHEDULE_MIN_LOAD = "ff_gui_schedule_min_load",
  GUI_SCHEDULE_FUEL_INTERRUPT = "ff_gui_schedule_fuel_interrupt",
  GUI_SCHEDULE_AMMO_INTERRUPT = "ff_gui_schedule_ammo_interrupt",
  GUI_SCHEDULE_TRASH_INTERRUPT = "ff_gui_schedule_trash_interrupt",
  GUI_SCHEDULE_SELECT_PREFIX = "ff_gui_schedule_select_",
  GUI_SCHEDULE_DRAG_PREFIX = "ff_gui_schedule_drag_",
  INPUT_OPEN_CONFIG = "ff-open-config",
  INPUT_TOGGLE_STATION_TYPE = "ff-station-toggle-type",
  INPUT_TOGGLE_FUEL_STOP = "ff-station-toggle-fuel",
  INPUT_TOGGLE_AMMO_STOP = "ff-station-toggle-ammo",
  INPUT_TOGGLE_TRASH_STOP = "ff-station-toggle-trash",
  INPUT_GUI_CONFIRM = "ff-gui-confirm",
  STATION_COMPLEX_DEMANDS_FEATURE_ENABLED = false,

  TICK_INTERVAL = 30,
  MIN_TRAVEL_TICKS = 300,
  TILES_PER_TICK = 0.2,
  TRIP_FUEL_COST_MULTIPLIER = 1,
  FREIGHTER_IDLE_CONSUMPTION_W = 1 * 1000,
  FREIGHTER_MOVEMENT_CONSUMPTION_W = 250 * 1000,
  STATION_TAG_ICON = {type = "item", name = "flying-freighter-station"},
  LOW_FUEL_ENERGY_J = 40 * 1000000,
  DESIRED_FUEL_ENERGY_J = 400 * 1000000,
  LOW_AMMO_COUNT = 40,
  STOP_WARNING_INTERVAL = 300,
  CLEANUP_SWEEP_INTERVAL = 600,
  STOP_WARNING_BUCKET_COUNT = 10,
  EMPTY_ROUTE_WARNING_INTERVAL = 60 * 60 * 5,
  STATION_RENAME_DEBUG = false,

  BASE_CAPSULE_AMMO_PRIORITY = {
    "nuclear-landmine-capsule-ammo-rampant-arsenal",
    "he-landmine-capsule-ammo-rampant-arsenal",
    "bio-landmine-capsule-ammo-rampant-arsenal",
    "incendiary-landmine-capsule-ammo-rampant-arsenal",
    "landmine-capsule-ammo-rampant-arsenal",
    "he-grenade-capsule-ammo-rampant-arsenal",
    "bio-grenade-capsule-ammo-rampant-arsenal",
    "incendiary-grenade-capsule-ammo-rampant-arsenal",
    "cluster-grenade-capsule-ammo-rampant-arsenal",
    "grenade-capsule-ammo-rampant-arsenal",
    "destroyer-capsule-ammo-rampant-arsenal",
    "distractor-capsule-ammo-rampant-arsenal",
    "defender-capsule-ammo-rampant-arsenal",
    "paralysis-capsule-ammo-rampant-arsenal",
    "repair-capsule-ammo-rampant-arsenal",
    "toxic-capsule-ammo-rampant-arsenal",
    "poison-capsule-ammo-rampant-arsenal",
    "slowdown-capsule-ammo-rampant-arsenal",
  },
}) do
  _ENV[key] = value
end
local clear_route_claim
local finish_unload
local save_edit
local update_station_label
local update_station_chart_tag
local get_station_cargo_entity
local ensure_station_cargo_entity
local apply_station_charge_rate_to_power_entity
local ensure_station_circuit_entity
local station_has_external_circuit_wires
local station_has_full_power
local get_inventory_name_counts
local rendering = rawget(_G, "rendering")

-- Keep the monolithic runtime script split into focused helper modules so schedule
-- normalization, manifest math, and route planning can evolve independently.
require("runtime.manifests")(_ENV)
require("runtime.schedule")(_ENV)
require("runtime.routes")(_ENV)

local function tick_bucket_for_unit(unit_number)
  return ((unit_number or 0) % TICK_INTERVAL) + 1
end

local function create_tick_bucket_sets()
  local buckets = {}
  for bucket = 1, TICK_INTERVAL do
    buckets[bucket] = {}
  end
  return buckets
end

local function add_unit_to_tick_bucket(bucket_sets, unit_number)
  if not bucket_sets or not unit_number then
    return
  end
  local bucket = bucket_sets[tick_bucket_for_unit(unit_number)]
  if bucket then
    bucket[unit_number] = true
  end
end

local function remove_unit_from_tick_bucket(bucket_sets, unit_number)
  if not bucket_sets or not unit_number then
    return
  end
  local bucket = bucket_sets[tick_bucket_for_unit(unit_number)]
  if bucket then
    bucket[unit_number] = nil
  end
end

function mark_station_power_transfer_active(rec)
  if rec and rec.unit_number and global and global.ff and global.ff.active_station_power_units then
    global.ff.active_station_power_units[rec.unit_number] = true
  end
end

function clear_station_power_transfer_active(rec)
  if rec and rec.unit_number and global and global.ff and global.ff.active_station_power_units then
    global.ff.active_station_power_units[rec.unit_number] = nil
  end
end

function find_child_recursive(element, child_name)
  if not element or not element.valid then
    return nil
  end

  local stack = {element}
  while #stack > 0 do
    local current = stack[#stack]
    stack[#stack] = nil

    if current and current.valid then
      if current.name == child_name then
        return current
      end

      local children = current.children
      if children then
        for idx = #children, 1, -1 do
          stack[#stack + 1] = children[idx]
        end
      end
    end
  end

  return nil
end

clear_station_warning_bookkeeping = function(unit_number)
  if not unit_number then
    return
  end

  if global.ff.stop_warning_tick then
    global.ff.stop_warning_tick[unit_number] = nil
  end

  local empty_route_warning_tick = global.ff.empty_route_warning_tick
  if empty_route_warning_tick and empty_route_warning_tick.stations then
    empty_route_warning_tick.stations[unit_number] = nil
  end
end

clear_freighter_warning_bookkeeping = function(unit_number)
  if not unit_number then
    return
  end

  local empty_route_warning_tick = global.ff.empty_route_warning_tick
  if empty_route_warning_tick and empty_route_warning_tick.freighters then
    empty_route_warning_tick.freighters[unit_number] = nil
  end

  if global.ff.refuel_deadlock_warning_tick then
    global.ff.refuel_deadlock_warning_tick[unit_number] = nil
  end
end

local function format_station_charge_rate_mw(charge_rate_w)
  local mw = math.max(0, (charge_rate_w or station_power.default_charge_rate_w) / 1000000)
  if math.abs(mw - math.floor(mw + 0.0000001)) < 0.0000001 then
    return tostring(math.floor(mw + 0.0000001))
  end
  return string.format("%.2f", mw):gsub("0+$", ""):gsub("%.$", "")
end

local function parse_station_charge_rate_w(text)
  local trimmed = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if trimmed == "" then
    return nil
  end

  local normalized = trimmed:gsub(",", ".")
  local mw = tonumber(normalized)
  if not mw or mw <= 0 then
    return nil
  end

  return mw * 1000000
end

local function format_station_priority(priority)
  local numeric_priority = tonumber(priority) or 0
  return tostring(math.floor(numeric_priority + (numeric_priority >= 0 and 0.0000001 or -0.0000001)))
end

function format_station_supply_buffer_count(buffer_count)
  local numeric_buffer_count = tonumber(buffer_count) or 0
  numeric_buffer_count = math.max(0, numeric_buffer_count)
  return tostring(math.floor(numeric_buffer_count + 0.0000001))
end

function parse_station_supply_buffer_count(text)
  local trimmed = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if trimmed == "" then
    return 0
  end

  local buffer_count = tonumber(trimmed)
  if not buffer_count then
    return 0
  end

  return math.max(0, math.floor(buffer_count + 0.0000001))
end

local function parse_station_priority(text)
  local trimmed = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if trimmed == "" then
    return 0
  end

  local priority = tonumber(trimmed)
  if not priority then
    return 0
  end

  return math.floor(priority + (priority >= 0 and 0.0000001 or -0.0000001))
end

local function station_priority_value(rec)
  return parse_station_priority(rec and rawget(rec, "priority") or 0)
end

function station_supply_buffer_count(rec)
  return parse_station_supply_buffer_count(rec and rawget(rec, "supply_buffer_count") or 0)
end

local function effective_station_priority_value(rec)
  if rec and rawget(rec, "effective_priority") ~= nil then
    return parse_station_priority(rawget(rec, "effective_priority"))
  end
  return station_priority_value(rec)
end

local function format_station_network_id(network_id)
  local numeric_network_id = tonumber(network_id) or 0
  return tostring(math.floor(numeric_network_id + (numeric_network_id >= 0 and 0.0000001 or -0.0000001)))
end

function freighter_network_hard_mode_enabled()
  return STARTUP_SETTINGS.startup_bool_value("ff-freighter-network-hard-mode") == true
end

local function parse_station_network_id(text)
  local trimmed = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if trimmed == "" then
    return 0
  end

  local network_id = tonumber(trimmed)
  if not network_id then
    return 0
  end

  return math.floor(network_id + (network_id >= 0 and 0.0000001 or -0.0000001))
end

local function station_network_id(rec)
  return parse_station_network_id(rec and rawget(rec, "network_id") or 0)
end

local function effective_station_network_id(rec)
  if rec and rawget(rec, "effective_network_id") ~= nil then
    return parse_station_network_id(rawget(rec, "effective_network_id"))
  end
  return station_network_id(rec)
end

function freighter_network_id(rec)
  return parse_station_network_id(rec and rawget(rec, "network_id") or 0)
end

local function station_uses_circuit_station_type(rec)
  return rec and rec.circuit_set_station_type == true or false
end

local function station_charge_rate_w(rec)
  local charge_rate_w = rec and rec.charge_rate_w or nil
  if not charge_rate_w or charge_rate_w <= 0 then
    return station_power.default_charge_rate_w
  end
  return charge_rate_w
end

local function station_charge_per_tick_j(rec)
  return math.max(0, math.floor((station_charge_rate_w(rec) / 60) + 0.5))
end

function station_transfer_progress_j(rec, required_energy_j)
  local capped_required_energy_j = math.max(0, required_energy_j or 0)
  local stored_progress_j = tonumber(rec and rawget(rec, "power_transfer_progress_j") or nil) or 0
  return math.max(0, math.min(capped_required_energy_j, stored_progress_j))
end

function set_station_transfer_progress_j(rec, progress_j, required_energy_j)
  if not rec then
    return 0
  end
  local capped_required_energy_j = math.max(0, required_energy_j or 0)
  local capped_progress_j = math.max(0, math.min(capped_required_energy_j, progress_j or 0))
  rec.power_transfer_progress_j = capped_progress_j > 0 and capped_progress_j or nil
  return capped_progress_j
end

local function station_charge_buffer_size_j(rec, stored_progress_j, required_energy_j)
  -- The helper EEI now uses its runtime buffer strictly as a one-tick intake
  -- window instead of as the long-term transfer progress store. The script keeps
  -- cumulative station charge progress on the stop record itself, harvests any
  -- joules the EEI absorbed since the previous tick, resets the EEI energy back
  -- to zero, and then reopens only one tick of empty buffer. That means a
  -- `10MW` station exposes about `166667J` of empty room each tick instead of a
  -- multi-megajoule burst window every `TICK_INTERVAL` ticks.
  local remaining_energy_j = math.max(0, math.max(0, required_energy_j or 0) - math.max(0, stored_progress_j or 0))
  return math.min(remaining_energy_j, station_charge_per_tick_j(rec))
end

function station_transfer_reason_matches_state(reason_key, state)
  if reason_key == "waiting-load" then
    return state == "waiting_load"
  end
  if reason_key == "waiting-unload" then
    return state == "waiting_unload"
  end
  if reason_key == "waiting-resupply" then
    return state == "waiting_resupply"
  end
  if reason_key == "waiting-force-dump" then
    return state == "waiting_force_dump"
  end
  return false
end

function station_transfer_required_energy_j(rec)
  local required_energy_j = tonumber(rec and rawget(rec, "power_transfer_required_j") or nil)
  if required_energy_j and required_energy_j > 0 then
    return required_energy_j
  end
  return station_action_energy_j(rec)
end

function station_transfer_owner_is_active(rec)
  local owner_unit_number = rec and rawget(rec, "power_transfer_owner_unit_number") or nil
  if not owner_unit_number then
    return false
  end

  local freighter = global.ff.freighters[owner_unit_number]
  if not freighter or not is_valid(freighter.entity) then
    return false
  end

  if freighter.target_station ~= rec.unit_number and freighter.source_station ~= rec.unit_number then
    return false
  end

  return station_transfer_reason_matches_state(rawget(rec, "power_transfer_reason"), freighter.state)
end

function count_freighters_on_network(network_id, cache)
  local normalized_network_id = parse_station_network_id(network_id)
  cache = cache or get_runtime_cycle_cache()
  local cached = cache.freighter_network_sizes[normalized_network_id]
  if cached ~= nil then
    return cached
  end

  local total = 0
  for _, freighter in pairs(global.ff.freighters or {}) do
    if is_valid(freighter and freighter.entity) and freighter_network_id(freighter) == normalized_network_id then
      total = total + 1
    end
  end

  cache.freighter_network_sizes[normalized_network_id] = total
  return total
end

function station_action_energy_j(rec)
  if not freighter_network_hard_mode_enabled() then
    return station_power.action_j
  end

  local network_size = count_freighters_on_network(effective_station_network_id(rec))
  return network_size * network_size * 1000000
end

function station_buffer_capacity_j(rec)
  if not freighter_network_hard_mode_enabled() then
    return station_power.buffer_j
  end

  return station_action_energy_j(rec)
end

local function effective_station_type(rec)
  if rec and (rec.effective_station_type == "supply" or rec.effective_station_type == "demand") then
    return rec.effective_station_type
  end
  return normalize_station_type(rec)
end

-- Route planning now lives in `runtime/routes.lua`, so publish the effective station
-- attribute helpers there instead of relying on `control.lua` local scope.
_ENV.effective_station_priority_value = effective_station_priority_value
_ENV.effective_station_network_id = effective_station_network_id
_ENV.effective_station_type = effective_station_type
_ENV.station_supply_buffer_count = station_supply_buffer_count

local function normalize_circuit_signal_id(value)
  return copy_signal_id(value)
end

local function station_circuit_type_signal(rec)
  return copy_signal_id(rawget(rec, "circuit_station_type_signal")) or copy_signal_id(CIRCUIT_SIGNAL_SUPPLY_DEMAND)
end

local function station_circuit_priority_signal(rec)
  return copy_signal_id(rawget(rec, "circuit_priority_signal")) or copy_signal_id(CIRCUIT_SIGNAL_PRIORITY)
end

local function station_circuit_network_signal(rec)
  return copy_signal_id(rawget(rec, "circuit_network_signal")) or copy_signal_id(CIRCUIT_SIGNAL_NETWORK_ID)
end

local function station_circuit_energy_signal(rec)
  return copy_signal_id(rawget(rec, "circuit_energy_signal")) or copy_signal_id(CIRCUIT_SIGNAL_ENERGY_MJ)
end

local function station_circuit_signal_count(signals, signal_id)
  if not signals or not signal_id then
    return nil, false
  end

  for _, signal in ipairs(signals) do
    local signal_ref = signal and signal.signal or nil
    if signal_ref and signal_ref.type == signal_id.type and signal_ref.name == signal_id.name then
      return tonumber(signal.count) or 0, true
    end
  end

  return nil, false
end

local function get_station_merged_circuit_signals(rec)
  local entity = rec and as_valid_entity(rec.entity) or nil
  if not entity then
    return nil
  end

  return entity.get_signals(defines.wire_connector_id.circuit_red, defines.wire_connector_id.circuit_green)
end

local function station_hidden_companion_context(rec)
  if not rec then
    return nil, nil, nil
  end

  local entity = rec.entity and rec.entity.valid and rec.entity or nil
  local surface = (entity and entity.surface) or game.surfaces[rec.surface_index]
  local force = (entity and entity.force) or game.forces[rec.force_name]
  local position = (entity and entity.position) or rec.position
  return surface, force, position
end

local function tracked_station_hidden_companion(unit_number, prototype_name)
  if not unit_number then
    return nil
  end

  local entity = game.get_entity_by_unit_number(unit_number)
  if entity and entity.valid and entity.name == prototype_name then
    return entity
  end

  return nil
end

local function choose_station_hidden_companion(candidates, tracked_unit_number)
  for _, candidate in ipairs(candidates or {}) do
    if candidate.valid and candidate.unit_number == tracked_unit_number then
      return candidate
    end
  end

  for _, candidate in ipairs(candidates or {}) do
    if candidate.valid then
      return candidate
    end
  end

  return nil
end

local function dedupe_station_hidden_companion_at_position(rec, prototype_name, tracked_unit_key)
  local surface, force, position = station_hidden_companion_context(rec)
  if not surface or not force or not position then
    if rec then
      rec[tracked_unit_key] = nil
    end
    return nil
  end

  local candidates = surface.find_entities_filtered{
    name = prototype_name,
    position = position,
    force = force,
  }
  local chosen = choose_station_hidden_companion(candidates, rec and rec[tracked_unit_key] or nil)

  -- Older saves and earlier helper-registration bugs could leave multiple hidden
  -- helper entities stacked on one station tile. Factorio still tries to render
  -- every one of those helpers even when their prototype graphics are the shared
  -- `__core__/graphics/empty.png`, so duplicate helpers become pure render waste.
  -- Keep one helper per prototype and destroy the rest as soon as we rediscover
  -- the station record so old saves heal themselves instead of carrying that cost.
  for _, candidate in ipairs(candidates or {}) do
    if candidate.valid and candidate ~= chosen then
      candidate.destroy()
    end
  end

  if rec then
    rec[tracked_unit_key] = chosen and chosen.unit_number or nil
  end
  return chosen
end

local function dedupe_station_hidden_companions(rec)
  if not rec then
    return
  end

  if not (is_valid(rec.entity) and rec.entity.get_inventory(defines.inventory.chest)) then
    dedupe_station_hidden_companion_at_position(rec, STATION_CARGO_NAME, "cargo_unit_number")
  end
  dedupe_station_hidden_companion_at_position(rec, STATION_POWER_NAME, "power_unit_number")
  dedupe_station_hidden_companion_at_position(rec, STATION_CIRCUIT_NAME, "circuit_unit_number")
end

local function get_station_circuit_control_entity(rec)
  if not rec then
    return nil
  end

  local circuit_entity = tracked_station_hidden_companion(rec.circuit_unit_number, STATION_CIRCUIT_NAME)
  if circuit_entity then
    return circuit_entity
  end

  return dedupe_station_hidden_companion_at_position(rec, STATION_CIRCUIT_NAME, "circuit_unit_number")
end

local function connect_station_circuit_entity(rec, circuit_entity)
  local station_entity = rec and as_valid_entity(rec.entity) or nil
  if not station_entity or not (circuit_entity and circuit_entity.valid) then
    return
  end

  local red_station = station_entity.get_wire_connector(defines.wire_connector_id.circuit_red, true)
  local red_output = circuit_entity.get_wire_connector(defines.wire_connector_id.combinator_output_red, true)
  if red_station and red_output then
    red_station.connect_to(red_output, false)
  end

  local green_station = station_entity.get_wire_connector(defines.wire_connector_id.circuit_green, true)
  local green_output = circuit_entity.get_wire_connector(defines.wire_connector_id.combinator_output_green, true)
  if green_station and green_output then
    green_station.connect_to(green_output, false)
  end
end

local function set_station_circuit_energy_output(rec, energy_mj)
  -- Energy output rides on a hidden constant combinator so the visible stop can
  -- stay a normal chest for optional engine-native inventory readout.
  local signal = station_circuit_energy_signal(rec)
  local normalized_energy_mj = math.max(0, math.floor((tonumber(energy_mj) or 0) + 0.0000001))
  if rec.last_circuit_energy_output_mj == normalized_energy_mj
    and rec.last_circuit_energy_signal_name == signal.name
    and rec.last_circuit_energy_signal_type == signal.type
  then
    return
  end

  local circuit_entity = ensure_station_circuit_entity(rec)
  if not circuit_entity or not circuit_entity.valid then
    return
  end

  local behavior = circuit_entity.get_or_create_control_behavior and circuit_entity.get_or_create_control_behavior() or circuit_entity.get_control_behavior()
  if not behavior or behavior.object_name ~= "LuaConstantCombinatorControlBehavior" then
    return
  end

  local section = behavior.sections and behavior.sections[1] or nil
  if not section then
    section = behavior.add_section()
  end
  if not section then
    return
  end

  section.filters = {
    {
      value = {
        type = signal.type,
        name = signal.name,
        quality = "normal",
        comparator = "=",
      },
      min = normalized_energy_mj,
    },
  }
  behavior.enabled = true
  rec.last_circuit_energy_output_mj = normalized_energy_mj
  rec.last_circuit_energy_signal_name = signal.name
  rec.last_circuit_energy_signal_type = signal.type
end

local function refresh_station_circuit_state(rec)
  if not rec then
    return
  end

  -- Stored GUI settings remain the authoritative fallback. Circuit signals only
  -- provide live overrides for the specific reserved controls below.
  local previous_effective_type = effective_station_type(rec)
  local previous_effective_network_id = effective_station_network_id(rec)

  local stored_type = normalize_station_type(rec)
  local stored_priority = station_priority_value(rec)
  local stored_network_id = station_network_id(rec)
  local effective_type = stored_type
  local effective_priority = stored_priority
  local effective_network_id_value = stored_network_id

  -- Most stops are not wired into a real player-visible circuit network. In
  -- that common case, skip the signal read entirely and fall straight back to
  -- the saved GUI settings while still maintaining the energy output.
  local merged_signals = station_has_external_circuit_wires(rec) and get_station_merged_circuit_signals(rec) or nil
  local type_count, has_type_signal = station_circuit_signal_count(merged_signals, station_circuit_type_signal(rec))
  local priority_count, has_priority_signal = station_circuit_signal_count(merged_signals, station_circuit_priority_signal(rec))
  local network_id_count, has_network_signal = station_circuit_signal_count(merged_signals, station_circuit_network_signal(rec))

  if station_uses_circuit_station_type(rec) then
    -- The selected signed signal controls the live stop role: positive counts
    -- mean Supply, negative counts mean Demand, and zero or absence fall back
    -- to the saved station type.
    local type_value = tonumber(type_count) or 0
    if has_type_signal and type_value < 0 then
      effective_type = "demand"
    elseif has_type_signal and type_value > 0 then
      effective_type = "supply"
    end
  end

  if has_priority_signal then
    effective_priority = parse_station_priority(priority_count)
  end
  if has_network_signal then
    effective_network_id_value = parse_station_network_id(network_id_count)
  end

  rec.effective_station_type = effective_type
  rec.effective_priority = effective_priority
  rec.effective_network_id = effective_network_id_value

  local energy_mj = math.floor(math.max(0, (rec.last_power_energy_j or 0) / 1000000) + 0.0000001)
  set_station_circuit_energy_output(rec, energy_mj)

  if previous_effective_type ~= effective_type or previous_effective_network_id ~= effective_network_id_value then
    update_station_label(rec.unit_number)
  end
end

function runtime_global_table()
  local storage_table = rawget(_G, "storage")
  if storage_table ~= nil then
    _G.global = storage_table
    return storage_table
  end

  local global_table = rawget(_G, "global")
  if global_table == nil then
    global_table = {}
    _G.global = global_table
  end
  return global_table
end

function runtime_prototypes_table()
  return rawget(_G, "prototypes")
end

function item_prototypes_table()
  local runtime_prototypes = runtime_prototypes_table()
  return runtime_prototypes and runtime_prototypes.item or nil
end

function fluid_prototypes_table()
  local runtime_prototypes = runtime_prototypes_table()
  return runtime_prototypes and runtime_prototypes.fluid or nil
end

function entity_prototypes_table()
  local runtime_prototypes = runtime_prototypes_table()
  return runtime_prototypes and runtime_prototypes.entity or nil
end

function virtual_signal_prototypes_table()
  local runtime_prototypes = runtime_prototypes_table()
  return runtime_prototypes and runtime_prototypes.virtual_signal or nil
end

function has_item_prototype(item_name)
  local item_prototypes = item_prototypes_table()
  return item_prototypes and item_prototypes[item_name] ~= nil
end

function normalize_signal_quality_id(quality)
  if type(quality) == "string" then
    return quality ~= "" and quality or nil
  end

  if type(quality) == "table" and type(quality.name) == "string" and quality.name ~= "" then
    -- Some runtime sources can hand quality-bearing IDs around as prototype-like
    -- tables instead of raw names. Normalize both shapes up front so station
    -- signal settings do not silently shed quality during GUI save/apply flows.
    return quality.name
  end

  return nil
end

function has_signal_prototype(signal)
  if type(signal) ~= "table" or type(signal.name) ~= "string" then
    return false
  end

  if signal.type == "item" then
    local item_prototypes = item_prototypes_table()
    return item_prototypes and item_prototypes[signal.name] ~= nil
  end
  if signal.type == "fluid" then
    local fluid_prototypes = fluid_prototypes_table()
    return fluid_prototypes and fluid_prototypes[signal.name] ~= nil
  end
  if signal.type == "virtual" then
    local virtual_signal_prototypes = virtual_signal_prototypes_table()
    return virtual_signal_prototypes and virtual_signal_prototypes[signal.name] ~= nil
  end
  if signal.type == "entity" then
    local entity_prototypes = entity_prototypes_table()
    return entity_prototypes and entity_prototypes[signal.name] ~= nil
  end

  return false
end

function infer_signal_type_from_name(signal_name)
  if type(signal_name) ~= "string" or signal_name == "" then
    return nil
  end

  local item_prototypes = item_prototypes_table()
  if item_prototypes and item_prototypes[signal_name] ~= nil then
    return "item"
  end

  local fluid_prototypes = fluid_prototypes_table()
  if fluid_prototypes and fluid_prototypes[signal_name] ~= nil then
    return "fluid"
  end

  local virtual_signal_prototypes = virtual_signal_prototypes_table()
  if virtual_signal_prototypes and virtual_signal_prototypes[signal_name] ~= nil then
    return "virtual"
  end

  local entity_prototypes = entity_prototypes_table()
  if entity_prototypes and entity_prototypes[signal_name] ~= nil then
    return "entity"
  end

  return nil
end

function copy_signal_id(signal)
  if type(signal) ~= "table" or type(signal.name) ~= "string" then
    return nil
  end

  local signal_type = type(signal.type) == "string" and signal.type or infer_signal_type_from_name(signal.name)
  if type(signal_type) ~= "string" then
    return nil
  end

  local copied_signal = {
    type = signal_type,
    name = signal.name,
  }
  local signal_quality = normalize_signal_quality_id(signal.quality)
  if signal_quality then
    -- Quality-bearing item signals must round-trip through tags, blueprint payloads,
    -- and normalized route keys without silently collapsing back to normal quality.
    copied_signal.quality = signal_quality
  end
  return copied_signal
end

function is_rampant_capsule_ammo_name(item_name)
  return type(item_name) == "string"
    and item_name:match("%-capsule%-ammo%-rampant%-arsenal$") ~= nil
end

function ensure_state()
  local runtime_global = runtime_global_table()
  runtime_global.ff = runtime_global.ff or {}
  runtime_global.ff.artist_join_notice_shown = runtime_global.ff.artist_join_notice_shown or {}
  runtime_global.ff.stations = runtime_global.ff.stations or {}
  runtime_global.ff.freighters = runtime_global.ff.freighters or {}
  runtime_global.ff.active_routes = runtime_global.ff.active_routes or {}
  runtime_global.ff.station_units_by_name = runtime_global.ff.station_units_by_name or {}
  runtime_global.ff.demand_station_units_by_name = runtime_global.ff.demand_station_units_by_name or {}
  runtime_global.ff.fuel_station_units = runtime_global.ff.fuel_station_units or {}
  runtime_global.ff.ammo_station_units = runtime_global.ff.ammo_station_units or {}
  runtime_global.ff.trash_station_units = runtime_global.ff.trash_station_units or {}
  runtime_global.ff.player_edit = runtime_global.ff.player_edit or {}
  runtime_global.ff.station_labels = runtime_global.ff.station_labels or {}
  runtime_global.ff.station_tags = runtime_global.ff.station_tags or {}
  runtime_global.ff.capsule_ammo_priority = runtime_global.ff.capsule_ammo_priority or {}
  runtime_global.ff.capsule_ammo_set = runtime_global.ff.capsule_ammo_set or {}
  runtime_global.ff.stop_warning_tick = runtime_global.ff.stop_warning_tick or {}
  runtime_global.ff.empty_route_warning_tick = runtime_global.ff.empty_route_warning_tick or {stations = {}, freighters = {}}
  runtime_global.ff.cleanup_dirty = runtime_global.ff.cleanup_dirty ~= false
  runtime_global.ff.player_map_choices = runtime_global.ff.player_map_choices or {}
  runtime_global.ff.player_schedule_drag = runtime_global.ff.player_schedule_drag or {}
  runtime_global.ff.player_station_request_group_choices = runtime_global.ff.player_station_request_group_choices or {}
  runtime_global.ff.pending_player_open = runtime_global.ff.pending_player_open or {}
  runtime_global.ff.player_station_cargo_context = runtime_global.ff.player_station_cargo_context or {}
  runtime_global.ff.open_config_conflict_warning_shown = runtime_global.ff.open_config_conflict_warning_shown or {}
  runtime_global.ff.noop_power_drain_warning_tick = runtime_global.ff.noop_power_drain_warning_tick or {}
  runtime_global.ff.unexpected_power_drain_warning_tick = runtime_global.ff.unexpected_power_drain_warning_tick or {}
  runtime_global.ff.active_station_power_units = runtime_global.ff.active_station_power_units or {}
  runtime_global.ff.inbound_reservations = runtime_global.ff.inbound_reservations or {}
  if not runtime_global.ff.station_units_by_tick_bucket then
    runtime_global.ff.station_units_by_tick_bucket = create_tick_bucket_sets()
    for unit_number in pairs(runtime_global.ff.stations) do
      add_unit_to_tick_bucket(runtime_global.ff.station_units_by_tick_bucket, unit_number)
    end
  end
  if not runtime_global.ff.freighter_units_by_tick_bucket then
    runtime_global.ff.freighter_units_by_tick_bucket = create_tick_bucket_sets()
    for unit_number in pairs(runtime_global.ff.freighters) do
      add_unit_to_tick_bucket(runtime_global.ff.freighter_units_by_tick_bucket, unit_number)
    end
  end
  if runtime_global.ff.active_station_power_units_built ~= true then
    runtime_global.ff.active_station_power_units = {}
    for unit_number, rec in pairs(runtime_global.ff.stations) do
      if rec and station_transfer_owner_is_active(rec) then
        runtime_global.ff.active_station_power_units[unit_number] = true
      end
    end
    runtime_global.ff.active_station_power_units_built = true
  end
  if runtime_global.ff.inbound_reservations_built ~= true then
    runtime_global.ff.inbound_reservations = {}
    for _, freighter in pairs(runtime_global.ff.freighters) do
      if freighter_has_inbound_reservation(freighter) then
        add_inbound_reservation_manifest(freighter.target_station, effective_freighter_inbound_manifest(freighter))
      end
      sync_freighter_cargo_summary_from_manifest(freighter, effective_freighter_cargo_manifest(freighter))
    end
    runtime_global.ff.inbound_reservations_built = true
  end
  if runtime_global.ff.needs_entity_rescan == nil then
    runtime_global.ff.needs_entity_rescan = true
  end
end

function rebuild_capsule_ammo_catalog()
  ensure_state()
  global.ff.capsule_ammo_priority = {}
  global.ff.capsule_ammo_set = {}
  local item_prototypes = item_prototypes_table() or {}

  local function add_capsule_ammo(item_name)
    if not is_rampant_capsule_ammo_name(item_name) or not has_item_prototype(item_name) then
      return
    end
    if global.ff.capsule_ammo_set[item_name] then
      return
    end
    global.ff.capsule_ammo_set[item_name] = true
    global.ff.capsule_ammo_priority[#global.ff.capsule_ammo_priority + 1] = item_name
  end

  for _, item_name in ipairs(BASE_CAPSULE_AMMO_PRIORITY) do
    add_capsule_ammo(item_name)
  end
  for item_name, _ in pairs(item_prototypes) do
    add_capsule_ammo(item_name)
  end
  if #global.ff.capsule_ammo_priority == 0 then
    for _, item_name in ipairs({
      "atomic-bomb",
      "explosive-rocket",
      "rocket",
      "explosive-uranium-cannon-shell",
      "uranium-cannon-shell",
      "explosive-cannon-shell",
      "cannon-shell",
    }) do
      if has_item_prototype(item_name) and not global.ff.capsule_ammo_set[item_name] then
        global.ff.capsule_ammo_set[item_name] = true
        global.ff.capsule_ammo_priority[#global.ff.capsule_ammo_priority + 1] = item_name
      end
    end
  end
end

function is_valid(entity)
  return entity and entity.valid
end

local function entity_marked_for_deconstruction(entity)
  if not is_valid(entity) then
    return false
  end

  local to_be_deconstructed = entity.to_be_deconstructed
  if type(to_be_deconstructed) ~= "function" then
    return false
  end

  local ok, marked = pcall(to_be_deconstructed, entity, entity.force)
  if ok then
    return marked and true or false
  end

  local first_error = marked
  ok, marked = pcall(to_be_deconstructed, entity)
  if ok then
    return marked and true or false
  end

  throttled_diagnostic_log(
    "entity_marked_for_deconstruction_warning_tick",
    tostring(entity.unit_number or entity.name or "nil"),
    {
      tag = "ff-entity-marked-for-deconstruction-warning",
      tick = game and game.tick or nil,
      entity_name = entity.name,
      entity_unit_number = entity.unit_number,
      first_error_message = first_error,
      second_error_message = marked,
    }
  )

  return false
end

function as_valid_entity(lua_object)
  if lua_object and lua_object.valid and lua_object.object_name == "LuaEntity" then
    return lua_object
  end
  return nil
end

function as_valid_render_object(lua_object)
  if lua_object == nil then
    return nil
  end

  if type(lua_object) == "number" then
    local render_object = rendering and rendering.get_object_by_id(lua_object) or nil
    if render_object and render_object.valid then
      return render_object
    end
    return nil
  end

  if lua_object.valid and lua_object.object_name == "LuaRenderObject" then
    return lua_object
  end

  return nil
end

function destroy_render_object(lua_object)
  local render_object = as_valid_render_object(lua_object)
  if render_object then
    render_object.destroy()
    return true
  end
  return false
end

function freighter_is_full_health(entity)
  if not is_valid(entity) then
    return false
  end
  local max_health = entity.max_health or 0
  local health = entity.health or max_health
  if max_health <= 0 then
    return true
  end
  return health >= (max_health - 0.001)
end

function try_freighter_teleport(entity, position)
  if not freighter_is_full_health(entity) then
    return false
  end
  entity.teleport(position)
  return true
end

function is_freighter_station_name(name)
  return name == STATION_NAME or name == PASSIVE_PROVIDER_STATION_NAME
end

function freighter_station_entity_names()
  return {STATION_NAME, PASSIVE_PROVIDER_STATION_NAME}
end

function get_inventory(entity)
  if not is_valid(entity) then
    return nil
  end
  if is_freighter_station_name(entity.name) then
    local direct_inventory = entity.get_inventory(defines.inventory.chest)
    if direct_inventory then
      return direct_inventory
    end
    local rec = get_station_record_by_entity(entity)
    if not rec then
      return nil
    end
    local cargo_entity = ensure_station_cargo_entity(rec)
    return cargo_entity and cargo_entity.get_inventory(defines.inventory.chest) or nil
  end
  return entity.get_inventory(defines.inventory.chest)
end

function get_freighter_inventory(entity)
  if not is_valid(entity) then
    return nil
  end
  local inv = entity.get_inventory(defines.inventory.spider_trunk)
  if inv then
    return inv
  end
  inv = entity.get_inventory(defines.inventory.spider_trash)
  if inv then
    return inv
  end
  inv = entity.get_inventory(defines.inventory.car_trunk)
  if inv then
    return inv
  end
  return entity.get_inventory(defines.inventory.chest)
end

function get_freighter_fuel_inventory(entity)
  if not is_valid(entity) then
    return nil
  end
  if entity.get_fuel_inventory then
    return entity.get_fuel_inventory()
  end
  return entity.get_inventory(defines.inventory.fuel)
end

function selected_new_freighter_fuel_item_name()
  local setting = settings and settings.global and settings.global["ff-new-freighter-fuel"] or nil
  local fuel_item_name = setting and setting.value or "coal"
  if type(fuel_item_name) ~= "string" or fuel_item_name == "" or fuel_item_name == "none" then
    return nil
  end
  if not has_item_prototype(fuel_item_name) then
    return nil
  end

  local item_prototype = item_prototypes_table() and item_prototypes_table()[fuel_item_name] or nil
  if not item_prototype or (item_prototype.fuel_value or 0) <= 0 then
    return nil
  end

  return fuel_item_name
end

function freighter_startup_fuel_request_member_index(entity)
  if not is_valid(entity) then
    return nil
  end
  if entity.type == "spider-vehicle" then
    return defines.logistic_member_index.spidertron_requester
  end
  if entity.type == "car" then
    return defines.logistic_member_index.car_requester
  end
  return nil
end

function freighter_startup_fuel_request_point(entity)
  if not is_valid(entity) or not entity.get_logistic_point then
    return nil
  end
  local member_index = freighter_startup_fuel_request_member_index(entity)
  if not member_index then
    return nil
  end
  local logistic_point = entity.get_logistic_point(member_index)
  if logistic_point and logistic_point.valid then
    return logistic_point
  end
  return nil
end

function find_freighter_startup_fuel_request_section(logistic_point)
  if not (logistic_point and logistic_point.valid) then
    return nil
  end
  for _, section in pairs(logistic_point.sections or {}) do
    if section and section.valid and section.is_manual and section.group == "ff-startup-fuel" then
      return section
    end
  end
  return nil
end

function freighter_startup_fuel_request_proxy(entity)
  if not is_valid(entity) then
    return nil
  end
  local proxy = entity.item_request_proxy
  if proxy and proxy.valid and proxy.name == "item-request-proxy" then
    return proxy
  end
  return nil
end

function clear_freighter_startup_fuel_request(entity)
  local cleared = false

  local proxy = freighter_startup_fuel_request_proxy(entity)
  if proxy then
    proxy.destroy()
    cleared = true
  end

  local logistic_point = freighter_startup_fuel_request_point(entity)
  if logistic_point then
    local section = find_freighter_startup_fuel_request_section(logistic_point)
    if section then
      section.clear_slot(1)
      if logistic_point.remove_section(section.index) then
        cleared = true
      end
    end
  end

  return cleared
end

function freighter_has_any_fuel(entity)
  local fuel_inventory = get_freighter_fuel_inventory(entity)
  if not fuel_inventory then
    return false
  end
  for _, count in pairs(get_inventory_name_counts(fuel_inventory)) do
    if count > 0 then
      return true
    end
  end
  return false
end

function try_seed_new_freighter_with_setting_fuel(entity)
  if not is_valid(entity) or entity.name ~= FREIGHTER_NAME then
    return
  end

  local fuel_item_name = selected_new_freighter_fuel_item_name()
  if not fuel_item_name then
    clear_freighter_startup_fuel_request(entity)
    return
  end

  local fuel_inventory = get_freighter_fuel_inventory(entity)
  if not fuel_inventory then
    clear_freighter_startup_fuel_request(entity)
    return
  end

  -- Preserve any existing burner contents. This setting is only meant to bootstrap
  -- an empty newly built or revived freighter, not overwrite a loadout that another
  -- script, migration, or future construction path supplied.
  if freighter_has_any_fuel(entity) then
    clear_freighter_startup_fuel_request(entity)
    return
  end

  local insertable_count = fuel_inventory.get_insertable_count(fuel_item_name)
  if insertable_count <= 0 then
    clear_freighter_startup_fuel_request(entity)
    return
  end

  local amount_to_request = math.min(insertable_count, item_stack_size(fuel_item_name))
  if amount_to_request <= 0 then
    clear_freighter_startup_fuel_request(entity)
    return
  end

  local surface = entity.surface
  if not (surface and surface.valid) then
    return
  end

  clear_freighter_startup_fuel_request(entity)

  local proxy = surface.create_entity({
    name = "item-request-proxy",
    position = entity.position,
    force = entity.force,
    target = entity,
    modules = {
      {
        id = {name = fuel_item_name, quality = "normal"},
        items = {
          in_inventory = {
            {
              inventory = defines.inventory.fuel,
              stack = 0,
              count = amount_to_request,
            },
          },
        },
      },
    },
  })
  if not (proxy and proxy.valid) then
    return
  end
end

function clear_freighter_startup_fuel_request_if_satisfied(freighter)
  if not freighter or not is_valid(freighter.entity) then
    return
  end
  if not selected_new_freighter_fuel_item_name() or freighter_has_any_fuel(freighter.entity) then
    clear_freighter_startup_fuel_request(freighter.entity)
  end
end

function get_freighter_burner(entity)
  if not is_valid(entity) then
    return nil
  end
  return entity.burner
end

function get_freighter_ammo_inventory(entity)
  if not is_valid(entity) then
    return nil
  end
  local inv = entity.get_inventory(defines.inventory.spider_ammo)
  if inv then
    return inv
  end
  inv = entity.get_inventory(defines.inventory.car_ammo)
  if inv then
    return inv
  end
  return nil
end

function get_station_record_by_entity(entity)
  if not is_valid(entity) then
    return nil
  end
  local rec = global.ff.stations[entity.unit_number]
  if rec then
    return rec
  end
  if entity.name == STATION_CARGO_NAME then
    for _, candidate in pairs(global.ff.stations) do
      if candidate and candidate.cargo_unit_number == entity.unit_number then
        return candidate
      end
    end
  end
  return nil
end

local function station_entity_from_target(entity)
  local target = as_valid_entity(entity)
  if not target then
    return nil
  end
  if is_freighter_station_name(target.name) then
    return target
  end
  if target.name == STATION_CARGO_NAME then
    local rec = get_station_record_by_entity(target)
    return rec and as_valid_entity(rec.entity) or nil
  end
  return nil
end

local function is_station_ghost_target(entity)
  local target = as_valid_entity(entity)
  return target ~= nil and target.name == "entity-ghost" and is_freighter_station_name(target.ghost_name)
end

local function is_freighter_ghost_target(entity)
  local target = as_valid_entity(entity)
  return target ~= nil and target.name == "entity-ghost" and target.ghost_name == FREIGHTER_NAME
end

function throttled_diagnostic_log(bucket_name, warning_key, payload, interval_ticks)
  if not game then
    return
  end

  global.ff[bucket_name] = global.ff[bucket_name] or {}
  local interval = tonumber(interval_ticks) or (60 * 10)
  local last_warning_tick = global.ff[bucket_name][warning_key] or -interval
  if game.tick - last_warning_tick < interval then
    return
  end

  global.ff[bucket_name][warning_key] = game.tick
  log(serpent.line(payload))
end

function safe_entity_backer_name(entity, context_key)
  if not is_valid(entity) then
    return nil
  end

  local ok, value = pcall(function() return entity.backer_name end)
  if ok then
    return (type(value) == "string" and value ~= "") and value or nil
  end

  throttled_diagnostic_log(
    "entity_backer_name_read_warning_tick",
    tostring(context_key or "read") .. ":" .. tostring(entity.unit_number or entity.name or "nil"),
    {
      tag = "ff-entity-backer-name-read-warning",
      tick = game.tick,
      context = context_key,
      entity_name = entity.name,
      entity_unit_number = entity.unit_number,
      error_message = value,
    }
  )
  return nil
end

function try_set_entity_backer_name(entity, value, context_key)
  if not is_valid(entity) or type(value) ~= "string" then
    return false
  end

  local ok, err = pcall(function()
    entity.backer_name = value
  end)
  if ok then
    return true
  end

  throttled_diagnostic_log(
    "entity_backer_name_write_warning_tick",
    tostring(context_key or "write") .. ":" .. tostring(entity.unit_number or entity.name or "nil"),
    {
      tag = "ff-entity-backer-name-write-warning",
      tick = game.tick,
      context = context_key,
      entity_name = entity.name,
      entity_unit_number = entity.unit_number,
      error_message = err,
    }
  )
  return false
end

local function station_edit_settings_from_tags(tags)
  local settings = type(tags) == "table" and type(tags.ff_station_settings) == "table" and tags.ff_station_settings or nil
  local tagged_demand_requests = nil
  if settings and type(settings.demand_requests) == "table" then
    tagged_demand_requests = settings.demand_requests
  end
  local rec = {
    route_signal = copy_signal_id(route_signal_from_value_or_nil(settings and settings.route_signal or nil)),
    route_signal_key = nil,
    route_signal_explicitly_empty = false,
    station_type = settings and settings.station_type == "demand" and "demand" or "supply",
    -- Complex demand requests are currently kept in a disabled work-in-progress
    -- state for public builds, so migrated ghost/station settings always reopen
    -- in the simple drop-off mode until the feature is finished in a later update.
    use_complex_demands = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED and settings and settings.use_complex_demands == true or false,
    demand_requests = normalize_station_request_manifest(tagged_demand_requests),
    demand_request_group = normalize_station_request_group_name(settings and settings.demand_request_group or nil),
    is_fuel_stop = settings and settings.is_fuel_stop and true or false,
    is_ammo_stop = settings and settings.is_ammo_stop and true or false,
    is_trash_stop = settings and settings.is_trash_stop and true or false,
    circuit_set_station_type = settings and settings.circuit_set_station_type and true or false,
    circuit_station_type_signal = normalize_circuit_signal_id(settings and settings.circuit_station_type_signal or nil),
    circuit_priority_signal = normalize_circuit_signal_id(settings and settings.circuit_priority_signal or nil),
    circuit_network_signal = normalize_circuit_signal_id(settings and settings.circuit_network_signal or nil),
    circuit_energy_signal = normalize_circuit_signal_id(settings and settings.circuit_energy_signal or nil),
    charge_rate_w = nil,
    priority = 0,
    supply_buffer_count = 0,
    network_id = 0,
  }
  local tagged_charge_rate_w = tonumber(settings and settings.charge_rate_w or nil)
  rec.charge_rate_w = (tagged_charge_rate_w and tagged_charge_rate_w > 0) and tagged_charge_rate_w or nil
  rec.priority = parse_station_priority(settings and settings.priority or 0)
  rec.supply_buffer_count = parse_station_supply_buffer_count(settings and settings.supply_buffer_count or 0)
  rec.network_id = parse_station_network_id(settings and settings.network_id or 0)
  sync_station_route_signal_fields(rec)
  return rec
end

local function freighter_edit_settings_from_tags(tags)
  local settings = type(tags) == "table" and type(tags.ff_freighter_settings) == "table" and tags.ff_freighter_settings or nil
  local tagged_schedule = nil
  if settings and type(settings.schedule) == "table" then
    tagged_schedule = settings.schedule
  end
  local rec = {
    schedule = copy_freighter_schedule_entries(tagged_schedule or {
      {
        operation = settings and settings.operation or nil,
        from_signal = settings and settings.from_signal or nil,
        to_signal = settings and settings.to_signal or nil,
      },
    }),
    schedule_current_index = tonumber(settings and settings.schedule_current_index or 1) or 1,
    from_signal_key = normalize_freighter_route_signal_key(settings and settings.from_signal or nil),
    to_signal_key = normalize_freighter_route_signal_key(settings and settings.to_signal or nil),
    pending_from_signal_key = nil,
    pending_to_signal_key = nil,
    network_id = parse_station_network_id(settings and settings.network_id or 0),
    force_route_now = false,
    force_waiting_for_trash = false,
  }
  sync_freighter_route_signal_fields(rec)
  return rec
end

local function set_player_station_cargo_context(player_index, station_ref)
  if not player_index then
    return
  end

  local station_entity = station_entity_from_target(station_ref)
  if station_entity then
    global.ff.player_station_cargo_context[player_index] = station_entity.unit_number
    return
  end

  if type(station_ref) == "table" and station_ref.unit_number then
    global.ff.player_station_cargo_context[player_index] = station_ref.unit_number
    return
  end

  global.ff.player_station_cargo_context[player_index] = nil
end

local function get_player_station_cargo_context_entity(player)
  if not player then
    return nil
  end

  local unit_number = global.ff.player_station_cargo_context[player.index]
  local rec = unit_number and global.ff.stations[unit_number] or nil
  return rec and as_valid_entity(rec.entity) or nil
end

local function resolve_config_target_entity(player, entity)
  local target = station_entity_from_target(entity) or as_valid_entity(entity)
  if target then
    return target
  end

  target = player and (station_entity_from_target(player.selected) or as_valid_entity(player.selected)) or nil
  if target then
    return target
  end

  local opened = player and player.opened or nil
  if opened and opened.valid and opened.object_name == "LuaEntity" then
    target = station_entity_from_target(opened) or as_valid_entity(opened)
    if target then
      return target
    end
  end

  if player and player.opened and player.opened.valid and player.opened_gui_type ~= defines.gui_type.none then
    target = get_player_station_cargo_context_entity(player)
    if target then
      return target
    end
  end

  return nil
end

function default_backer_name(unit_number, fallback_prefix)
  local names = game and game.backer_names
  if names and #names > 0 then
    local idx = (tonumber(unit_number) or 1) % #names + 1
    return names[idx]
  end
  return (fallback_prefix or "Name") .. " " .. tostring(unit_number or "")
end

function freighter_runtime_name(entity, unit_number)
  if is_valid(entity) then
    local name = safe_entity_backer_name(entity, "freighter-runtime-name")
    if name then
      return name
    end
  end
  return default_backer_name(unit_number, "Freighter")
end

function default_stop_name(unit_number)
  return default_backer_name(unit_number, "Stop")
end

function default_route_name(unit_number)
  return default_backer_name(unit_number, "Route")
end

function default_route_signal_prototype_name()
  local item_prototypes = item_prototypes_table() or {}
  if has_item_prototype("iron-plate") then
    return "iron-plate"
  end
  if has_item_prototype("copper-plate") then
    return "copper-plate"
  end
  for item_name, _ in pairs(item_prototypes) do
    return item_name
  end
  return "iron-plate"
end

function default_route_signal()
  return {type = "item", name = default_route_signal_prototype_name()}
end

function signal_type_image_prefix(signal_type)
  if signal_type == "virtual" then
    return "virtual-signal"
  end
  if signal_type == "entity" then
    return "entity"
  end
  return signal_type or "item"
end

function route_signal_key(signal)
  if type(signal) ~= "table" or type(signal.name) ~= "string" or type(signal.type) ~= "string" then
    return nil
  end
  local signal_key = signal.type .. "/" .. signal.name
  local signal_quality = normalize_signal_quality_id(signal.quality)
  if signal_quality then
    -- Encode quality directly into the normalized route key so different-quality item
    -- signals do not alias to the same station or schedule route.
    signal_key = signal_key .. "|" .. signal_quality
  end
  return signal_key
end

function route_signal_from_value(value)
  if type(value) == "table" then
    local signal = copy_signal_id(value)
    if has_signal_prototype(signal) then
      return signal
    end
  elseif type(value) == "string" then
    local signal_type, signal_name, signal_quality = value:match("^([^/]+)/([^|]+)|(.+)$")
    if signal_type == nil then
      signal_type, signal_name = value:match("^([^/]+)/(.+)$")
    end
    if (signal_type == "item" or signal_type == "fluid" or signal_type == "virtual" or signal_type == "entity") and signal_name then
      local signal = {type = signal_type, name = signal_name}
      if type(signal_quality) == "string" and signal_quality ~= "" then
        signal.quality = signal_quality
      end
      if has_signal_prototype(signal) then
        return signal
      end
    elseif has_item_prototype(value) then
      return {type = "item", name = value}
    else
      local entity_prototypes = entity_prototypes_table()
      if entity_prototypes and entity_prototypes[value] ~= nil then
        return {type = "entity", name = value}
      end
    end
  end

  return default_route_signal()
end

function route_signal_from_value_or_nil(value)
  if type(value) == "table" then
    local signal = copy_signal_id(value)
    if has_signal_prototype(signal) then
      return signal
    end
    return nil
  end

  if type(value) ~= "string" then
    return nil
  end

  local signal_type, signal_name, signal_quality = value:match("^([^/]+)/([^|]+)|(.+)$")
  if signal_type == nil then
    signal_type, signal_name = value:match("^([^/]+)/(.+)$")
  end
  if (signal_type == "item" or signal_type == "fluid" or signal_type == "virtual" or signal_type == "entity") and signal_name then
    local signal = {type = signal_type, name = signal_name}
    if type(signal_quality) == "string" and signal_quality ~= "" then
      signal.quality = signal_quality
    end
    if has_signal_prototype(signal) then
      return signal
    end
  end

  if has_item_prototype(value) then
    return {type = "item", name = value}
  end

  local fluid_prototypes = fluid_prototypes_table()
  if fluid_prototypes and fluid_prototypes[value] then
    return {type = "fluid", name = value}
  end

  local virtual_signal_prototypes = virtual_signal_prototypes_table()
  if virtual_signal_prototypes and virtual_signal_prototypes[value] then
    return {type = "virtual", name = value}
  end

  local entity_prototypes = entity_prototypes_table()
  if entity_prototypes and entity_prototypes[value] then
    return {type = "entity", name = value}
  end

  return nil
end

function try_parse_legacy_station_signal(value)
  local direct = route_signal_from_value_or_nil(value)
  if direct then
    return direct
  end

  if type(value) ~= "string" then
    return nil
  end

  local normalized = tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if normalized == "" then
    return nil
  end

  normalized = normalized:gsub("^%[img=[^%]]+%]%s*", "")
  normalized = normalized:gsub("%s+%b[]", "")
  normalized = normalized:gsub("%s+Supply$", "")
  normalized = normalized:gsub("%s+Demand$", "")
  normalized = tostring(normalized or ""):gsub("^%s+", ""):gsub("%s+$", "")

  local parsed = route_signal_from_value_or_nil(normalized)
  if parsed then
    return parsed
  end

  local qualified_name, qualified_quality = normalized:match("^([^%s]+)%s+%[([^%]]+)%]$")
  if qualified_name and qualified_quality then
    local qualified_signal = route_signal_from_value_or_nil(qualified_name)
    local normalized_quality = normalize_signal_quality_id(qualified_quality)
    if qualified_signal and normalized_quality then
      qualified_signal.quality = normalized_quality
      if has_signal_prototype(qualified_signal) then
        -- Station backer names and chart tags intentionally include a compact
        -- `[quality]` suffix for non-normal signals so reopening a saved stop can
        -- reconstruct the exact route signal even if older data only preserved the
        -- human-readable station name field.
        return qualified_signal
      end
    end
  end

  local first_token = normalized:match("^([^%s]+)")
  if first_token then
    return route_signal_from_value_or_nil(first_token)
  end

  return nil
end

function normalize_route_signal_key(value)
  return route_signal_key(route_signal_from_value(value))
end

function normalize_route_signal_key_or_nil(value)
  return route_signal_key(route_signal_from_value_or_nil(value))
end

function localised_signal_name(signal)
  if type(signal) ~= "table" or type(signal.name) ~= "string" then
    return "?"
  end

  local base_name
  if signal.type == "entity" then
    base_name = {"entity-name." .. signal.name}
  elseif signal.type == "fluid" then
    base_name = {"fluid-name." .. signal.name}
  elseif signal.type == "virtual" then
    base_name = {"virtual-signal-name." .. signal.name}
  else
    base_name = {"item-name." .. signal.name}
  end

  local signal_quality = normalize_signal_quality_id(signal.quality)
  if signal_quality and signal_quality ~= "normal" then
    return {"", base_name, " [", {"quality-name." .. signal_quality}, "]"}
  end

  return base_name
end

function plain_signal_label(signal)
  if type(signal) ~= "table" or type(signal.name) ~= "string" then
    return "?"
  end

  local signal_quality = normalize_signal_quality_id(signal.quality)
  if signal_quality and signal_quality ~= "normal" then
    -- Use the raw quality ID in brackets so the generated station backer name stays
    -- compact for players while also remaining machine-parseable during legacy name
    -- recovery and migration paths.
    return signal.name .. " [" .. signal_quality .. "]"
  end

  return signal.name
end

function rich_text_for_signal(signal)
  local normalized = route_signal_from_value(signal)
  if not normalized then
    normalized = default_route_signal()
  end
  return "[img=" .. signal_type_image_prefix(normalized.type) .. "/" .. normalized.name .. "]"
end

function route_signal_display_text(value)
  local signal = route_signal_from_value_or_nil(value)
  if not signal then
    return {"ff.empty_route_signal"}
  end
  return {"", rich_text_for_signal(signal), " ", localised_signal_name(signal)}
end

-- Schedule summaries are rendered as Factorio localised strings, so they must
-- compose child localised fragments inside an array instead of Lua string
-- concatenation.
function route_arrow_summary_text(from_value, to_value)
  return {"", route_signal_display_text(from_value), " -> ", route_signal_display_text(to_value)}
end

function debug_signal_value_text(value)
  if type(value) == "table" then
    local quality_suffix = ""
    local signal_quality = normalize_signal_quality_id(value.quality)
    if signal_quality then
      quality_suffix = "|" .. signal_quality
    end
    return "{" .. tostring(value.type) .. "/" .. tostring(value.name) .. quality_suffix .. "}"
  end
  return tostring(value)
end

function debug_station_route_state_text(rec)
  if not rec then
    return "rec=nil"
  end
  return "unit=" .. tostring(rec.unit_number)
    .. " route_signal=" .. debug_signal_value_text(rawget(rec, "route_signal"))
    .. " route_signal_key=" .. tostring(rawget(rec, "route_signal_key"))
    .. " station_type=" .. tostring(rawget(rec, "station_type"))
end

function debug_station_rename(player_index, stage, rec, raw_value)
  if not STATION_RENAME_DEBUG then
    return
  end

  local message = "[ff-debug] " .. tostring(stage)
    .. " raw=" .. debug_signal_value_text(raw_value)
    .. " " .. debug_station_route_state_text(rec)
  log(message)

  local player = player_index and game and game.get_player(player_index) or nil
  if player then
    player.print(message)
  end
end

function debug_station_label_render(rec, text)
  if not STATION_RENAME_DEBUG then
    return
  end

  local message = "[ff-debug] label-text unit=" .. tostring(rec and rec.unit_number)
    .. " route_signal=" .. debug_signal_value_text(rec and rawget(rec, "route_signal"))
    .. " route_signal_key=" .. tostring(rec and rawget(rec, "route_signal_key"))
    .. " text=" .. tostring(text)
  log(message)
end

function debug_station_gui_event(player_index, stage, event, extra)
  if not STATION_RENAME_DEBUG then
    return
  end

  local element = event and event.element or nil
  local element_name = nil
  local element_type = nil
  if element then
    if element.valid then
      element_name = element.name
      element_type = element.type
    else
      element_name = "<invalid>"
      element_type = "<invalid>"
    end
  end
  local player = player_index and game and game.get_player(player_index) or nil
  local opened = player and player.opened or nil
  local opened_name = nil
  local opened_type = nil
  if opened then
    if opened.valid then
      opened_name = opened.name
      opened_type = opened.type
    else
      opened_name = "<invalid>"
      opened_type = "<invalid>"
    end
  end
  local message = "[ff-gui-debug] " .. tostring(stage)
    .. " tick=" .. tostring(game and game.tick)
    .. " player=" .. tostring(player_index)
    .. " gui_type=" .. tostring(event and event.gui_type)
    .. " element=" .. tostring(element_name)
    .. " element_type=" .. tostring(element_type)
    .. " opened=" .. tostring(opened_name)
    .. " opened_type=" .. tostring(opened_type)
  if extra then
    message = message .. " " .. tostring(extra)
  end
  log(message)
end

function suppress_gui_confirm_hotkey_this_tick(player_index)
  if not player_index then
    return
  end
  global.ff.gui_confirm_hotkey_suppressed_tick = global.ff.gui_confirm_hotkey_suppressed_tick or {}
  global.ff.gui_confirm_hotkey_suppressed_tick[player_index] = game.tick
end

function is_gui_confirm_hotkey_suppressed_this_tick(player_index)
  local ticks = global.ff.gui_confirm_hotkey_suppressed_tick
  return ticks and ticks[player_index] == game.tick or false
end

function player_forces_gui_hotkey_usage(player_index)
  if not (settings and settings.get_player_settings and game and player_index) then
    return false
  end

  local player = game.get_player(player_index)
  if not player then
    return false
  end

  local player_settings = settings.get_player_settings(player)
  local setting = player_settings and player_settings["ff-force-gui-hotkey-usage"] or nil
  return setting ~= nil and setting.value == true or false
end

function restore_station_hotkey_only_controls_from_record(player_index, root)
  local edit = global.ff.player_edit[player_index]
  if not edit or edit.kind ~= "station" then
    return
  end

  local rec = edit.unit_number and global.ff.stations[edit.unit_number] or nil
  if not rec then
    return
  end

  local station_type_dropdown = find_child_recursive(root, GUI_STATION_TYPE)
  local fuel_toggle = find_child_recursive(root, GUI_FUEL_STOP)
  local ammo_toggle = find_child_recursive(root, GUI_AMMO_STOP)
  local trash_toggle = find_child_recursive(root, GUI_TRASH_STOP)

  if station_type_dropdown and station_type_dropdown.valid then
    station_type_dropdown.selected_index = normalize_station_type(rec) == "demand" and 2 or 1
  end
  if fuel_toggle and fuel_toggle.valid then
    fuel_toggle.state = rec.is_fuel_stop == true
  end
  if ammo_toggle and ammo_toggle.valid then
    ammo_toggle.state = rec.is_ammo_stop == true
  end
  if trash_toggle and trash_toggle.valid then
    trash_toggle.state = rec.is_trash_stop == true
  end
end

function apply_hotkey_only_mode_to_open_gui(player_index)
  local player = game and game.get_player(player_index) or nil
  if not player then
    return
  end

  local root = player.gui.screen[GUI_ROOT]
  local edit = root and global.ff.player_edit[player_index] or nil
  if not root or not edit then
    return
  end

  local hotkey_only = player_forces_gui_hotkey_usage(player_index)
  local hotkey_summary = find_child_recursive(root, GUI_HOTKEY_SUMMARY)
  local hotkey_hint = find_child_recursive(root, GUI_HOTKEY_ONLY_HINT)
  local save_button = find_child_recursive(root, GUI_SAVE)
  local map_save_button = find_child_recursive(root, GUI_MAP_ROUTE_SAVE)

  if save_button and save_button.valid then
    save_button.enabled = not hotkey_only
  end
  if map_save_button and map_save_button.valid then
    map_save_button.enabled = not hotkey_only
  end

  if edit.kind == "station" then
    restore_station_hotkey_only_controls_from_record(player_index, root)
    local station_type_dropdown = find_child_recursive(root, GUI_STATION_TYPE)
    local fuel_toggle = find_child_recursive(root, GUI_FUEL_STOP)
    local ammo_toggle = find_child_recursive(root, GUI_AMMO_STOP)
    local trash_toggle = find_child_recursive(root, GUI_TRASH_STOP)
    if station_type_dropdown and station_type_dropdown.valid then
      station_type_dropdown.enabled = not hotkey_only
    end
    if fuel_toggle and fuel_toggle.valid then
      fuel_toggle.enabled = not hotkey_only
    end
    if ammo_toggle and ammo_toggle.valid then
      ammo_toggle.enabled = not hotkey_only
    end
    if trash_toggle and trash_toggle.valid then
      trash_toggle.enabled = not hotkey_only
    end
  end

  if hotkey_summary and hotkey_summary.valid then
    if hotkey_only and edit.kind == "station" then
      hotkey_summary.caption = {"ff.gui_station_hotkeys_forced"}
    elseif hotkey_only then
      hotkey_summary.caption = {"ff.gui_confirm_hotkey_forced"}
    else
      hotkey_summary.caption = {"ff.gui_station_hotkeys"}
    end
  end

  if hotkey_hint and hotkey_hint.valid then
    hotkey_hint.visible = hotkey_only
  end
end

local function set_active_signal_picker(player_index, element_name)
  if not player_index or not element_name then
    return
  end
  global.ff.active_signal_picker = global.ff.active_signal_picker or {}
  global.ff.active_signal_picker[player_index] = element_name
end

local function clear_active_signal_picker(player_index, element_name)
  local active = global.ff.active_signal_picker
  if not active or not player_index then
    return
  end
  if not element_name or active[player_index] == element_name then
    active[player_index] = nil
  end
end

local function is_active_signal_picker(player_index)
  local active = global.ff.active_signal_picker
  return active and active[player_index] ~= nil or false
end

function sync_station_route_signal_fields(rec)
  if rawget(rec, "route_signal_explicitly_empty") then
    rec.route_signal = nil
    rec.route_signal_key = nil
    rec.name_signal = nil
    rec.name_item = nil
    rec.stop_name = nil
    return nil
  end

  local signal = try_parse_legacy_station_signal(rawget(rec, "route_signal"))
    or try_parse_legacy_station_signal(rawget(rec, "route_signal_key"))
    or try_parse_legacy_station_signal(rawget(rec, "name_signal"))
    or try_parse_legacy_station_signal(rawget(rec, "name_item"))
    or try_parse_legacy_station_signal(rawget(rec, "stop_name"))

  if not signal and is_valid(rec.entity) then
    local backer_name = safe_entity_backer_name(rec.entity, "legacy-station-signal")
    if backer_name then
      signal = try_parse_legacy_station_signal(backer_name)
    end
  end

  if not signal then
    rec.route_signal = nil
    rec.route_signal_key = nil
    rec.name_signal = nil
    rec.name_item = nil
    rec.stop_name = nil
    return nil
  end

  local signal_key = route_signal_key(signal)
  rec.route_signal_explicitly_empty = false
  rec.route_signal = signal
  rec.route_signal_key = signal_key
  rec.name_signal = nil
  rec.name_item = nil
  rec.stop_name = nil
  return signal_key
end

function normalize_station_type(rec)
  if not rec then
    return "supply"
  end
  if rec.station_type == "supply" or rec.station_type == "demand" then
    return rec.station_type
  end
  rec.station_type = rec.is_trash_stop and "demand" or "supply"
  return rec.station_type
end

function station_route_signal_key(rec)
  if not rec then
    return nil
  end
  return sync_station_route_signal_fields(rec)
end

function get_freighter_record_by_entity(entity)
  if not is_valid(entity) then
    return nil
  end
  return global.ff.freighters[entity.unit_number]
end

function station_dock_position(station_entity)
  return {x = station_entity.position.x, y = station_entity.position.y + 5}
end

function gps_tag_for_entity(entity)
  if not is_valid(entity) then
    return ""
  end
  local surface_name = entity.surface and entity.surface.name or "nauvis"
  return string.format("[gps=%.1f,%.1f,%s]", entity.position.x, entity.position.y, surface_name)
end

function station_display_name(rec)
  local signal = route_signal_from_value_or_nil(station_route_signal_key(rec))
  local station_type = effective_station_type(rec)
  local type_label = station_type == "demand" and "Demand" or "Supply"
  local base
  if signal then
    base = {"", rich_text_for_signal(signal), " ", plain_signal_label(signal), " ", type_label}
  else
    base = {"", {"ff.empty_stop_name"}, " ", type_label}
  end
  if rec then
    local suffix = ""
    if rec.is_fuel_stop then
      suffix = suffix .. " [Fuel]"
    end
    if rec.is_ammo_stop then
      suffix = suffix .. " [Ammo]"
    end
    if rec.is_trash_stop then
      suffix = suffix .. " [Trash]"
    end
    return {"", base, suffix}
  end
  return base
end

function warn_station_noop_power_drain(rec, action_label)
  if not rec or not is_valid(rec.entity) or not rec.entity.force or not game then
    return
  end

  -- A genuinely broken stop can hit this path every tick, so keep the warning
  -- loud enough to notice while throttling repeats per station/action pair.
  global.ff.noop_power_drain_warning_tick = global.ff.noop_power_drain_warning_tick or {}
  local warning_key = tostring(rec.unit_number or rec.entity.unit_number or "nil") .. ":" .. serpent.line(action_label)
  local last_warning_tick = global.ff.noop_power_drain_warning_tick[warning_key] or -(60 * 10)
  if game.tick - last_warning_tick < (60 * 10) then
    return
  end

  global.ff.noop_power_drain_warning_tick[warning_key] = game.tick
  rec.entity.force.print({"", {"ff.noop_power_drain_warning", station_display_name(rec), action_label}, " ", gps_tag_for_entity(rec.entity)})
  throttled_diagnostic_log("noop_power_drain_log_tick", warning_key, {
    tag = "ff-noop-power-drain",
    tick = game.tick,
    station_unit_number = rec.unit_number,
    action = action_label,
  }, 1)
end

function warn_station_unexpected_power_drain(rec, previous_energy_j, current_energy_j)
  if not rec or not is_valid(rec.entity) or not rec.entity.force or not game then
    return
  end

  -- If the hidden station buffer loses energy without a matching scripted action
  -- spend nearby in time, surface a GPS-tagged warning so we can tell whether the
  -- drain is coming from an uninstrumented code path or an engine/entity quirk.
  global.ff.unexpected_power_drain_warning_tick = global.ff.unexpected_power_drain_warning_tick or {}
  local warning_key = tostring(rec.unit_number or rec.entity.unit_number or "nil")
  local last_warning_tick = global.ff.unexpected_power_drain_warning_tick[warning_key] or -(60 * 10)
  if game.tick - last_warning_tick < (60 * 10) then
    return
  end

  global.ff.unexpected_power_drain_warning_tick[warning_key] = game.tick
  rec.entity.force.print({
    "",
    {"ff.unexpected_power_drain_warning", station_display_name(rec), format_energy_mj_string(previous_energy_j), format_energy_mj_string(current_energy_j)},
    " ",
    gps_tag_for_entity(rec.entity)
  })
  throttled_diagnostic_log("unexpected_power_drain_log_tick", warning_key, {
    tag = "ff-unexpected-power-drain",
    tick = game.tick,
    station_unit_number = rec.unit_number,
    previous_energy_j = previous_energy_j,
    current_energy_j = current_energy_j,
    last_spend_tick = rec.last_power_spend_tick,
    last_spend_reason = rec.last_power_spend_reason,
  }, 1)
end

function warn_freighter_refuel_deadlock(freighter, blocked_fuel_names, shortfall_info)
  if not freighter or not is_valid(freighter.entity) or not freighter.entity.force or not game or not shortfall_info then
    return
  end

  -- A freighter can sit in this blocked state for a long time at the same fuel
  -- stop, so keep the warning noticeable without repeating it every tick.
  global.ff.refuel_deadlock_warning_tick = global.ff.refuel_deadlock_warning_tick or {}
  local warning_key = freighter.unit_number or freighter.entity.unit_number
  local last_warning_tick = global.ff.refuel_deadlock_warning_tick[warning_key] or -(60 * 10)
  if game.tick - last_warning_tick < (60 * 10) then
    return
  end

  global.ff.refuel_deadlock_warning_tick[warning_key] = game.tick

  local blocked_label = table.concat(blocked_fuel_names or {}, ", ")
  if blocked_label == "" then
    blocked_label = "unknown fuel"
  end

  freighter.entity.force.print({
    "",
    {
      "ff.refuel_deadlock_warning",
      freighter_runtime_name(freighter.entity, freighter.unit_number),
      blocked_label,
      format_energy_requirement_string(shortfall_info.trip_energy),
      format_energy_requirement_string(shortfall_info.available_energy),
      format_energy_shortfall_string(shortfall_info.trip_energy, shortfall_info.available_energy)
    },
    " ",
    gps_tag_for_entity(freighter.entity)
  })

  throttled_diagnostic_log("refuel_deadlock_log_tick", tostring(warning_key), {
    tag = "ff-refuel-deadlock",
    tick = game.tick,
    freighter_unit_number = freighter.unit_number,
    blocked_fuels = blocked_fuel_names,
    available_energy = shortfall_info.available_energy,
    trip_energy = shortfall_info.trip_energy,
  }, 1)
end

function station_label_text(rec)
  local signal = route_signal_from_value_or_nil(station_route_signal_key(rec))
  local station_type = effective_station_type(rec)
  local type_label = station_type == "demand" and "Demand" or "Supply"
  local text
  if signal then
    text = rich_text_for_signal(signal) .. " " .. plain_signal_label(signal) .. " " .. type_label
  else
    text = "<empty> " .. type_label
  end

  if rec then
    if rec.is_fuel_stop then
      text = text .. " [Fuel]"
    end
    if rec.is_ammo_stop then
      text = text .. " [Ammo]"
    end
    if rec.is_trash_stop then
      text = text .. " [Trash]"
    end
    local network_id = effective_station_network_id(rec)
    if network_id ~= 0 then
      text = text .. " [Net " .. tostring(network_id) .. "]"
    end
  end

  return text
end

function sync_station_entity_name(rec)
  if not rec or not is_valid(rec.entity) then
    return
  end

  local supports_backer_name = rec.entity.supports_backer_name and rec.entity.supports_backer_name()
  if not supports_backer_name then
    return
  end

  local station_type = effective_station_type(rec)
  local signal = route_signal_from_value_or_nil(station_route_signal_key(rec))
  local plain_name = ""
  if signal then
    plain_name = plain_signal_label(signal) .. " " .. (station_type == "demand" and "Demand" or "Supply")
  end
  try_set_entity_backer_name(rec.entity, plain_name, "sync-station-entity-name")
end

function station_chart_tag_text(rec)
  local signal = route_signal_from_value_or_nil(station_route_signal_key(rec))
  local station_type = effective_station_type(rec)
  local type_label = station_type == "demand" and "Demand" or "Supply"
  local base = tostring((signal and plain_signal_label(signal)) or "<empty>") .. " " .. type_label
  if not rec then
    return base
  end

  local suffix = ""
  if rec.is_fuel_stop then
    suffix = suffix .. " [Fuel]"
  end
  if rec.is_ammo_stop then
    suffix = suffix .. " [Ammo]"
  end
  if rec.is_trash_stop then
    suffix = suffix .. " [Trash]"
  end
  local network_id = effective_station_network_id(rec)
  if network_id ~= 0 then
    suffix = suffix .. " [Net " .. tostring(network_id) .. "]"
  end
  return base .. suffix
end

function station_settings_tags(rec)
  if not rec then
    return nil
  end

  local signal = copy_signal_id(route_signal_from_value_or_nil(station_route_signal_key(rec)))

  return {
    ff_station_settings = {
      route_signal = signal,
      station_type = normalize_station_type(rec),
      use_complex_demands = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED and rec.use_complex_demands == true,
      demand_requests = normalize_station_request_manifest(rec.demand_requests),
      demand_request_group = normalize_station_request_group_name(rec.demand_request_group),
      is_fuel_stop = rec.is_fuel_stop and true or false,
      is_ammo_stop = rec.is_ammo_stop and true or false,
      is_trash_stop = rec.is_trash_stop and true or false,
      circuit_set_station_type = station_uses_circuit_station_type(rec),
      circuit_station_type_signal = station_circuit_type_signal(rec),
      circuit_priority_signal = station_circuit_priority_signal(rec),
      circuit_network_signal = station_circuit_network_signal(rec),
      circuit_energy_signal = station_circuit_energy_signal(rec),
      charge_rate_w = rawget(rec, "charge_rate_w"),
      priority = station_priority_value(rec),
      supply_buffer_count = station_supply_buffer_count(rec),
      network_id = station_network_id(rec),
    },
  }
end

function freighter_settings_tags(rec)
  if not rec then
    return nil
  end

  sync_freighter_route_signal_fields(rec)

  local effective_from = rec.pending_from_signal_key or rec.from_signal_key
  local effective_to = rec.pending_to_signal_key or rec.to_signal_key
  local schedule = {}
  for _, entry in ipairs(rec.schedule or {}) do
    local stop_signal = copy_signal_id(route_signal_from_value_or_nil(freighter_schedule_entry_stop_signal_key(entry)))
    schedule[#schedule + 1] = {
      operation = freighter_schedule_entry_operation(entry),
      stop_signal = stop_signal,
      from_signal = freighter_schedule_entry_operation(entry) == "load" and stop_signal or nil,
      to_signal = freighter_schedule_entry_operation(entry) == "unload" and stop_signal or nil,
      departure_min_load_percent = freighter_schedule_entry_departure_load_percent(entry),
      allow_fuel_interrupt = freighter_schedule_entry_allows_fuel_interrupt(entry),
      allow_ammo_interrupt = freighter_schedule_entry_allows_ammo_interrupt(entry),
      allow_trash_interrupt = freighter_schedule_entry_allows_trash_interrupt(entry),
    }
  end

  return {
    ff_freighter_settings = {
      schedule = schedule,
      schedule_current_index = clamp_freighter_schedule_index(rec.schedule_current_index, rec.schedule),
      operation = freighter_schedule_entry_operation(freighter_schedule_entry_at(rec.schedule, rec.schedule_current_index) or {}),
      from_signal = copy_signal_id(route_signal_from_value_or_nil(effective_from)),
      to_signal = copy_signal_id(route_signal_from_value_or_nil(effective_to)),
      network_id = freighter_network_id(rec),
    },
  }
end

function destroy_station_label_renderings(rec)
  if not rec or not is_valid(rec.entity) then
    return
  end

  destroy_render_object(global.ff.station_labels[rec.unit_number])
  global.ff.station_labels[rec.unit_number] = nil
end

function create_station_label(rec)
  if not rec or not is_valid(rec.entity) then
    return
  end

  destroy_station_label_renderings(rec)
  local label_text = station_label_text(rec)
  debug_station_label_render(rec, label_text)
  global.ff.station_labels[rec.unit_number] = rendering.draw_text{
    text = label_text,
    surface = rec.entity.surface,
    target = rec.entity,
    target_offset = {0, -4.9},
    color = {r = 0.45, g = 0.9, b = 1, a = 1},
    alignment = "center",
    scale = 1.15,
    scale_with_zoom = false,
    only_in_alt_mode = false,
    use_rich_text = true,
  }
end

function rebuild_all_station_labels()
  rendering.clear(script.mod_name)
  global.ff.station_labels = {}

  for unit_number, rec in pairs(global.ff.stations) do
    if rec and is_valid(rec.entity) then
      create_station_label(rec)
    else
      global.ff.station_labels[unit_number] = nil
    end
  end
end

function indexed_station_bucket(index, key, create)
  local bucket = index[key]
  if not bucket and create then
    bucket = {}
    index[key] = bucket
  end
  return bucket
end

function remove_station_from_index_bucket(index, key, unit_number)
  if not (index and key and unit_number) then
    return
  end
  local bucket = index[key]
  if not bucket then
    return
  end
  bucket[unit_number] = nil
  if next(bucket) == nil then
    index[key] = nil
  end
end

function unindex_station_record(rec)
  if not rec then
    return
  end

  local unit_number = rec.unit_number
  local station_signal_key = rawget(rec, "route_signal_key") or rawget(rec, "stop_name") or rawget(rec, "name_item")
  local station_type = rawget(rec, "station_type")

  if station_signal_key then
    remove_station_from_index_bucket(global.ff.station_units_by_name, station_signal_key, unit_number)
    if station_type == "demand" then
      remove_station_from_index_bucket(global.ff.demand_station_units_by_name, station_signal_key, unit_number)
    end
  end
  global.ff.fuel_station_units[unit_number] = nil
  global.ff.ammo_station_units[unit_number] = nil
  global.ff.trash_station_units[unit_number] = nil
end

function index_station_record(rec)
  if not rec or not rec.unit_number then
    return
  end

  local station_signal_key = station_route_signal_key(rec)
  if station_signal_key then
    indexed_station_bucket(global.ff.station_units_by_name, station_signal_key, true)[rec.unit_number] = true
    if normalize_station_type(rec) == "demand" then
      indexed_station_bucket(global.ff.demand_station_units_by_name, station_signal_key, true)[rec.unit_number] = true
    end
  end
  if rec.is_fuel_stop then
    global.ff.fuel_station_units[rec.unit_number] = true
  end
  if rec.is_ammo_stop then
    global.ff.ammo_station_units[rec.unit_number] = true
  end
  if rec.is_trash_stop then
    global.ff.trash_station_units[rec.unit_number] = true
  end
end

local refresh_station_power_record

function apply_station_settings_tags(rec, tags)
  local settings = tags and tags.ff_station_settings
  if not rec or type(settings) ~= "table" then
    return false
  end

  unindex_station_record(rec)
  rec.route_signal = copy_signal_id(route_signal_from_value_or_nil(settings.route_signal))
  rec.route_signal_key = route_signal_key(rec.route_signal)
  rec.route_signal_explicitly_empty = rec.route_signal == nil
  rec.station_type = (settings.station_type == "demand") and "demand" or "supply"
  rec.use_complex_demands = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED and settings.use_complex_demands == true
  rec.demand_requests = normalize_station_request_manifest(settings.demand_requests)
  rec.demand_request_group = normalize_station_request_group_name(settings.demand_request_group)
  rec.is_fuel_stop = settings.is_fuel_stop and true or false
  rec.is_ammo_stop = settings.is_ammo_stop and true or false
  rec.is_trash_stop = settings.is_trash_stop and true or false
  rec.circuit_set_station_type = settings.circuit_set_station_type and true or false
  rec.circuit_station_type_signal = normalize_circuit_signal_id(settings.circuit_station_type_signal)
  rec.circuit_priority_signal = normalize_circuit_signal_id(settings.circuit_priority_signal)
  rec.circuit_network_signal = normalize_circuit_signal_id(settings.circuit_network_signal)
  rec.circuit_energy_signal = normalize_circuit_signal_id(settings.circuit_energy_signal)
  local tagged_charge_rate_w = tonumber(settings.charge_rate_w)
  rec.charge_rate_w = (tagged_charge_rate_w and tagged_charge_rate_w > 0) and tagged_charge_rate_w or nil
  rec.priority = parse_station_priority(settings.priority)
  rec.supply_buffer_count = parse_station_supply_buffer_count(settings.supply_buffer_count)
  rec.network_id = parse_station_network_id(settings.network_id)
  refresh_station_power_record(rec)
  sync_station_route_signal_fields(rec)
  refresh_station_circuit_state(rec)
  index_station_record(rec)
  update_station_label(rec.unit_number)
  update_station_chart_tag(rec)
  return true
end

function apply_freighter_settings_tags(rec, tags)
  local settings = tags and tags.ff_freighter_settings
  if not rec or type(settings) ~= "table" then
    return false
  end

  rec.schedule = copy_freighter_schedule_entries(settings.schedule or {
    {
      operation = settings.operation,
      from_signal = settings.from_signal,
      to_signal = settings.to_signal,
    },
  })
  rec.schedule_current_index = clamp_freighter_schedule_index(settings.schedule_current_index or 1, rec.schedule)
  rec.from_signal_key = normalize_freighter_route_signal_key(settings.from_signal)
  rec.to_signal_key = normalize_freighter_route_signal_key(settings.to_signal)
  rec.network_id = parse_station_network_id(settings.network_id)
  rec.pending_schedule = nil
  rec.pending_schedule_current_index = nil
  rec.pending_from_signal_key = nil
  rec.pending_to_signal_key = nil
  rec.force_route_now = false
  rec.force_waiting_for_trash = false
  rec.completed_schedule_leg = nil
  sync_freighter_route_signal_fields(rec)
  return true
end

function collect_station_records_from_units(unit_set)
  local list = {}
  for unit_number in pairs(unit_set or {}) do
    local rec = global.ff.stations[unit_number]
    if rec and is_valid(rec.entity) then
      list[#list + 1] = rec
    else
      unit_set[unit_number] = nil
    end
  end
  return list
end

local function invalidate_runtime_cycle_cache()
  if global and global.ff then
    global.ff.runtime_cycle_cache = nil
  end
end

local function get_runtime_cycle_cache()
  local cache = global.ff.runtime_cycle_cache
  if cache and cache.tick == game.tick then
    return cache
  end

  cache = {
    tick = game.tick,
    station_matches = {},
    powered_station_candidates = {},
    station_inventory_counts = {},
    station_insertable_counts = {},
    station_item_counts = {},
    freighter_network_sizes = {},
    route_plans = {},
  }

  global.ff.runtime_cycle_cache = cache
  return cache
end

-- Extracted runtime modules resolve shared helpers through `_ENV`, so expose the
-- cycle cache accessor here after defining the local implementation.
_ENV.get_runtime_cycle_cache = get_runtime_cycle_cache

local function get_cached_station_inventory_counts(rec, cache)
  if not rec then
    return {}
  end

  cache = cache or get_runtime_cycle_cache()
  local unit_number = rec.unit_number
  local counts = cache.station_inventory_counts[unit_number]
  if counts then
    return counts
  end

  counts = get_inventory_name_counts(get_inventory(rec.entity))
  cache.station_inventory_counts[unit_number] = counts
  return counts
end

local function get_cached_station_insertable_count(rec, item_name, cache)
  if not rec or type(item_name) ~= "string" then
    return 0
  end

  cache = cache or get_runtime_cycle_cache()
  local unit_number = rec.unit_number
  local by_item = cache.station_insertable_counts[unit_number]
  if not by_item then
    by_item = {}
    cache.station_insertable_counts[unit_number] = by_item
  end

  local cached = by_item[item_name]
  if cached ~= nil then
    return cached
  end

  local inventory = get_inventory(rec.entity)
  cached = inventory and inventory.get_insertable_count(item_name) or 0
  by_item[item_name] = cached
  return cached
end

-- The extracted route planner reuses the same short-lived station cache helpers.
_ENV.get_cached_station_inventory_counts = get_cached_station_inventory_counts
_ENV.get_cached_station_insertable_count = get_cached_station_insertable_count

local function get_cached_station_item_count(rec, item_name, cache)
  if not rec or type(item_name) ~= "string" then
    return 0
  end

  cache = cache or get_runtime_cycle_cache()
  local unit_number = rec.unit_number
  local by_item = cache.station_item_counts[unit_number]
  if not by_item then
    by_item = {}
    cache.station_item_counts[unit_number] = by_item
  end

  local cached = by_item[item_name]
  if cached ~= nil then
    return cached
  end

  local inventory = get_inventory(rec.entity)
  cached = inventory and inventory.get_item_count(item_name) or 0
  by_item[item_name] = cached
  return cached
end

local function remove_station_chart_tags(rec)
  if not rec then
    return
  end

  local existing_tag = global.ff.station_tags[rec.unit_number]
  if existing_tag and existing_tag.valid then
    existing_tag.destroy()
    global.ff.station_tags[rec.unit_number] = nil
  end

  local surface = (rec.entity and rec.entity.valid and rec.entity.surface) or game.surfaces[rec.surface_index]
  local force = (rec.entity and rec.entity.valid and rec.entity.force) or game.forces[rec.force_name]
  local pos = (rec.entity and rec.entity.valid and rec.entity.position) or rec.position
  if not surface or not force or not pos then
    return
  end

  local area = {
    {pos.x - 0.75, pos.y - 0.75},
    {pos.x + 0.75, pos.y + 0.75},
  }
  for _, tag in pairs(force.find_chart_tags(surface, area) or {}) do
    if tag.valid then
      tag.destroy()
    end
  end
end

update_station_chart_tag = function(rec)
  if not rec or not is_valid(rec.entity) then
    return
  end

  remove_station_chart_tags(rec)
  local station_signal = route_signal_from_value_or_nil(station_route_signal_key(rec)) or STATION_TAG_ICON
  local tag = rec.entity.force.add_chart_tag(rec.entity.surface, {
    position = rec.entity.position,
    icon = station_signal,
    text = station_chart_tag_text(rec),
  })
  global.ff.station_tags[rec.unit_number] = tag
end

local function register_station(entity)
  if not is_valid(entity) or not is_freighter_station_name(entity.name) then
    return
  end

  local rec = global.ff.stations[entity.unit_number] or {
    unit_number = entity.unit_number,
    entity = entity,
    route_signal = nil,
    route_signal_key = nil,
    route_signal_explicitly_empty = true,
    station_type = "supply",
    use_complex_demands = false,
    demand_requests = {},
    demand_request_group = nil,
    is_fuel_stop = false,
    is_ammo_stop = false,
    is_trash_stop = false,
    circuit_set_station_type = false,
    circuit_station_type_signal = copy_signal_id(CIRCUIT_SIGNAL_SUPPLY_DEMAND),
    circuit_priority_signal = copy_signal_id(CIRCUIT_SIGNAL_PRIORITY),
    circuit_network_signal = copy_signal_id(CIRCUIT_SIGNAL_NETWORK_ID),
    circuit_energy_signal = copy_signal_id(CIRCUIT_SIGNAL_ENERGY_MJ),
    charge_rate_w = nil,
    priority = 0,
    supply_buffer_count = 0,
    network_id = 0,
    stop_fully_powered = false,
    cargo_unit_number = nil,
    power_unit_number = nil,
    circuit_unit_number = nil,
    last_power_energy_j = nil,
    power_transfer_owner_unit_number = nil,
    power_transfer_reason = nil,
    power_transfer_required_j = nil,
    power_transfer_progress_j = nil,
  }
  unindex_station_record(rec)
  rec.entity = entity
  rec.demand_requests = normalize_station_request_manifest(rec.demand_requests)
  rec.demand_request_group = normalize_station_request_group_name(rec.demand_request_group)
  if rec.is_fuel_stop == nil then
    rec.is_fuel_stop = false
  end
  if rec.use_complex_demands == nil or not STATION_COMPLEX_DEMANDS_FEATURE_ENABLED then
    rec.use_complex_demands = false
  end
  if rec.is_ammo_stop == nil then
    rec.is_ammo_stop = false
  end
  if rec.is_trash_stop == nil then
    rec.is_trash_stop = false
  end
  if rec.circuit_set_station_type == nil then
    rec.circuit_set_station_type = false
  end
  rec.circuit_station_type_signal = station_circuit_type_signal(rec)
  rec.circuit_priority_signal = station_circuit_priority_signal(rec)
  rec.circuit_network_signal = station_circuit_network_signal(rec)
  rec.circuit_energy_signal = station_circuit_energy_signal(rec)
  local saved_charge_rate_w = tonumber(rawget(rec, "charge_rate_w"))
  rec.charge_rate_w = (saved_charge_rate_w and saved_charge_rate_w > 0) and saved_charge_rate_w or nil
  rec.priority = parse_station_priority(rawget(rec, "priority"))
  rec.supply_buffer_count = parse_station_supply_buffer_count(rawget(rec, "supply_buffer_count"))
  rec.network_id = parse_station_network_id(rawget(rec, "network_id"))
  rec.priority = parse_station_priority(rawget(rec, "priority"))
  sync_station_route_signal_fields(rec)
  rec.station_type = normalize_station_type(rec)
  rec.force_name = entity.force.name
  rec.surface_index = entity.surface.index
  rec.position = {x = entity.position.x, y = entity.position.y}
  rec.stop_fully_powered = rec.stop_fully_powered == true
  rec.power_unit_number = nil
  local saved_power_transfer_progress_j = tonumber(rawget(rec, "power_transfer_progress_j"))
  rec.power_transfer_progress_j = (saved_power_transfer_progress_j and saved_power_transfer_progress_j > 0) and saved_power_transfer_progress_j or nil
  ensure_station_cargo_entity(rec)
  ensure_station_circuit_entity(rec)
  dedupe_station_hidden_companions(rec)
  refresh_station_circuit_state(rec)
  sync_station_entity_name(rec)
  global.ff.stations[entity.unit_number] = rec
  index_station_record(rec)
  add_unit_to_tick_bucket(global.ff.station_units_by_tick_bucket, entity.unit_number)

  create_station_label(rec)

  update_station_chart_tag(rec)
end

local function resolve_station_record_for_entity(entity)
  if not is_valid(entity) or not is_freighter_station_name(entity.name) then
    return nil
  end

  local rec = get_station_record_by_entity(entity)
  if not rec or not is_valid(rec.entity) or rec.unit_number ~= entity.unit_number then
    register_station(entity)
    rec = get_station_record_by_entity(entity)
  end

  if rec then
    rec.entity = entity
  end
  return rec
end

get_station_cargo_entity = function(rec)
  if not rec then
    return nil
  end

  if is_valid(rec.entity) then
    local station_inventory = rec.entity.get_inventory(defines.inventory.chest)
    if station_inventory then
      rec.cargo_unit_number = rec.entity.unit_number
      return rec.entity
    end
  end

  local surface = (rec.entity and rec.entity.valid and rec.entity.surface) or game.surfaces[rec.surface_index]
  local force = (rec.entity and rec.entity.valid and rec.entity.force) or game.forces[rec.force_name]
  local position = (rec.entity and rec.entity.valid and rec.entity.position) or rec.position
  if not surface or not force or not position then
    rec.cargo_unit_number = nil
    return nil
  end

  local cargo_entity = tracked_station_hidden_companion(rawget(rec, "cargo_unit_number"), STATION_CARGO_NAME)
  if cargo_entity then
    return cargo_entity
  end

  return dedupe_station_hidden_companion_at_position(rec, STATION_CARGO_NAME, "cargo_unit_number")
end

local function migrate_legacy_station_cargo_entity(rec)
  if not rec or not is_valid(rec.entity) then
    return nil
  end

  local station_inventory = rec.entity.get_inventory(defines.inventory.chest)
  if not station_inventory then
    return nil
  end

  local legacy_entities = rec.entity.surface.find_entities_filtered{
    name = STATION_CARGO_NAME,
    position = rec.entity.position,
    force = rec.entity.force,
  }
  for _, legacy_entity in ipairs(legacy_entities) do
    if legacy_entity.valid and legacy_entity.unit_number ~= rec.entity.unit_number then
      local legacy_inventory = legacy_entity.get_inventory(defines.inventory.chest)
      if legacy_inventory and legacy_inventory.valid and not legacy_inventory.is_empty() then
        for item_name, item_count in pairs(legacy_inventory.get_contents()) do
          local inserted = station_inventory.insert{name = item_name, count = item_count}
          local leftover = item_count - inserted
          if leftover > 0 then
            rec.entity.surface.spill_item_stack(rec.entity.position, {name = item_name, count = leftover}, true, rec.entity.force, false)
          end
        end
        legacy_inventory.clear()
      end
      legacy_entity.destroy()
    end
  end

  rec.cargo_unit_number = rec.entity.unit_number
  return rec.entity
end

ensure_station_cargo_entity = function(rec)
  if not rec or not is_valid(rec.entity) then
    return nil
  end

  local station_inventory = rec.entity.get_inventory(defines.inventory.chest)
  if station_inventory then
    return migrate_legacy_station_cargo_entity(rec)
  end

  local cargo_entity = get_station_cargo_entity(rec)
  if cargo_entity and cargo_entity.valid then
    return cargo_entity
  end

  cargo_entity = rec.entity.surface.create_entity{
    name = STATION_CARGO_NAME,
    position = rec.entity.position,
    force = rec.entity.force,
    create_build_effect_smoke = false,
  }
  if cargo_entity and cargo_entity.valid then
    cargo_entity.destructible = false
    cargo_entity.minable = false
    cargo_entity.operable = true
    rec.cargo_unit_number = cargo_entity.unit_number
    return cargo_entity
  end

  rec.cargo_unit_number = nil
  return nil
end

local function destroy_station_cargo_entity(rec)
  if not rec then
    return
  end

  if is_valid(rec.entity) then
    local station_inventory = rec.entity.get_inventory(defines.inventory.chest)
    if station_inventory then
      local legacy_entities = rec.entity.surface.find_entities_filtered{
        name = STATION_CARGO_NAME,
        position = rec.entity.position,
        force = rec.entity.force,
      }
      for _, legacy_entity in ipairs(legacy_entities) do
        if legacy_entity.valid and legacy_entity.unit_number ~= rec.entity.unit_number then
          legacy_entity.destroy()
        end
      end
      rec.cargo_unit_number = rec.entity.unit_number
      return
    end
  end

  local cargo_entity = get_station_cargo_entity(rec)
  if cargo_entity and cargo_entity.valid then
    cargo_entity.destroy()
  end
  rec.cargo_unit_number = nil
end

local function get_station_power_entity(rec)
  if not rec then
    return nil
  end

  local surface = (rec.entity and rec.entity.valid and rec.entity.surface) or game.surfaces[rec.surface_index]
  local force = (rec.entity and rec.entity.valid and rec.entity.force) or game.forces[rec.force_name]
  local position = (rec.entity and rec.entity.valid and rec.entity.position) or rec.position
  if not surface or not force or not position then
    rec.power_unit_number = nil
    return nil
  end

  local power_entity = tracked_station_hidden_companion(rawget(rec, "power_unit_number"), STATION_POWER_NAME)
  if power_entity then
    return power_entity
  end

  return dedupe_station_hidden_companion_at_position(rec, STATION_POWER_NAME, "power_unit_number")
end

local function ensure_station_power_entity(rec)
  if not rec or not is_valid(rec.entity) then
    return nil
  end

  local power_entity = get_station_power_entity(rec)
  if power_entity and power_entity.valid then
    return power_entity
  end

  power_entity = rec.entity.surface.create_entity{
    name = STATION_POWER_NAME,
    position = rec.entity.position,
    force = rec.entity.force,
    create_build_effect_smoke = false,
  }
  if power_entity and power_entity.valid then
    power_entity.destructible = false
    power_entity.minable = false
    power_entity.operable = false
    rec.power_unit_number = power_entity.unit_number
    return power_entity
  end

  rec.power_unit_number = nil
  return nil
end

apply_station_charge_rate_to_power_entity = function(rec)
  if not rec or not is_valid(rec.entity) then
    return nil
  end

  if not station_transfer_owner_is_active(rec) then
    destroy_station_power_entity(rec)
    return nil
  end

  local power_entity = ensure_station_power_entity(rec)
  if not power_entity or not power_entity.valid then
    return nil
  end

  local required_energy_j = math.max(0, station_transfer_required_energy_j(rec))
  local harvested_energy_j = math.max(0, power_entity.energy or 0)
  local stored_progress_j = station_transfer_progress_j(rec, required_energy_j)
  if harvested_energy_j > 0 then
    stored_progress_j = math.min(required_energy_j, stored_progress_j + harvested_energy_j)
  end
  stored_progress_j = set_station_transfer_progress_j(rec, stored_progress_j, required_energy_j)
  local assigned_buffer_size_j = station_charge_buffer_size_j(rec, stored_progress_j, required_energy_j)
  log(serpent.line({
    tag = "ff-station-buffer-size-debug",
    tick = game and game.tick or nil,
    station_unit_number = rec.unit_number,
    station_name = is_valid(rec.entity) and rec.entity.backer_name or nil,
    power_unit_number = power_entity.unit_number,
    transfer_reason = rawget(rec, "power_transfer_reason"),
    charge_rate_w = station_charge_rate_w(rec),
    harvested_energy_j = harvested_energy_j,
    required_energy_j = required_energy_j,
    transfer_progress_j = stored_progress_j,
    assigned_buffer_size_j = assigned_buffer_size_j,
  }))
  power_entity.power_production = 0
  power_entity.power_usage = 0
  if power_entity.energy ~= 0 then
    power_entity.energy = 0
  end
  power_entity.electric_buffer_size = assigned_buffer_size_j
  rec.power_transfer_required_j = required_energy_j
  rec.power_unit_number = power_entity.unit_number
  return power_entity
end

function destroy_station_power_entity(rec)
  if rec then
    local power_entity = get_station_power_entity(rec)
    if power_entity and power_entity.valid then
      power_entity.destroy()
    end
    rec.power_unit_number = nil
    rec.stop_power_ratio = 0
    rec.stop_fully_powered = false
    rec.last_power_energy_j = 0
    rec.power_transfer_owner_unit_number = nil
    rec.power_transfer_reason = nil
    rec.power_transfer_required_j = nil
    rec.power_transfer_progress_j = nil
    clear_station_power_transfer_active(rec)
  end
end

ensure_station_circuit_entity = function(rec)
  if not rec or not is_valid(rec.entity) then
    return nil
  end

  local circuit_entity = get_station_circuit_control_entity(rec)
  if circuit_entity and circuit_entity.valid then
    connect_station_circuit_entity(rec, circuit_entity)
    return circuit_entity
  end

  circuit_entity = rec.entity.surface.create_entity{
    name = STATION_CIRCUIT_NAME,
    position = rec.entity.position,
    force = rec.entity.force,
    create_build_effect_smoke = false,
  }
  if circuit_entity and circuit_entity.valid then
    circuit_entity.destructible = false
    circuit_entity.minable = false
    circuit_entity.operable = false
    rec.circuit_unit_number = circuit_entity.unit_number
    connect_station_circuit_entity(rec, circuit_entity)
    return circuit_entity
  end

  rec.circuit_unit_number = nil
  return nil
end

local function destroy_station_circuit_entity(rec)
  if rec then
    local circuit_entity = get_station_circuit_control_entity(rec)
    if circuit_entity and circuit_entity.valid then
      circuit_entity.destroy()
    end
    rec.circuit_unit_number = nil
  end
end

function destroy_station_hidden_companions(anchor_entity, rec)
  -- Hidden power/circuit/cargo helpers are created separately from the visible
  -- station entity. If the station record is stale, or older saves have duplicate
  -- helpers stacked at the same tile, tearing down only the tracked unit number can
  -- leave an invisible leftover behind after mining the station. Sweep the whole
  -- station tile for every hidden companion prototype whenever the visible stop is
  -- removed so pickup always leaves the area clean.
  local surface = (anchor_entity and anchor_entity.valid and anchor_entity.surface)
    or (rec and rec.entity and rec.entity.valid and rec.entity.surface)
    or (rec and game.surfaces[rec.surface_index])
  local force = (anchor_entity and anchor_entity.valid and anchor_entity.force)
    or (rec and rec.entity and rec.entity.valid and rec.entity.force)
    or (rec and game.forces[rec.force_name])
  local position = (anchor_entity and anchor_entity.valid and anchor_entity.position)
    or (rec and rec.entity and rec.entity.valid and rec.entity.position)
    or (rec and rec.position)
  if not surface or not force or not position then
    if rec then
      rec.cargo_unit_number = nil
      rec.power_unit_number = nil
      rec.circuit_unit_number = nil
      rec.stop_power_ratio = 0
      rec.stop_fully_powered = false
      rec.last_power_energy_j = 0
      rec.power_transfer_owner_unit_number = nil
      rec.power_transfer_reason = nil
      rec.power_transfer_required_j = nil
      rec.power_transfer_progress_j = nil
      clear_station_power_transfer_active(rec)
    end
    return
  end

  for _, hidden_name in ipairs(STATION_HIDDEN_COMPANION_NAMES) do
    for _, hidden_entity in ipairs(surface.find_entities_filtered{
      name = hidden_name,
      position = position,
      force = force,
    } or {}) do
      if hidden_entity.valid then
        hidden_entity.destroy()
      end
    end
  end

  if rec then
    rec.cargo_unit_number = nil
    rec.power_unit_number = nil
    rec.circuit_unit_number = nil
    rec.stop_power_ratio = 0
    rec.stop_fully_powered = false
    rec.last_power_energy_j = 0
    rec.power_transfer_owner_unit_number = nil
    rec.power_transfer_reason = nil
    rec.power_transfer_required_j = nil
    rec.power_transfer_progress_j = nil
    clear_station_power_transfer_active(rec)
  end
end

station_has_full_power = function(rec)
  return rec and rec.stop_fully_powered == true and is_valid(rec.entity)
  and not entity_marked_for_deconstruction(rec.entity)
end

local function station_available_energy(rec)
  local required_energy_j = math.max(0, station_transfer_required_energy_j(rec))
  local available_energy = station_transfer_progress_j(rec, required_energy_j)
  local power_entity = get_station_power_entity(rec)
  if not power_entity or not power_entity.valid then
    return available_energy
  end
  return math.max(0, math.min(required_energy_j, available_energy + math.max(0, power_entity.energy or 0)))
end

refresh_station_power_record = function(rec)
  if not rec then
    return
  end
  apply_station_charge_rate_to_power_entity(rec)
  local available_energy = station_available_energy(rec)
  local buffer_capacity_j = station_transfer_owner_is_active(rec) and station_transfer_required_energy_j(rec) or 0
  rec.last_power_energy_j = available_energy
  rec.stop_power_ratio = buffer_capacity_j > 0 and math.max(0, math.min(1, available_energy / buffer_capacity_j)) or 0
  rec.stop_fully_powered = buffer_capacity_j > 0 and available_energy >= buffer_capacity_j
  refresh_station_circuit_state(rec)
end

function cancel_station_action_energy(rec, owner_unit_number)
  if not rec then
    return
  end
  if owner_unit_number and rawget(rec, "power_transfer_owner_unit_number") ~= owner_unit_number then
    return
  end
  destroy_station_power_entity(rec)
  refresh_station_circuit_state(rec)
end

local function consume_station_action_energy(rec, reason_key, owner_unit_number)
  if not rec or not is_valid(rec.entity) then
    return false
  end

  local action_energy_j = station_action_energy_j(rec)
  if action_energy_j <= 0 then
    cancel_station_action_energy(rec, owner_unit_number)
    return true
  end

  if station_transfer_owner_is_active(rec) then
    local active_owner = rawget(rec, "power_transfer_owner_unit_number")
    local active_reason = rawget(rec, "power_transfer_reason")
    if active_owner ~= owner_unit_number or active_reason ~= reason_key then
      refresh_station_power_record(rec)
      return false
    end
  else
    rec.power_transfer_owner_unit_number = owner_unit_number
    rec.power_transfer_reason = reason_key
    rec.power_transfer_required_j = action_energy_j
    rec.power_transfer_progress_j = nil
    mark_station_power_transfer_active(rec)
  end

  local power_entity = apply_station_charge_rate_to_power_entity(rec)
  if not power_entity or not power_entity.valid then
    refresh_station_power_record(rec)
    return false
  end

  local available_energy = station_available_energy(rec)
  rec.last_power_energy_j = available_energy
  rec.stop_power_ratio = action_energy_j > 0 and math.max(0, math.min(1, available_energy / action_energy_j)) or 0
  rec.stop_fully_powered = available_energy >= action_energy_j
  if available_energy < action_energy_j then
    refresh_station_power_record(rec)
    return false
  end

  rec.last_power_spend_tick = game and game.tick or nil
  rec.last_power_spend_reason = reason_key
  rec.last_power_spend_before_j = available_energy
  rec.last_power_spend_after_j = 0
  log(serpent.line({
    tag = "ff-station-action-spend",
    tick = game and game.tick or nil,
    station_unit_number = rec.unit_number,
    reason = reason_key,
    before_energy_j = available_energy,
    after_energy_j = 0,
    surface = rec.entity and rec.entity.valid and rec.entity.surface and rec.entity.surface.name or nil,
    position = rec.entity and rec.entity.valid and rec.entity.position or nil,
  }))
  destroy_station_power_entity(rec)
  refresh_station_circuit_state(rec)
  return true
end

local function register_freighter(entity)
  if not is_valid(entity) or entity.name ~= FREIGHTER_NAME then
    return
  end

  global.ff.freighters[entity.unit_number] = global.ff.freighters[entity.unit_number] or {
    unit_number = entity.unit_number,
    entity = entity,
    schedule = {{operation = "load", stop_signal_key = nil}},
    schedule_current_index = 1,
    from_signal_key = nil,
    to_signal_key = nil,
    network_id = 0,
    state = "idle",
    cargo_item = nil,
    cargo_count = 0,
    cargo_manifest = {},
    inbound_manifest = nil,
    trip_manifest = nil,
    trip_operation = nil,
    idle_waiting_for_load = nil,
    source_station = nil,
    target_station = nil,
    route_network_id = nil,
    route_key = nil,
    travel_start_tick = nil,
    travel_end_tick = nil,
    start_position = nil,
    end_position = nil,
    pending_schedule = nil,
    pending_schedule_current_index = nil,
    pending_from_signal_key = nil,
    pending_to_signal_key = nil,
    fuel_credit_j = 0,
    fuel_debt_j = 0,
    force_route_now = false,
    force_waiting_for_trash = false,
  }
  local rec = global.ff.freighters[entity.unit_number]
  release_freighter_inbound_reservation(rec)
  rec.entity = entity
  rec.state = "idle"
  rec.cargo_item = nil
  rec.cargo_count = 0
  rec.cargo_manifest = rec.cargo_manifest or {}
  rec.inbound_manifest = nil
  rec.trip_manifest = nil
  rec.trip_operation = nil
  rec.idle_waiting_for_load = nil
  rec.source_station = nil
  rec.target_station = nil
  clear_route_claim(rec)
  rec.travel_start_tick = nil
  rec.travel_end_tick = nil
  rec.start_position = nil
  rec.end_position = nil
  rec.pending_from_signal_key = nil
  rec.pending_to_signal_key = nil
  rec.network_id = freighter_network_id(rec)
  rec.fuel_credit_j = rec.fuel_credit_j or 0
  rec.fuel_debt_j = rec.fuel_debt_j or 0
  rec.force_route_now = false
  rec.force_waiting_for_trash = false
  sync_freighter_cargo_summary_from_inventory(rec)

  -- Inherit last died freighter's configuration on the same force.
  local last_died = global.ff.last_died_freighter and global.ff.last_died_freighter[entity.force.name]
  if last_died and (game.tick - (last_died.tick or 0)) < 36000 then  -- within 10 minutes
    rec.from_signal_key = last_died.from_signal_key or last_died.from_name or rec.from_signal_key
    rec.to_signal_key = last_died.to_signal_key or last_died.to_name or rec.to_signal_key
    rec.network_id = parse_station_network_id(last_died.network_id or rec.network_id)
    -- Try to restore the backer name.
    if last_died.backer_name then
      try_set_entity_backer_name(entity, last_died.backer_name, "inherit-last-died-freighter-name")
    end
    global.ff.last_died_freighter[entity.force.name] = nil
  end

  sync_freighter_route_signal_fields(rec)
  add_unit_to_tick_bucket(global.ff.freighter_units_by_tick_bucket, entity.unit_number)
end

local function unregister_entity(entity)
  if not is_valid(entity) then
    return
  end

  global.ff.cleanup_dirty = true

  if is_freighter_station_name(entity.name) then
    local rec = global.ff.stations[entity.unit_number]
    remove_unit_from_tick_bucket(global.ff.station_units_by_tick_bucket, entity.unit_number)
    clear_station_warning_bookkeeping(entity.unit_number)
    unindex_station_record(rec)
    destroy_station_hidden_companions(entity, rec)
    destroy_station_cargo_entity(rec)
    destroy_station_power_entity(rec)
    destroy_station_circuit_entity(rec)
    remove_station_chart_tags(rec)
    destroy_render_object(global.ff.station_labels[entity.unit_number])
    global.ff.station_labels[entity.unit_number] = nil
    global.ff.station_tags[entity.unit_number] = nil
    global.ff.stations[entity.unit_number] = nil
  elseif entity.name == FREIGHTER_NAME then
    local rec = global.ff.freighters[entity.unit_number]
    release_freighter_inbound_reservation(rec)
    remove_unit_from_tick_bucket(global.ff.freighter_units_by_tick_bucket, entity.unit_number)
    clear_freighter_warning_bookkeeping(entity.unit_number)
    global.ff.freighters[entity.unit_number] = nil
  end
end

local function cleanup_invalid_entities()
  global.ff.cleanup_dirty = false

  for unit, rec in pairs(global.ff.stations) do
    if not is_valid(rec.entity) then
      remove_unit_from_tick_bucket(global.ff.station_units_by_tick_bucket, unit)
      clear_station_warning_bookkeeping(unit)
      unindex_station_record(rec)
      destroy_station_hidden_companions(nil, rec)
      destroy_station_cargo_entity(rec)
      destroy_station_power_entity(rec)
      destroy_station_circuit_entity(rec)
      remove_station_chart_tags(rec)
      destroy_render_object(global.ff.station_labels[unit])
      global.ff.station_labels[unit] = nil
      global.ff.station_tags[unit] = nil
      global.ff.stations[unit] = nil
    end
  end

  for unit, rec in pairs(global.ff.freighters) do
    if not is_valid(rec.entity) then
      release_freighter_inbound_reservation(rec)
      remove_unit_from_tick_bucket(global.ff.freighter_units_by_tick_bucket, unit)
      clear_freighter_warning_bookkeeping(unit)
      global.ff.freighters[unit] = nil
    end
  end
end

local function cleanup_invalid_entities_in_bucket(bucket_index)
  if not bucket_index then
    return
  end

  local station_bucket = global.ff.station_units_by_tick_bucket[bucket_index] or {}
  for unit in pairs(station_bucket) do
    local rec = global.ff.stations[unit]
    if not rec or not is_valid(rec.entity) then
      if rec then
        clear_station_warning_bookkeeping(unit)
        unindex_station_record(rec)
        destroy_station_hidden_companions(nil, rec)
        destroy_station_cargo_entity(rec)
        destroy_station_power_entity(rec)
        destroy_station_circuit_entity(rec)
        remove_station_chart_tags(rec)
        destroy_render_object(global.ff.station_labels[unit])
        global.ff.station_labels[unit] = nil
        global.ff.station_tags[unit] = nil
        global.ff.stations[unit] = nil
      end
      station_bucket[unit] = nil
    end
  end

  local freighter_bucket = global.ff.freighter_units_by_tick_bucket[bucket_index] or {}
  for unit in pairs(freighter_bucket) do
    local rec = global.ff.freighters[unit]
    if not rec or not is_valid(rec.entity) then
      if rec then
        release_freighter_inbound_reservation(rec)
        clear_freighter_warning_bookkeeping(unit)
        global.ff.freighters[unit] = nil
      end
      freighter_bucket[unit] = nil
    end
  end
end

local function update_station_power_states_in_bucket(bucket_index)
  local station_bucket = global.ff.station_units_by_tick_bucket[bucket_index] or {}
  for unit in pairs(station_bucket) do
    local rec = global.ff.stations[unit]
    if rec and is_valid(rec.entity) and not station_transfer_owner_is_active(rec) then
      local power_entity = apply_station_charge_rate_to_power_entity(rec)
      ensure_station_circuit_entity(rec)
      if power_entity and power_entity.valid then
        local buffer_capacity_j = station_transfer_required_energy_j(rec)
        local current_energy = math.max(0, math.min(buffer_capacity_j, power_entity.energy or 0))
        local ratio = buffer_capacity_j > 0 and math.max(0, math.min(1, current_energy / buffer_capacity_j)) or 0
        rec.stop_power_ratio = ratio
        rec.power_unit_number = power_entity.unit_number
        rec.stop_fully_powered = buffer_capacity_j > 0 and current_energy >= buffer_capacity_j
        rec.last_power_energy_j = current_energy
        refresh_station_circuit_state(rec)
      else
        rec.stop_power_ratio = 0
        rec.stop_fully_powered = false
        rec.power_unit_number = nil
        rec.last_power_energy_j = 0
        refresh_station_circuit_state(rec)
      end
    elseif rec then
      rec.stop_power_ratio = 0
      rec.stop_fully_powered = false
      rec.power_unit_number = nil
      rec.last_power_energy_j = 0
      refresh_station_circuit_state(rec)
    end
  end
end

function update_active_station_power_states()
  for unit in pairs(global.ff.active_station_power_units or {}) do
    local rec = global.ff.stations[unit]
    if rec and is_valid(rec.entity) and station_transfer_owner_is_active(rec) then
      local power_entity = apply_station_charge_rate_to_power_entity(rec)
      ensure_station_circuit_entity(rec)
      if power_entity and power_entity.valid then
        local buffer_capacity_j = station_transfer_required_energy_j(rec)
        local current_energy = station_available_energy(rec)
        local ratio = buffer_capacity_j > 0 and math.max(0, math.min(1, current_energy / buffer_capacity_j)) or 0
        rec.stop_power_ratio = ratio
        rec.power_unit_number = power_entity.unit_number
        rec.stop_fully_powered = buffer_capacity_j > 0 and current_energy >= buffer_capacity_j
        rec.last_power_energy_j = current_energy
        refresh_station_circuit_state(rec)
      else
        rec.stop_power_ratio = 0
        rec.stop_fully_powered = false
        rec.power_unit_number = nil
        rec.last_power_energy_j = 0
        refresh_station_circuit_state(rec)
      end
    else
      global.ff.active_station_power_units[unit] = nil
    end
  end
end

-- `find_station_candidates` is defined before the matching-station helper, so
-- keep a shared upvalue here instead of accidentally resolving a nil global
-- when old saves call the route chooser during load.
local collect_matching_station_records

local function find_station_candidates(station_signal_key, station_type)
  local cache = get_runtime_cycle_cache()
  local cache_key = tostring(station_signal_key or "") .. "\31" .. tostring(station_type or "*")
  local cached = cache.powered_station_candidates[cache_key]
  if cached then
    return cached
  end

  local powered = {}
  for _, rec in ipairs(collect_matching_station_records(station_signal_key, station_type)) do
    powered[#powered + 1] = rec
  end
  cache.powered_station_candidates[cache_key] = powered
  return powered
end

-- Extracted route helpers resolve station lookup through the shared `_ENV`, so publish
-- the local candidate finder after its definition to preserve the refactored runtime.
_ENV.find_station_candidates = find_station_candidates

local function collect_powered_station_records_from_units(unit_set)
  local list = {}
  for _, rec in ipairs(collect_station_records_from_units(unit_set)) do
    list[#list + 1] = rec
  end
  return list
end

local function find_fuel_stops()
  return collect_powered_station_records_from_units(global.ff.fuel_station_units)
end

local function find_ammo_stops()
  return collect_powered_station_records_from_units(global.ff.ammo_station_units)
end

local function has_available_ammo_stop(surface_index, network_id)
  for _, rec in ipairs(find_ammo_stops()) do
    if is_valid(rec.entity)
      and (not surface_index or rec.entity.surface.index == surface_index)
      and (network_id == nil or effective_station_network_id(rec) == network_id)
    then
      return true
    end
  end
  return false
end

local function find_trash_stops()
  return collect_powered_station_records_from_units(global.ff.trash_station_units)
end

local function get_item_count(inventory, item_name)
  if not inventory then
    return 0
  end
  return inventory.get_item_count(item_name)
end

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

get_inventory_name_counts = function(inventory)
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

function inventory_usable_slot_count(inventory)
  if not inventory then
    return 0
  end

  local slot_count = #inventory
  if slot_count <= 0 then
    return 0
  end

  if inventory.supports_bar and inventory.supports_bar() then
    local bar = inventory.get_bar()
    if type(bar) == "number" and bar > 0 and bar < slot_count then
      slot_count = bar
    end
  end

  return slot_count
end

function item_stack_size(item_name)
  if not has_item_prototype(item_name) then
    return 1
  end

  local item_proto = item_prototypes_table()[item_name]
  return math.max(1, item_proto and item_proto.stack_size or 1)
end

function item_count_manifest_fill_units(manifest)
  local total_fill_units = 0
  for item_name, amount in pairs(manifest or {}) do
    local numeric_amount = tonumber(amount) or 0
    if type(item_name) == "string" and numeric_amount > 0 then
      total_fill_units = total_fill_units + (numeric_amount / item_stack_size(item_name))
    end
  end
  return total_fill_units
end

function inventory_fill_units(inventory)
  if not inventory then
    return 0
  end

  local total_fill_units = 0
  for slot_index = 1, inventory_usable_slot_count(inventory) do
    local stack = inventory[slot_index]
    if stack and stack.valid_for_read then
      total_fill_units = total_fill_units + math.min(1, stack.count / item_stack_size(stack.name))
    end
  end
  return total_fill_units
end

function freighter_minimum_departure_fill_units(inventory, entry)
  return inventory_usable_slot_count(inventory) * (freighter_schedule_entry_departure_load_percent(entry) / 100)
end

local function get_freighter_capacity(inv, item_name)
  if not inv then
    return 0
  end
  return inv.get_insertable_count(item_name)
end

_ENV.get_freighter_capacity = get_freighter_capacity

local function get_item_fuel_value(name)
  if not has_item_prototype(name) then
    return 0
  end
  local proto = item_prototypes_table()[name]
  return proto.fuel_value or 0
end

local function inventory_fuel_energy(inv)
  if not inv then
    return 0
  end
  local total = 0
  for name, count in pairs(get_inventory_name_counts(inv)) do
    local fv = get_item_fuel_value(name)
    if fv > 0 and count > 0 then
      total = total + fv * count
    end
  end
  return total
end

local function burner_fuel_energy(entity)
  local burner = get_freighter_burner(entity)
  if not burner then
    return 0
  end

  return (burner.remaining_burning_fuel or 0) + (burner.heat or 0)
end

local function clear_legacy_fuel_accounting(freighter)
  if not freighter then
    return
  end

  freighter.fuel_credit_j = 0
  freighter.fuel_debt_j = 0
end

local function available_freighter_fuel_energy(freighter, fuel_inv)
  if not fuel_inv then
    return 0
  end

  clear_legacy_fuel_accounting(freighter)
  local total = inventory_fuel_energy(fuel_inv) + burner_fuel_energy(freighter and freighter.entity)
  if total < 0 then
    return 0
  end
  return total
end

local function get_preferred_capsule_ammo_item(station_inv, ammo_inv)
  for _, name in ipairs(global.ff.capsule_ammo_priority or {}) do
    if has_item_prototype(name) then
      if station_inv and station_inv.get_item_count(name) > 0 then
        return name
      end
      if ammo_inv and ammo_inv.get_item_count(name) > 0 then
        return name
      end
    end
  end
  return nil
end

local function ammo_target_count(ammo_item)
  if not ammo_item or not has_item_prototype(ammo_item) then
    return 200
  end
  return item_prototypes_table()[ammo_item].stack_size or 200
end

local function get_total_capsule_ammo(inv)
  if not inv then
    return 0
  end
  local ammo_priority = global.ff.capsule_ammo_priority or {}
  if #ammo_priority == 0 then
    return 0
  end
  local total = 0
  for _, name in ipairs(ammo_priority) do
    if has_item_prototype(name) then
      total = total + inv.get_item_count(name)
    end
  end
  return total
end

local function transfer_item(source_inv, dest_inv, name, amount)
  if amount <= 0 then
    return 0
  end
  if not source_inv or not dest_inv then
    return 0
  end

  local removed = source_inv.remove{name = name, count = amount}
  if removed <= 0 then
    return 0
  end

  local inserted = dest_inv.insert{name = name, count = removed}
  if inserted < removed then
    source_inv.insert{name = name, count = removed - inserted}
  end
  return inserted
end

local function reserved_inbound_cargo_for_stop(stop_unit_number, item_name, exclude_freighter_unit_number)
  if not stop_unit_number or type(item_name) ~= "string" then
    return 0
  end

  local by_stop = global.ff.inbound_reservations[stop_unit_number]
  local reserved = by_stop and (by_stop[item_name] or 0) or 0

  if exclude_freighter_unit_number then
    local excluded = global.ff.freighters and global.ff.freighters[exclude_freighter_unit_number] or nil
    if excluded
      and excluded.target_station == stop_unit_number
      and ((excluded.inbound_manifest and excluded.inbound_manifest[item_name]) or 0) > 0
      and (excluded.state == "in_transit" or excluded.state == "waiting_unload")
    then
      reserved = reserved - (excluded.inbound_manifest[item_name] or 0)
    end
  end

  return math.max(0, reserved)
end

_ENV.reserved_inbound_cargo_for_stop = reserved_inbound_cargo_for_stop

local function choose_consumption_fuel_item(fuel_inv)
  if not fuel_inv then
    return nil
  end
  local best_name
  local best_value
  for name, count in pairs(get_inventory_name_counts(fuel_inv)) do
    if count > 0 then
      local fv = get_item_fuel_value(name)
      if fv > 0 and (not best_name or fv < best_value) then
        best_name = name
        best_value = fv
      end
    end
  end
  return best_name, best_value or 0
end

local function consume_trip_energy(freighter, fuel_inv, required_energy)
  clear_legacy_fuel_accounting(freighter)
  return fuel_inv ~= nil and available_freighter_fuel_energy(freighter, fuel_inv) >= required_energy
end

local function settle_freighter_fuel_debt(freighter, fuel_inv)
  if not freighter then
    return 0
  end

  clear_legacy_fuel_accounting(freighter)
  return 0
end

local function distance_sq(a, b)
  local dx = a.x - b.x
  local dy = a.y - b.y
  return dx * dx + dy * dy
end

local function trip_ticks_between_positions(from_position, to_position)
  if not from_position or not to_position then
    return 0
  end

  local dx = to_position.x - from_position.x
  local dy = to_position.y - from_position.y
  local dist = math.sqrt(dx * dx + dy * dy)
  return math.max(MIN_TRAVEL_TICKS, math.floor((dist / TILES_PER_TICK) + 0.5))
end

local function trip_energy_between_positions(from_position, to_position)
  local travel_ticks = trip_ticks_between_positions(from_position, to_position)
  local moving_power_w = (FREIGHTER_IDLE_CONSUMPTION_W + FREIGHTER_MOVEMENT_CONSUMPTION_W) * TRIP_FUEL_COST_MULTIPLIER
  return (travel_ticks / 60) * moving_power_w
end

function format_energy_mj_string(energy_j)
  return string.format("%.1f", math.max(0, energy_j or 0) / 1000000)
end

local function trip_energy_summary_string()
  local moving_power_w = (FREIGHTER_IDLE_CONSUMPTION_W + FREIGHTER_MOVEMENT_CONSUMPTION_W) * TRIP_FUEL_COST_MULTIPLIER
  local minimum_trip_energy = (MIN_TRAVEL_TICKS / 60) * moving_power_w
  local per_tile_energy = moving_power_w / (TILES_PER_TICK * 60)
  return "Trip estimates follow freighter burner power and travel time: about "
    .. format_energy_mj_string(per_tile_energy) .. " MJ per tile one-way, with a minimum of "
    .. format_energy_mj_string(minimum_trip_energy) .. " MJ for very short hops."
end

function format_energy_requirement_string(energy_j)
  local coal_value = 0
  if has_item_prototype("coal") then
    local coal_proto = item_prototypes_table()["coal"]
    coal_value = coal_proto and coal_proto.fuel_value or 0
  end
  local text = format_energy_mj_string(energy_j) .. " MJ"
  if coal_value and coal_value > 0 then
    text = text .. " (~" .. tostring(math.ceil(math.max(0, energy_j or 0) / coal_value)) .. " coal)"
  end
  return text
end

function format_energy_shortfall_string(required_energy, available_energy)
  local shortfall_energy = math.max(0, (required_energy or 0) - (available_energy or 0))
  return format_energy_requirement_string(shortfall_energy)
end

collect_matching_station_records = function(station_signal_key, station_type)
  if not station_signal_key then
    return {}
  end

  local cache = get_runtime_cycle_cache()
  local cache_key = tostring(station_signal_key) .. "\31" .. tostring(station_type or "*")
  local cached = cache.station_matches[cache_key]
  if cached then
    return cached
  end

  local matches = {}
  local index = station_type == "demand" and global.ff.demand_station_units_by_name or global.ff.station_units_by_name
  for _, rec in ipairs(collect_station_records_from_units(index[station_signal_key] or {})) do
    if station_type == nil or effective_station_type(rec) == station_type then
      matches[#matches + 1] = rec
    end
  end
  cache.station_matches[cache_key] = matches
  return matches
end

local function freighter_service_network_id(freighter)
  if not freighter then
    return nil
  end

  if freighter_network_hard_mode_enabled() then
    return freighter_network_id(freighter)
  end

  if freighter.route_network_id ~= nil then
    return freighter.route_network_id
  end

  -- Once a freighter has already committed to a station, keep any automated
  -- support-stop lookup inside that same station network.
  local source = freighter.source_station and global.ff.stations[freighter.source_station] or nil
  if source and is_valid(source.entity) then
    return effective_station_network_id(source)
  end

  local target = freighter.target_station and global.ff.stations[freighter.target_station] or nil
  if target and is_valid(target.entity) then
    return effective_station_network_id(target)
  end

  return nil
end

local function station_wait_reason_summary(rec)
  if not rec or not is_valid(rec.entity) then
    return "missing stop"
  end
  refresh_station_power_record(rec)
  local available_energy = station_available_energy(rec)
  local required_energy = station_transfer_owner_is_active(rec) and station_transfer_required_energy_j(rec) or station_action_energy_j(rec)
  return station_chart_tag_text(rec) .. " has charged " .. format_energy_mj_string(available_energy) .. " / " .. format_energy_mj_string(required_energy) .. " MJ for the active transfer"
end

local function station_has_any_fuel_items(inv)
  if not inv then
    return false
  end
  for item_name, count in pairs(get_inventory_name_counts(inv)) do
    if count > 0 and has_item_prototype(item_name) then
      local proto = item_prototypes_table()[item_name]
      if proto and (proto.fuel_value or 0) > 0 then
        return true
      end
    end
  end
  return false
end

local choose_nearest_resupply_stop
local choose_nearest_trash_stop
local choose_route_for_freighter
local can_resupply_transfer_items
local freighter_needs_resupply
local fuel_swap_plan

-- Route planning now lives in `runtime/routes.lua`, but several long-lived closures in
-- this file still capture the historical forward-declared local. Rebind that local to the
-- module-installed function so the extraction keeps the old call sites working.
choose_route_for_freighter = _ENV.choose_route_for_freighter

local function get_gui_target_freighter_record(player_index)
  local edit = global.ff.player_edit[player_index]
  if not edit then
    return nil
  end

  if edit.kind == "freighter" then
    return global.ff.freighters[edit.unit_number]
  end

  if edit.kind == "freighter-map" then
    return edit.freighter_unit_number and global.ff.freighters[edit.freighter_unit_number] or nil
  end

  return nil
end

local function waiting_status_message_for_freighter(freighter)
  if not freighter or not is_valid(freighter.entity) then
    return "No valid flying freighter is selected."
  end

  local active_entry = active_freighter_schedule_entry(freighter)
  local fuel_inv = get_freighter_fuel_inventory(freighter.entity)
  local ammo_inv = get_freighter_ammo_inventory(freighter.entity)
  local cargo_inv = get_freighter_inventory(freighter.entity)
  local available_fuel_energy = available_freighter_fuel_energy(freighter, fuel_inv)
  local fuel_summary = "Fuel available: " .. format_energy_requirement_string(available_fuel_energy) .. ". " .. trip_energy_summary_string()
  local dispatch_route = choose_route_for_freighter(freighter)

  if not freighter_is_full_health(freighter.entity) then
    return "Waiting on repairs: this freighter must be fully healed before it can dock or teleport. " .. fuel_summary
  end

  if cargo_inv then
    local cargo_contents = get_inventory_name_counts(cargo_inv)
    if freighter.state == "idle" and freighter.bad_fuel_dump_pending and next(cargo_contents) ~= nil then
      if not freighter_schedule_entry_allows_trash_interrupt(active_entry) then
        return "Waiting on trash interrupt settings: the freighter staged incompatible fuel into cargo during a fuel swap, but the current schedule leg has trash interrupts disabled. Re-enable trash interrupts or empty the cargo manually."
      end
      local trash = choose_nearest_trash_stop(
        freighter.entity.position,
        freighter.entity.surface and freighter.entity.surface.index or nil,
        freighter_service_network_id(freighter)
      )
      if trash and is_valid(trash.entity) then
        return "Waiting to dump incompatible fuel at Trash stop " .. station_chart_tag_text(trash) .. " before taking new work."
      end
      return "Waiting on a Trash stop: refueling staged incompatible fuel into the freighter cargo so the new fuel could be loaded, but no Trash stop is currently available to dump the old fuel."
    end
    if freighter.state == "idle" and next(cargo_contents) ~= nil then
      for item_name, count in pairs(cargo_contents) do
        return "Waiting on leftover cargo: the freighter is idle but still carries " .. tostring(count) .. " " .. tostring(item_name) .. ". Empty it manually or use a Trash stop / forced route change."
      end
    end
  end

  if freighter.state == "in_transit" then
    local target = global.ff.stations[freighter.target_station]
    if target and is_valid(target.entity) then
      if freighter.trip_operation == "load" then
        return "In transit to load cargo at " .. station_chart_tag_text(target) .. "."
      end
      local cargo_label = freighter.cargo_item and tostring(freighter.cargo_item) or "mixed cargo"
      return "In transit to " .. station_chart_tag_text(target) .. " with " .. tostring(freighter.cargo_count or 0) .. " " .. cargo_label .. "."
    end
    return "In transit, but the destination stop record is missing."
  end

  if freighter.state == "waiting_load" then
    local source = global.ff.stations[freighter.source_station or freighter.target_station]
    if not source or not is_valid(source.entity) then
      return "Waiting to load, but the pickup stop is missing."
    end
    if rawget(source, "power_transfer_owner_unit_number") == freighter.unit_number and not station_has_full_power(source) then
      return "Waiting to load while the pickup transfer charges: " .. station_wait_reason_summary(source) .. "."
    end
    return "Loading cargo at " .. station_chart_tag_text(source) .. "."
  end

  if freighter.state == "waiting_unload" then
    local target = global.ff.stations[freighter.target_station]
    if not target or not is_valid(target.entity) then
      return "Waiting to unload, but the dropoff stop is missing."
    end
    if rawget(target, "power_transfer_owner_unit_number") == freighter.unit_number and not station_has_full_power(target) then
      return "Waiting to unload while the dropoff transfer charges: " .. station_wait_reason_summary(target) .. "."
    end
    local dst_inv = get_inventory(target.entity)
    local cargo_label = freighter.cargo_item and tostring(freighter.cargo_item) or "mixed cargo"
    if not dst_inv then
      return "Waiting to unload, but the dropoff inventory or cargo item is missing."
    end
    if freighter.cargo_item then
      local space = dst_inv.get_insertable_count(freighter.cargo_item)
      if space <= 0 then
        return "Waiting on dropoff space: " .. station_chart_tag_text(target) .. " has no room for " .. tostring(freighter.cargo_item) .. "."
      end
      return "Unloading is partially blocked: " .. station_chart_tag_text(target) .. " can currently take only " .. tostring(space) .. " more " .. tostring(freighter.cargo_item) .. "."
    end
    return "Unloading mixed cargo at " .. station_chart_tag_text(target) .. "; some items are still waiting on destination space."
  end

  if freighter.state == "to_resupply" then
    local target = global.ff.stations[freighter.target_station]
    if target and is_valid(target.entity) then
      return "Heading to resupply at " .. station_chart_tag_text(target) .. ". " .. fuel_summary
    end
    return "Trying to resupply, but the chosen resupply stop is missing."
  end

  if freighter.state == "waiting_resupply" then
    local target = global.ff.stations[freighter.target_station]
    if not target or not is_valid(target.entity) then
      return "Waiting to resupply, but the chosen stop is missing."
    end
    if rawget(target, "power_transfer_owner_unit_number") == freighter.unit_number and not station_has_full_power(target) then
      return "Waiting to resupply while the stop transfer charges: " .. station_wait_reason_summary(target) .. "."
    end
    local station_inv = get_inventory(target.entity)
    if freighter.resupply_needs_fuel and not station_has_any_fuel_items(station_inv) then
      return "Waiting on refuel items: " .. station_chart_tag_text(target) .. " is marked as a fuel stop but currently has no burnable fuel in its cargo inventory."
    end
    if freighter.resupply_needs_ammo and not get_preferred_capsule_ammo_item(station_inv, ammo_inv) then
      return "Waiting on ammo: " .. station_chart_tag_text(target) .. " has no supported freighter ammo available."
    end
    if station_inv and fuel_inv and ammo_inv and not can_resupply_transfer_items(freighter, target, station_inv, ammo_inv, fuel_inv) then
      if not freighter_needs_resupply(freighter, ammo_inv, fuel_inv) then
        return "Resupply is effectively complete at " .. station_chart_tag_text(target) .. ": the freighter is already topped up enough to leave."
      end
      if freighter.resupply_needs_fuel then
        local swap_plan = fuel_swap_plan(freighter, station_inv, fuel_inv)
        if swap_plan then
          if not swap_plan.trash_interrupt_enabled then
            return "Waiting on trash interrupt settings: " .. station_chart_tag_text(target) .. " has a different fuel available, but the current schedule leg has trash interrupts disabled so the freighter cannot dump its incompatible remaining fuel automatically."
          end
          if not swap_plan.trash_stop_available then
            return "Waiting on a Trash stop: " .. station_chart_tag_text(target) .. " has different fuel available, but the freighter must dump its incompatible remaining fuel before it can swap over."
          end
          if not swap_plan.cargo_space_available then
            return "Waiting on cargo space: the freighter must stage its incompatible remaining fuel into its cargo inventory before it can swap to the fuel at " .. station_chart_tag_text(target) .. "."
          end
        end
        local fuel_status = fuel_top_off_status(freighter, station_inv, fuel_inv)
        if fuel_status and not fuel_status.can_fully_top_off then
          return "Waiting on enough fuel stock: " .. station_chart_tag_text(target)
            .. " only has " .. tostring(fuel_status.available) .. " / " .. tostring(fuel_status.needed)
            .. " " .. tostring(fuel_status.fuel_name)
            .. " needed to fully top off the freighter in one resupply action."
        end
        return "Waiting on fuel inventory space: " .. station_chart_tag_text(target) .. " has fuel available, but the freighter cannot insert any more burnable items into its fuel slots."
      end
      if freighter.resupply_needs_ammo then
        local ammo_status = ammo_top_off_status(station_inv, ammo_inv)
        if ammo_status and not ammo_status.can_fully_top_off then
          return "Waiting on enough ammo stock: " .. station_chart_tag_text(target)
            .. " only has " .. tostring(ammo_status.available) .. " / " .. tostring(ammo_status.needed)
            .. " " .. tostring(ammo_status.ammo_item)
            .. " needed to fully top off the freighter in one resupply action."
        end
        return "Waiting on ammo inventory space: the freighter already has as much supported ammo as it can currently take from " .. station_chart_tag_text(target) .. "."
      end
    end
    return "Waiting to resupply at " .. station_chart_tag_text(target) .. "."
  end

  if freighter.state == "to_force_dump" or freighter.state == "waiting_force_dump" then
    local target = global.ff.stations[freighter.target_station]
    if not target or not is_valid(target.entity) then
      return "Waiting to dump cargo, but no valid Trash stop is assigned."
    end
    if freighter.state == "waiting_force_dump"
      and rawget(target, "power_transfer_owner_unit_number") == freighter.unit_number
      and not station_has_full_power(target)
    then
      return "Waiting to dump cargo while the Trash-stop transfer charges: " .. station_wait_reason_summary(target) .. "."
    end
    return "Force route change is active; the freighter is trying to dump cargo at " .. station_chart_tag_text(target) .. "."
  end

  if freighter.force_waiting_for_trash then
    return "Waiting on a Trash stop: force-route-change is enabled, but no Trash stop is available."
  end

  local missing_from, missing_to = freighter_active_leg_missing_route_flags(freighter)
  if missing_from and missing_to then
    return "Waiting on route setup: both source and destination route signals are empty."
  end
  if freighter_schedule_entry_operation(active_entry) == "load" and missing_from then
    return "Waiting on route setup: the load leg needs a pickup route signal."
  end
  if freighter_schedule_entry_operation(active_entry) == "unload" and missing_to then
    return "Waiting on route setup: the unload leg needs a destination route signal."
  end
  if missing_from then
    return "Waiting on route setup: the source route signal is empty."
  end
  if missing_to then
    return "Waiting on route setup: the destination route signal is empty."
  end

  if dispatch_route then
    if dispatch_route.operation == "load" then
      return "Ready to depart: a loading stop is available at " .. station_chart_tag_text(dispatch_route.source) .. "."
    end
    if dispatch_route.operation == "unload" then
      return "Ready to depart: an unload stop is available at " .. station_chart_tag_text(dispatch_route.target) .. "."
    end
    local trip_energy = trip_energy_between_positions(station_dock_position(dispatch_route.source.entity), station_dock_position(dispatch_route.target.entity))
    if available_fuel_energy < trip_energy then
      local message = "Waiting on fuel for the next dispatch route: " .. station_chart_tag_text(dispatch_route.source)
        .. " -> " .. station_chart_tag_text(dispatch_route.target)
        .. " carrying " .. tostring(dispatch_route.item_name)
        .. ". It costs " .. format_energy_requirement_string(trip_energy)
        .. " one-way. " .. format_energy_requirement_string(available_fuel_energy) .. " is already available, so it is short "
        .. format_energy_shortfall_string(trip_energy, available_fuel_energy) .. "."
      if not freighter_schedule_entry_allows_fuel_interrupt(active_entry) then
        message = message .. " Fuel interrupts are disabled for the current schedule leg, so the freighter will wait here until you refuel it manually or lower the route cost."
      else
        local resupply_stop = choose_nearest_resupply_stop(
          freighter.entity.position,
          true,
          false,
          freighter.entity.surface and freighter.entity.surface.index or nil,
          dispatch_route and effective_station_network_id(dispatch_route.source) or freighter_service_network_id(freighter)
        )
        if resupply_stop then
          message = message .. " A fuel stop exists at " .. station_chart_tag_text(resupply_stop) .. "."
        else
          message = message .. " No fuel stop is available, so add more fuel by hand or add a matching fuel stop."
        end
      end
      return message
    end

    return "Ready to depart: a valid route exists from " .. station_chart_tag_text(dispatch_route.source) .. " to " .. station_chart_tag_text(dispatch_route.target) .. " carrying " .. tostring(dispatch_route.item_name) .. "."
  end

  local source_records = collect_matching_station_records(freighter.from_signal_key, nil)
  local target_records = collect_matching_station_records(freighter.to_signal_key, "demand")

  if freighter_schedule_entry_operation(active_entry) == "load" then
    if #source_records == 0 then
      return "Waiting on a source stop: no station matches the selected load signal " .. tostring(freighter.from_signal_key) .. "."
    end
    return "Waiting on pickup cargo: matching load stops currently have nothing the freighter can add to its cargo hold."
  end

  if freighter_schedule_entry_operation(active_entry) == "unload" then
    if item_count_manifest_is_empty(freighter.cargo_manifest) then
      return "Waiting on cargo: the current unload leg has nothing in the freighter inventory to deliver yet."
    end
    if #target_records == 0 then
      return "Waiting on a destination stop: no station matches the selected unload signal " .. tostring(freighter.to_signal_key) .. "."
    end
    return "Waiting on destination space: matching unload stops do not currently have room for the freighter's carried cargo."
  end

  if #source_records == 0 then
    return "Waiting on a source stop: no station matches the selected source signal " .. tostring(freighter.from_signal_key) .. "."
  end
  if #target_records == 0 then
    return "Waiting on a destination stop: no demand station matches the selected destination signal " .. tostring(freighter.to_signal_key) .. "."
  end

  local matching_sources = {}
  local any_non_demand_source = false
  for _, rec in ipairs(source_records) do
    if effective_station_type(rec) ~= "demand" and is_valid(rec.entity) and rec.entity.surface == freighter.entity.surface then
      any_non_demand_source = true
      matching_sources[#matching_sources + 1] = rec
    end
  end
  if not any_non_demand_source then
    return "Waiting on a supply stop: every station matching the source signal is set to Demand, so none can act as pickup."
  end

  local matching_targets = {}
  for _, rec in ipairs(target_records) do
    if is_valid(rec.entity) and rec.entity.surface == freighter.entity.surface then
      matching_targets[#matching_targets + 1] = rec
    end
  end
  if #matching_targets == 0 then
    return "Waiting on a destination stop: no matching demand stop exists on this surface."
  end

  local shared_network_exists = false
  for _, source in ipairs(matching_sources) do
    local source_network_id = effective_station_network_id(source)
    for _, target in ipairs(matching_targets) do
      if target.unit_number ~= source.unit_number and effective_station_network_id(target) == source_network_id then
        shared_network_exists = true
        break
      end
    end
    if shared_network_exists then
      break
    end
  end
  if not shared_network_exists then
    return "Waiting on network match: the source and destination stops use different network IDs, so they cannot link."
  end

  local any_transferable_item = false
  local best_stock_shortfall = nil
  local best_space_shortfall = nil
  local best_fuel_shortfall = nil
  local capsule_ammo_set = global.ff.capsule_ammo_set or {}
  local departure_requirement = freighter_schedule_entry_departure_requirement_text(active_entry)

  for _, source in ipairs(powered_sources) do
    local src_inv = get_inventory(source.entity)
    local contents = get_inventory_name_counts(src_inv)
    for item_name, item_count in pairs(contents) do
      if not capsule_ammo_set[item_name] and item_count > 0 then
        any_transferable_item = true
        local capacity = cargo_inv and get_freighter_capacity(cargo_inv, item_name) or 0
        local minimum_amount = freighter_minimum_departure_amount(capacity, active_entry)
        if capacity > 0 then
          if item_count < minimum_amount then
            if not best_stock_shortfall or item_count > best_stock_shortfall.item_count then
              best_stock_shortfall = {
                source = source,
                item_name = item_name,
                item_count = item_count,
                capacity = capacity,
                minimum_amount = minimum_amount,
              }
            end
          else
            for _, target in ipairs(powered_targets) do
              if target.unit_number ~= source.unit_number then
                local dst_inv = get_inventory(target.entity)
                local insertable = dst_inv and dst_inv.get_insertable_count(item_name) or 0
                local reserved_inbound = reserved_inbound_cargo_for_stop(target.unit_number, item_name, freighter.unit_number)
                local available_insertable = math.max(0, insertable - reserved_inbound)
                local amount = math.min(capacity, item_count, available_insertable)
                if amount >= minimum_amount and effective_station_network_id(target) == effective_station_network_id(source) then
                  local trip_energy = trip_energy_between_positions(station_dock_position(source.entity), station_dock_position(target.entity))
                  if available_fuel_energy < trip_energy then
                    if not best_fuel_shortfall or trip_energy < best_fuel_shortfall.trip_energy then
                      best_fuel_shortfall = {
                        source = source,
                        target = target,
                        item_name = item_name,
                        capacity = capacity,
                        amount = amount,
                        trip_energy = trip_energy,
                      }
                    end
                  else
                    return "Ready to depart: a valid route exists from " .. station_chart_tag_text(source) .. " to " .. station_chart_tag_text(target) .. " carrying " .. tostring(item_name) .. "."
                  end
                else
                  if not best_space_shortfall or available_insertable > best_space_shortfall.available_insertable then
                    best_space_shortfall = {
                      source = source,
                      target = target,
                      item_name = item_name,
                      capacity = capacity,
                      minimum_amount = minimum_amount,
                      available_insertable = available_insertable,
                      reserved_inbound = reserved_inbound,
                    }
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  if best_fuel_shortfall then
    local message = "Waiting on fuel: the cheapest currently valid trip is " .. station_chart_tag_text(best_fuel_shortfall.source)
      .. " -> " .. station_chart_tag_text(best_fuel_shortfall.target)
      .. " carrying " .. tostring(best_fuel_shortfall.item_name)
      .. ". It costs " .. format_energy_requirement_string(best_fuel_shortfall.trip_energy)
      .. " one-way. " .. format_energy_requirement_string(available_fuel_energy) .. " is already available, so it is short "
      .. format_energy_shortfall_string(best_fuel_shortfall.trip_energy, available_fuel_energy) .. "."
    if not freighter_schedule_entry_allows_fuel_interrupt(active_entry) then
      message = message .. " Fuel interrupts are disabled for the current schedule leg, so the freighter cannot auto-detour for refueling."
    else
      local resupply_stop = choose_nearest_resupply_stop(
        freighter.entity.position,
        true,
        false,
        freighter.entity.surface and freighter.entity.surface.index or nil,
        best_fuel_shortfall and effective_station_network_id(best_fuel_shortfall.source) or freighter_service_network_id(freighter)
      )
      if resupply_stop then
        message = message .. " A fuel stop exists at " .. station_chart_tag_text(resupply_stop) .. "."
      else
        message = message .. " No fuel stop is available, so add more fuel by hand or add a matching fuel stop."
      end
    end
    return message
  end

  if best_space_shortfall then
    return "Waiting on destination space: " .. station_chart_tag_text(best_space_shortfall.target)
      .. " can only accept " .. tostring(best_space_shortfall.available_insertable) .. " / " .. tostring(best_space_shortfall.minimum_amount)
      .. " " .. tostring(best_space_shortfall.item_name)
      .. " right now for the current " .. departure_requirement .. " departure requirement"
      .. (best_space_shortfall.reserved_inbound > 0 and (", with " .. tostring(best_space_shortfall.reserved_inbound) .. " already reserved by inbound freighters.") or ".")
  end

  if best_stock_shortfall then
    return "Waiting on pickup stock: the current leg requires at least a " .. departure_requirement .. ". "
      .. station_chart_tag_text(best_stock_shortfall.source)
      .. " has " .. tostring(best_stock_shortfall.item_count) .. " / " .. tostring(best_stock_shortfall.minimum_amount)
      .. " " .. tostring(best_stock_shortfall.item_name) .. "."
  end

  if not any_transferable_item then
    return "Waiting on pickup cargo: matching source stations have no transferable non-ammo items in inventory."
  end

  return "No immediate blocker was detected. If the freighter still looks stuck, the next step is adding logs around its state machine."
end

local function set_freighter_destination(entity, destination)
  if not is_valid(entity) then
    return false
  end
  if entity.type == "spider-vehicle" then
    entity.autopilot_destination = destination
    return true
  end
  return false
end

local function clear_freighter_destination(entity)
  if is_valid(entity) and entity.type == "spider-vehicle" then
    entity.autopilot_destination = nil
  end
end

local function start_travel(freighter, start_pos, end_pos, tick, next_state)
  local dx = end_pos.x - start_pos.x
  local dy = end_pos.y - start_pos.y
  local dist = math.sqrt(dx * dx + dy * dy)
  local travel_ticks = math.max(MIN_TRAVEL_TICKS, math.floor(dist / TILES_PER_TICK + 0.5))

  freighter.state = next_state
  freighter.travel_start_tick = tick
  freighter.travel_end_tick = tick + travel_ticks
  freighter.start_position = start_pos
  freighter.end_position = end_pos
  set_freighter_destination(freighter.entity, end_pos)
end

freighter_needs_resupply = function(freighter, ammo_inv, fuel_inv)
  local surface_index = freighter and freighter.entity and freighter.entity.surface and freighter.entity.surface.index or nil
  local network_id = freighter_service_network_id(freighter)
  return available_freighter_fuel_energy(freighter, fuel_inv) < LOW_FUEL_ENERGY_J
    or (has_available_ammo_stop(surface_index, network_id) and get_total_capsule_ammo(ammo_inv) < LOW_AMMO_COUNT)
end

local function choose_nearest_fuel_stop(from_position, surface_index, network_id)
  local fuel_stops = find_fuel_stops()
  local best
  local best_dist
  for _, rec in ipairs(fuel_stops) do
    if is_valid(rec.entity)
      and (not surface_index or rec.entity.surface.index == surface_index)
      and (network_id == nil or effective_station_network_id(rec) == network_id)
    then
      local pos = station_dock_position(rec.entity)
      local dx = pos.x - from_position.x
      local dy = pos.y - from_position.y
      local d2 = dx * dx + dy * dy
      if not best or d2 < best_dist then
        best = rec
        best_dist = d2
      end
    end
  end
  return best
end

choose_nearest_trash_stop = function(from_position, surface_index, network_id)
  local trash_stops = find_trash_stops()
  local best
  local best_dist
  for _, rec in ipairs(trash_stops) do
    if is_valid(rec.entity)
      and (not surface_index or rec.entity.surface.index == surface_index)
      and (network_id == nil or effective_station_network_id(rec) == network_id)
    then
      local pos = station_dock_position(rec.entity)
      local dx = pos.x - from_position.x
      local dy = pos.y - from_position.y
      local d2 = dx * dx + dy * dy
      if not best or d2 < best_dist then
        best = rec
        best_dist = d2
      end
    end
  end
  return best
end

local function begin_trash_dump_trip(freighter, tick)
  if not freighter or not is_valid(freighter.entity) then
    return false
  end

  local cargo_inv = get_freighter_inventory(freighter.entity)
  local has_cargo = cargo_inv and next(get_inventory_name_counts(cargo_inv)) ~= nil
  if not has_cargo then
    return false
  end

  local trash = choose_nearest_trash_stop(
    freighter.entity.position,
    freighter.entity.surface and freighter.entity.surface.index or nil,
    freighter_service_network_id(freighter)
  )
  if not trash or not is_valid(trash.entity) then
    return false
  end

  clear_route_claim(freighter)
  freighter.source_station = nil
  freighter.target_station = trash.unit_number
  freighter.cargo_item = nil
  freighter.cargo_count = 0
  local start_pos = freighter.entity.position
  local end_pos = station_dock_position(trash.entity)
  start_travel(freighter, start_pos, end_pos, tick, "to_force_dump")
  return true
end

choose_nearest_resupply_stop = function(from_position, needs_fuel, needs_ammo, surface_index, network_id)
  local best
  local best_dist
  local seen_units = {}
  for _, rec in ipairs(collect_powered_station_records_from_units(global.ff.fuel_station_units)) do
    seen_units[rec.unit_number] = true
    if is_valid(rec.entity)
      and (not surface_index or rec.entity.surface.index == surface_index)
      and (network_id == nil or effective_station_network_id(rec) == network_id)
    then
      local supports_fuel = (not needs_fuel) or rec.is_fuel_stop
      local supports_ammo = (not needs_ammo) or rec.is_ammo_stop
      if supports_fuel and supports_ammo then
        local pos = station_dock_position(rec.entity)
        local dx = pos.x - from_position.x
        local dy = pos.y - from_position.y
        local d2 = dx * dx + dy * dy
        if not best or d2 < best_dist then
          best = rec
          best_dist = d2
        end
      end
    end
  end

  for _, rec in ipairs(collect_powered_station_records_from_units(global.ff.ammo_station_units)) do
    if not seen_units[rec.unit_number]
      and is_valid(rec.entity)
      and (not surface_index or rec.entity.surface.index == surface_index)
      and (network_id == nil or effective_station_network_id(rec) == network_id)
    then
      local supports_fuel = (not needs_fuel) or rec.is_fuel_stop
      local supports_ammo = (not needs_ammo) or rec.is_ammo_stop
      if supports_fuel and supports_ammo then
        local pos = station_dock_position(rec.entity)
        local dx = pos.x - from_position.x
        local dy = pos.y - from_position.y
        local d2 = dx * dx + dy * dy
        if not best or d2 < best_dist then
          best = rec
          best_dist = d2
        end
      end
    end
  end

  if best then
    return best
  end

  if needs_fuel then
    return choose_nearest_fuel_stop(from_position, surface_index, network_id)
  end
  if needs_ammo then
    local ammo_stops = find_ammo_stops()
    local ammo_best
    local ammo_best_dist
    for _, rec in ipairs(ammo_stops) do
      if is_valid(rec.entity)
        and (not surface_index or rec.entity.surface.index == surface_index)
        and (network_id == nil or effective_station_network_id(rec) == network_id)
      then
        local pos = station_dock_position(rec.entity)
        local dx = pos.x - from_position.x
        local dy = pos.y - from_position.y
        local d2 = dx * dx + dy * dy
        if not ammo_best or d2 < ammo_best_dist then
          ammo_best = rec
          ammo_best_dist = d2
        end
      end
    end
    return ammo_best
  end
  return nil
end

local function station_fuel_entries(station_inv)
  local fuel_entries = {}
  if not station_inv then
    return fuel_entries
  end

  for name, count in pairs(get_inventory_name_counts(station_inv)) do
    local fuel_value = get_item_fuel_value(name)
    if fuel_value > 0 and count > 0 then
      fuel_entries[#fuel_entries + 1] = {name = name, count = count, fuel_value = fuel_value}
    end
  end

  table.sort(fuel_entries, function(a, b) return a.fuel_value < b.fuel_value end)
  return fuel_entries
end

function ammo_top_off_status(station_inv, ammo_inv)
  if not station_inv or not ammo_inv then
    return nil
  end

  local ammo_item = get_preferred_capsule_ammo_item(station_inv, ammo_inv)
  if not ammo_item then
    return nil
  end

  local target = ammo_target_count(ammo_item)
  local needed = math.max(0, target - get_item_count(ammo_inv, ammo_item))
  if needed <= 0 then
    return nil
  end

  local available = get_item_count(station_inv, ammo_item)
  return {
    ammo_item = ammo_item,
    needed = needed,
    available = available,
    can_fully_top_off = available >= needed,
  }
end

function fuel_top_off_status(freighter, station_inv, fuel_inv)
  if not freighter or not station_inv or not fuel_inv then
    return nil
  end

  -- Resupply spends a full station action charge, so fuel interrupts should only
  -- proceed once one compatible station fuel entry can fill the freighter's
  -- currently insertable burner slots in a single visit instead of trickling in
  -- a few items at a time.
  local closest_direct_shortfall = nil
  for _, entry in ipairs(station_fuel_entries(station_inv)) do
    local needed = fuel_inv.get_insertable_count(entry.name)
    if needed > 0 then
      local status = {
        fuel_name = entry.name,
        needed = needed,
        available = entry.count,
        can_fully_top_off = entry.count >= needed,
      }
      if status.can_fully_top_off then
        return status
      end
      if not closest_direct_shortfall or (status.needed - status.available) < (closest_direct_shortfall.needed - closest_direct_shortfall.available) then
        closest_direct_shortfall = status
      end
    end
  end

  if closest_direct_shortfall then
    return closest_direct_shortfall
  end

  -- When every burner slot is blocked by incompatible fuel, preserve the existing
  -- swap-through-cargo behavior, but still require enough replacement fuel to
  -- refill all freed slots in one action before paying the station charge.
  local swap_plan = fuel_swap_plan(freighter, station_inv, fuel_inv)
  if not swap_plan or not swap_plan.fuel_entry then
    return nil
  end

  local needed = #swap_plan.incompatible_entries * item_stack_size(swap_plan.fuel_entry.name)
  if needed <= 0 then
    return nil
  end

  return {
    fuel_name = swap_plan.fuel_entry.name,
    needed = needed,
    available = swap_plan.fuel_entry.count,
    can_fully_top_off = swap_plan.cargo_space_available
      and swap_plan.trash_stop_available
      and swap_plan.fuel_entry.count >= needed,
    swap_plan = swap_plan,
  }
end

local function incompatible_fuel_entries(fuel_inv, allowed_name)
  local entries = {}
  if not fuel_inv then
    return entries
  end

  for item_name, count in pairs(get_inventory_name_counts(fuel_inv)) do
    if count > 0 and get_item_fuel_value(item_name) > 0 and item_name ~= allowed_name then
      entries[#entries + 1] = {name = item_name, count = count}
    end
  end

  return entries
end

function unsupported_fuel_entries_for_network(incompatible_entries, surface_index, network_id)
  local unsupported = {}
  for _, incompatible in ipairs(incompatible_entries or {}) do
    local provided_somewhere = false
    for _, rec in ipairs(find_fuel_stops()) do
      if is_valid(rec.entity)
        and (not surface_index or rec.entity.surface.index == surface_index)
        and (network_id == nil or effective_station_network_id(rec) == network_id)
      then
        local station_inv = get_inventory(rec.entity)
        if station_inv and get_item_count(station_inv, incompatible.name) > 0 then
          provided_somewhere = true
          break
        end
      end
    end

    if not provided_somewhere then
      unsupported[#unsupported + 1] = incompatible
    end
  end

  return unsupported
end

function next_dispatch_trip_energy_shortfall(freighter, fuel_inv)
  if not freighter or not fuel_inv then
    return nil
  end

  local route = choose_route_for_freighter(freighter)
  if not route or not route.source or not route.target then
    return nil
  end

  local available_energy = available_freighter_fuel_energy(freighter, fuel_inv)
  local trip_energy = trip_energy_between_positions(
    station_dock_position(route.source.entity),
    station_dock_position(route.target.entity)
  )
  if available_energy >= trip_energy then
    return nil
  end

  return {
    route = route,
    available_energy = available_energy,
    trip_energy = trip_energy,
  }
end

fuel_swap_plan = function(freighter, station_inv, fuel_inv)
  if not freighter or not station_inv or not fuel_inv then
    return nil
  end

  local fuel_entries = station_fuel_entries(station_inv)
  if #fuel_entries == 0 then
    return nil
  end

  for _, entry in ipairs(fuel_entries) do
    if fuel_inv.get_insertable_count(entry.name) > 0 then
      return nil
    end
  end

  local cargo_inv = get_freighter_inventory(freighter.entity)
  local active_entry = active_freighter_schedule_entry(freighter)
  local surface_index = freighter.entity.surface and freighter.entity.surface.index or nil
  local network_id = freighter_service_network_id(freighter)
  local trash_interrupt_enabled = freighter_schedule_entry_allows_trash_interrupt(active_entry)
  local trash_stop = choose_nearest_trash_stop(
    freighter.entity.position,
    surface_index,
    network_id
  )

  for _, entry in ipairs(fuel_entries) do
    local incompatible_entries = incompatible_fuel_entries(fuel_inv, entry.name)
    if #incompatible_entries > 0 then
      local cargo_space_available = cargo_inv and true or false
      if cargo_space_available then
        for _, incompatible in ipairs(incompatible_entries) do
          if cargo_inv.get_insertable_count(incompatible.name) < incompatible.count then
            cargo_space_available = false
            break
          end
        end
      end

      return {
        fuel_entry = entry,
        incompatible_entries = incompatible_entries,
        unsupported_incompatible_entries = unsupported_fuel_entries_for_network(incompatible_entries, surface_index, network_id),
        cargo_space_available = cargo_space_available,
        trash_interrupt_enabled = trash_interrupt_enabled,
        trash_stop_available = trash_interrupt_enabled and trash_stop and is_valid(trash_stop.entity) and true or false,
      }
    end
  end

  return nil
end

local function begin_resupply_trip(freighter, tick, forced_needs)
  local ammo_inv = get_freighter_ammo_inventory(freighter.entity)
  local fuel_inv = get_freighter_fuel_inventory(freighter.entity)
  if not ammo_inv or not fuel_inv then
    return false
  end

  local needs_fuel = forced_needs and forced_needs.fuel or (available_freighter_fuel_energy(freighter, fuel_inv) < LOW_FUEL_ENERGY_J)
  local ammo_stop_available = has_available_ammo_stop(
    freighter.entity and freighter.entity.surface and freighter.entity.surface.index or nil,
    freighter_service_network_id(freighter)
  )
  local needs_ammo = (forced_needs and forced_needs.ammo or (get_total_capsule_ammo(ammo_inv) < LOW_AMMO_COUNT)) and ammo_stop_available
  if not needs_fuel and not needs_ammo and not freighter_needs_resupply(freighter, ammo_inv, fuel_inv) then
    return false
  end

  local stop = choose_nearest_resupply_stop(
    freighter.entity.position,
    needs_fuel,
    needs_ammo,
    freighter.entity.surface and freighter.entity.surface.index or nil,
    freighter_service_network_id(freighter)
  )
  if not stop or not is_valid(stop.entity) then
    return false
  end

  clear_route_claim(freighter)
  freighter.cargo_item = nil
  freighter.cargo_count = 0
  freighter.source_station = nil
  freighter.target_station = stop.unit_number
  freighter.resupply_needs_fuel = needs_fuel
  freighter.resupply_needs_ammo = needs_ammo
  local start_pos = freighter.entity.position
  local end_pos = station_dock_position(stop.entity)
  start_travel(freighter, start_pos, end_pos, tick, "to_resupply")
  return true
end

local function do_resupply(freighter)
  local stop = global.ff.stations[freighter.target_station]
  if not stop or not is_valid(stop.entity) then
    return false
  end

  local station_inv = get_inventory(stop.entity)
  local ammo_inv = get_freighter_ammo_inventory(freighter.entity)
  local fuel_inv = get_freighter_fuel_inventory(freighter.entity)
  if not station_inv or not ammo_inv or not fuel_inv then
    return false
  end

  local needs_fuel = freighter.resupply_needs_fuel and stop.is_fuel_stop
  local needs_ammo = freighter.resupply_needs_ammo and stop.is_ammo_stop
  local transferred_any = false

  if needs_fuel then
    local fuel_status = fuel_top_off_status(freighter, station_inv, fuel_inv)
    if not fuel_status or not fuel_status.can_fully_top_off then
      needs_fuel = false
    end
  end

  if needs_ammo then
    local ammo_status = ammo_top_off_status(station_inv, ammo_inv)
    if not ammo_status or not ammo_status.can_fully_top_off then
      needs_ammo = false
    end
  end

  if needs_fuel then
    settle_freighter_fuel_debt(freighter, fuel_inv)
    local swap_plan = fuel_swap_plan(freighter, station_inv, fuel_inv)
    if swap_plan and swap_plan.cargo_space_available and swap_plan.trash_stop_available then
      local cargo_inv = get_freighter_inventory(freighter.entity)
      if cargo_inv then
        for _, incompatible in ipairs(swap_plan.incompatible_entries) do
          local moved = transfer_item(fuel_inv, cargo_inv, incompatible.name, incompatible.count)
          if moved > 0 then
            transferred_any = true
            freighter.bad_fuel_dump_pending = true
          end
        end
      end
    end

    local fuel_entries = station_fuel_entries(station_inv)

    for _, entry in ipairs(fuel_entries) do
      local insertable = fuel_inv.get_insertable_count(entry.name)
      if insertable <= 0 then
        goto continue_fuel_entry
      end
      local moved = transfer_item(station_inv, fuel_inv, entry.name, math.min(entry.count, insertable))
      if moved > 0 then
        transferred_any = true
      end
      ::continue_fuel_entry::
    end

    settle_freighter_fuel_debt(freighter, fuel_inv)
  end

  if needs_ammo then
    local ammo_status = ammo_top_off_status(station_inv, ammo_inv)
    if ammo_status and ammo_status.can_fully_top_off then
      local moved = transfer_item(station_inv, ammo_inv, ammo_status.ammo_item, ammo_status.needed)
      if moved > 0 then
        transferred_any = true
      end
    end
  end

  if not transferred_any then
    return false
  end

  invalidate_runtime_cycle_cache()
  try_freighter_teleport(freighter.entity, station_dock_position(stop.entity))
  return true
end

can_resupply_transfer_items = function(freighter, stop, station_inv, ammo_inv, fuel_inv)
  if not freighter or not stop or not station_inv or not ammo_inv or not fuel_inv then
    return false
  end

  local needs_fuel = freighter.resupply_needs_fuel and stop.is_fuel_stop
  if needs_fuel then
    local fuel_status = fuel_top_off_status(freighter, station_inv, fuel_inv)
    if fuel_status and fuel_status.can_fully_top_off then
      return true
    end
  end

  local needs_ammo = freighter.resupply_needs_ammo and stop.is_ammo_stop
  if needs_ammo then
    local ammo_status = ammo_top_off_status(station_inv, ammo_inv)
    if ammo_status and ammo_status.can_fully_top_off then
      return true
    end
  end

  return false
end

local function is_defense_item(name)
  return global.ff.capsule_ammo_set and global.ff.capsule_ammo_set[name] or false
end

_ENV.is_defense_item = is_defense_item

function freighter_route_network_id(freighter)
  if not freighter then
    return nil
  end
  if freighter_network_hard_mode_enabled() then
    return freighter_network_id(freighter)
  end
  if freighter.route_network_id ~= nil then
    return freighter.route_network_id
  end
  return freighter_service_network_id(freighter)
end

local function apply_station_record_settings(target_rec, source_rec)
  if not target_rec or not source_rec then
    return false
  end

  return apply_station_settings_tags(target_rec, station_settings_tags(source_rec))
end

local function station_settings_tags_from_entity(entity)
  local target = as_valid_entity(entity)
  if not target then
    return nil
  end

  if is_freighter_station_name(target.name) then
    local rec = get_station_record_by_entity(target)
    if not rec then
      register_station(target)
      rec = get_station_record_by_entity(target)
    end
    return rec and station_settings_tags(rec) or nil
  end

  if is_station_ghost_target(target) then
    return station_settings_tags(station_edit_settings_from_tags(target.tags))
  end

  return nil
end

local function apply_station_settings_to_entity(entity, tags)
  local target = as_valid_entity(entity)
  if not target or not tags then
    return false
  end

  if is_freighter_station_name(target.name) then
    local rec = get_station_record_by_entity(target)
    if not rec then
      register_station(target)
      rec = get_station_record_by_entity(target)
    end
    return rec and apply_station_settings_tags(rec, tags) or false
  end

  if is_station_ghost_target(target) then
    local merged_tags = target.tags or {}
    merged_tags.ff_station_settings = tags.ff_station_settings
    target.tags = merged_tags
    return true
  end

  return false
end

local function station_settings_paste_target_text(entity)
  local target = as_valid_entity(entity)
  if not target then
    return "flying freighter stop"
  end

  if is_freighter_station_name(target.name) then
    local rec = get_station_record_by_entity(target)
    if not rec then
      register_station(target)
      rec = get_station_record_by_entity(target)
    end
    return rec and station_chart_tag_text(rec) or "flying freighter stop"
  end

  if is_station_ghost_target(target) then
    return station_chart_tag_text(station_edit_settings_from_tags(target.tags)) .. " ghost"
  end

  return "flying freighter stop"
end

function freighter_settings_tags_from_entity(entity)
  local target = as_valid_entity(entity)
  if not target then
    return nil
  end

  if target.name == FREIGHTER_NAME then
    local rec = get_freighter_record_by_entity(target)
    if not rec then
      register_freighter(target)
      rec = get_freighter_record_by_entity(target)
    end
    return rec and freighter_settings_tags(rec) or nil
  end

  if is_freighter_ghost_target(target) then
    return freighter_settings_tags(freighter_edit_settings_from_tags(target.tags))
  end

  return nil
end

function apply_freighter_settings_to_entity(entity, tags)
  local target = as_valid_entity(entity)
  if not target or not tags then
    return false
  end

  if target.name == FREIGHTER_NAME then
    local rec = get_freighter_record_by_entity(target)
    if not rec then
      register_freighter(target)
      rec = get_freighter_record_by_entity(target)
    end
    return rec and apply_freighter_settings_tags(rec, tags) or false
  end

  if is_freighter_ghost_target(target) then
    -- Preserve any unrelated ghost metadata while replacing just the freighter
    -- settings payload so shift-copy from a built freighter behaves the same as
    -- editing the ghost through the custom pre-construction GUI.
    local merged_tags = target.tags or {}
    merged_tags.ff_freighter_settings = tags.ff_freighter_settings
    target.tags = merged_tags
    return true
  end

  return false
end

function freighter_settings_paste_target_text(entity)
  local target = as_valid_entity(entity)
  if not target then
    return "flying freighter"
  end

  if target.name == FREIGHTER_NAME then
    return freighter_runtime_name(target, target.unit_number)
  end

  if is_freighter_ghost_target(target) then
    return "flying freighter ghost"
  end

  return "flying freighter"
end

local function effective_freighter_route_settings(rec)
  if not rec then
    return nil, nil
  end

  sync_freighter_route_signal_fields(rec)
  local next_from = rec.pending_from_signal_key or rec.from_signal_key
  local next_to = rec.pending_to_signal_key or rec.to_signal_key
  return normalize_freighter_route_signal_key(next_from), normalize_freighter_route_signal_key(next_to)
end

function freighter_schedule_start_index_for_apply(schedule)
  return clamp_freighter_schedule_index(1, copy_freighter_schedule_entries(schedule))
end

function apply_freighter_schedule_update(rec, schedule, start_index, force_now)
  if not rec then
    return false
  end

  local normalized_schedule = copy_freighter_schedule_entries(schedule)
  local normalized_start_index = clamp_freighter_schedule_index(start_index or 1, normalized_schedule)

  if force_now then
    rec.pending_schedule = normalized_schedule
    rec.pending_schedule_current_index = normalized_start_index
    rec.force_route_now = true
    rec.force_waiting_for_trash = false
    sync_freighter_route_signal_fields(rec)
    return "forced"
  end

  if rec.state == "idle" then
    clear_route_claim(rec)
    rec.schedule = normalized_schedule
    rec.schedule_current_index = normalized_start_index
    rec.pending_schedule = nil
    rec.pending_schedule_current_index = nil
    rec.pending_from_signal_key = nil
    rec.pending_to_signal_key = nil
    rec.source_station = nil
    rec.target_station = nil
    rec.inbound_manifest = nil
    rec.trip_operation = nil
    rec.idle_waiting_for_load = nil
    rec.travel_start_tick = nil
    rec.travel_end_tick = nil
    rec.start_position = nil
    rec.end_position = nil
    rec.force_route_now = false
    rec.force_waiting_for_trash = false
    rec.completed_schedule_leg = nil
    sync_freighter_route_signal_fields(rec)
    sync_freighter_cargo_summary_from_inventory(rec)
    return "applied"
  end

  rec.pending_schedule = normalized_schedule
  rec.pending_schedule_current_index = normalized_start_index
  sync_freighter_route_signal_fields(rec)
  return "queued"
end

local function apply_freighter_route_update(rec, next_from, next_to, force_now)
  return apply_freighter_schedule_update(rec, {
    {
      from_signal_key = normalize_freighter_route_signal_key(next_from),
      to_signal_key = normalize_freighter_route_signal_key(next_to),
    },
  }, 1, force_now)
end

function freighter_has_pending_route_update(rec)
  return rec and (rec.pending_schedule ~= nil or rec.pending_from_signal_key ~= nil or rec.pending_to_signal_key ~= nil) or false
end

function defer_resupply_interrupt_after_manual_schedule(freighter, tick)
  if not freighter then
    return
  end

  -- Manual schedule edits are an explicit player override. When a freighter is
  -- parked at an understocked interrupt stop, applying the new schedule should not
  -- immediately bounce it straight back into the same automatic resupply detour on
  -- the very next idle tick before the new route logic gets a chance to run.
  freighter.manual_schedule_interrupt_deferral_tick = math.max(0, math.floor(tonumber(tick) or 0)) + 60
end

function manual_resupply_interrupt_is_deferred(freighter, tick)
  local deferral_tick = freighter and freighter.manual_schedule_interrupt_deferral_tick or nil
  if deferral_tick == nil then
    return false
  end

  if (tonumber(tick) or 0) < deferral_tick then
    return true
  end

  freighter.manual_schedule_interrupt_deferral_tick = nil
  return false
end

local function apply_pending_route_update(rec)
  if not rec then
    return false
  end

  if rec.pending_schedule then
    rec.schedule = copy_freighter_schedule_entries(rec.pending_schedule)
    rec.schedule_current_index = clamp_freighter_schedule_index(rec.pending_schedule_current_index or 1, rec.schedule)
    rec.pending_schedule = nil
    rec.pending_schedule_current_index = nil
  else
    rec.schedule = copy_freighter_schedule_entries({
      {
        from_signal_key = rec.pending_from_signal_key,
        to_signal_key = rec.pending_to_signal_key,
      },
    })
    rec.schedule_current_index = 1
  end

  rec.pending_from_signal_key = nil
  rec.pending_to_signal_key = nil
  rec.force_route_now = false
  rec.force_waiting_for_trash = false
  sync_freighter_route_signal_fields(rec)
  return true
end

function abort_resupply_interrupt_for_pending_schedule(freighter, tick)
  if not freighter then
    return false
  end

  if freighter.state ~= "to_resupply" and freighter.state ~= "waiting_resupply" then
    return false
  end

  if not freighter_has_pending_route_update(freighter) then
    return false
  end

  -- A freighter can wait forever at an interrupt stop that is powered but cannot
  -- actually move any fuel or ammo. In that deadlock, queued schedule edits would
  -- otherwise never be applied because the normal `finish_unload()` handoff only
  -- runs after the interrupt succeeds or becomes unnecessary. Treat the manual edit
  -- as a player-directed cancellation of the current interrupt detour instead.
  clear_freighter_destination(freighter.entity)
  finish_unload(freighter)
  defer_resupply_interrupt_after_manual_schedule(freighter, tick)
  return true
end

function advance_freighter_schedule_leg(rec)
  if not rec then
    return false
  end

  sync_freighter_route_signal_fields(rec)
  if not rec.schedule or #rec.schedule <= 1 then
    return false
  end

  rec.schedule_current_index = (clamp_freighter_schedule_index(rec.schedule_current_index, rec.schedule) % #rec.schedule) + 1
  sync_freighter_route_signal_fields(rec)
  return true
end

function next_freighter_schedule_entry(rec)
  if not rec or type(rec.schedule) ~= "table" or #rec.schedule == 0 then
    return nil
  end

  local next_index = (clamp_freighter_schedule_index(rec.schedule_current_index, rec.schedule) % #rec.schedule) + 1
  return freighter_schedule_entry_at(rec.schedule, next_index)
end

function freighter_active_leg_missing_route_flags(rec)
  if not rec then
    return true, true
  end

  local active_entry = active_freighter_schedule_entry(rec)
  local operation = freighter_schedule_entry_operation(active_entry)
  if operation == "load" then
    return not rec.from_signal_key, false
  end
  if operation == "unload" then
    return false, not rec.to_signal_key
  end
  return not rec.from_signal_key, not rec.to_signal_key
end

local function should_advance_idle_freighter_to_next_unload_leg(rec)
  if not rec or not rec.schedule or #rec.schedule <= 1 then
    return false
  end

  local active_entry = active_freighter_schedule_entry(rec)
  if freighter_schedule_entry_operation(active_entry) ~= "load" then
    return false
  end

  -- A load leg should hand off to the next unload leg once cargo is already on
  -- board. In a few edge cases older queued route state or stale leg position can
  -- leave the freighter idle on that completed load leg even though it now has a
  -- valid delivery leg next in the schedule. Only auto-advance when the immediate
  -- next leg is an unload stop so the fix preserves legitimate multi-load loops.
  if item_count_manifest_is_empty(effective_freighter_cargo_manifest(rec)) then
    return false
  end

  local next_index = (clamp_freighter_schedule_index(rec.schedule_current_index, rec.schedule) % #rec.schedule) + 1
  local next_entry = freighter_schedule_entry_at(rec.schedule, next_index)
  return freighter_schedule_entry_operation(next_entry) == "unload"
end

local function apply_freighter_record_settings(target_rec, source_rec)
  if not target_rec or not source_rec then
    return false
  end

  local next_from, next_to = effective_freighter_route_settings(source_rec)
  return apply_freighter_schedule_update(target_rec, freighter_schedule_entries(source_rec), 1, false), next_from, next_to
end

local function handle_entity_settings_pasted(event)
  local source = as_valid_entity(event.source)
  local destination = as_valid_entity(event.destination)
  if not source or not destination then
    return
  end

  local player = event.player_index and game.get_player(event.player_index) or nil

  if ((is_freighter_station_name(source.name)) or is_station_ghost_target(source))
    and ((is_freighter_station_name(destination.name)) or is_station_ghost_target(destination))
  then
    local tags = station_settings_tags_from_entity(source)
    if apply_station_settings_to_entity(destination, tags) and player then
      player.print({"", "Pasted flying freighter stop settings to ", station_settings_paste_target_text(destination)})
    end
    return
  end

  if (source.name == FREIGHTER_NAME or is_freighter_ghost_target(source))
    and (destination.name == FREIGHTER_NAME or is_freighter_ghost_target(destination))
  then
    local tags = freighter_settings_tags_from_entity(source)
    local result = apply_freighter_settings_to_entity(destination, tags)
    if result and player then
      local pasted_rec = freighter_edit_settings_from_tags(tags)
      local next_from, next_to = effective_freighter_route_settings(pasted_rec)
      player.print({
        "",
        "Pasted flying freighter route settings to ",
        freighter_settings_paste_target_text(destination),
        " (",
        route_signal_display_text(next_from),
        " -> ",
        route_signal_display_text(next_to),
        ")",
      })
    end
  end
end

local function depart(freighter, route, tick)
  local cargo_inv = get_freighter_inventory(freighter.entity)
  local fuel_inv = get_freighter_fuel_inventory(freighter.entity)
  local active_entry = active_freighter_schedule_entry(freighter)
  local operation = route and route.operation or "transfer"
  if not route or not cargo_inv or not fuel_inv then
    return false
  end

  freighter.manual_schedule_interrupt_deferral_tick = nil

  if operation == "load" then
    local source = route.source
    if not source or not is_valid(source.entity) then
      return false
    end
    local src_pos = station_dock_position(source.entity)
    local trip_energy = trip_energy_between_positions(freighter.entity.position, src_pos)
    if available_freighter_fuel_energy(freighter, fuel_inv) < trip_energy then
      if freighter_schedule_entry_allows_fuel_interrupt(active_entry) then
        begin_resupply_trip(freighter, tick, {fuel = true})
      end
      return false
    end
    if not consume_trip_energy(freighter, fuel_inv, trip_energy) then
      return false
    end

    freighter.state = "in_transit"
    freighter.trip_operation = "load"
    freighter.trip_manifest = copy_item_count_manifest(route.manifest)
    freighter.idle_waiting_for_load = route.idle_wait and true or nil
    freighter.inbound_manifest = nil
    freighter.source_station = source.unit_number
    freighter.target_station = source.unit_number
    freighter.route_network_id = route.route_network_id
    freighter.route_key = route.route_key
    start_travel(freighter, freighter.entity.position, src_pos, tick, "in_transit")
    return true
  end

  if operation == "unload" then
    local target = route.target
    if not target or not is_valid(target.entity) then
      return false
    end
    local dst_pos = station_dock_position(target.entity)
    local trip_energy = trip_energy_between_positions(freighter.entity.position, dst_pos)
    if available_freighter_fuel_energy(freighter, fuel_inv) < trip_energy then
      if freighter_schedule_entry_allows_fuel_interrupt(active_entry) then
        begin_resupply_trip(freighter, tick, {fuel = true})
      end
      return false
    end
    if not consume_trip_energy(freighter, fuel_inv, trip_energy) then
      return false
    end

    freighter.state = "in_transit"
    freighter.trip_operation = "unload"
    freighter.trip_manifest = copy_item_count_manifest(route.manifest)
    freighter.idle_waiting_for_load = nil
    freighter.inbound_manifest = copy_item_count_manifest(route.manifest)
    freighter.target_station = target.unit_number
    freighter.route_network_id = route.route_network_id or freighter.route_network_id
    freighter.route_key = route.route_key
    add_inbound_reservation_manifest(target.unit_number, freighter.inbound_manifest)
    start_travel(freighter, freighter.entity.position, dst_pos, tick, "in_transit")
    return true
  end

  local source_inv = get_inventory(route.source.entity)
  local target_inv = get_inventory(route.target.entity)
  if not source_inv or not target_inv then
    return false
  end

  if get_item_count(source_inv, route.item_name) < route.amount then
    return false
  end

  local reserved_inbound = reserved_inbound_cargo_for_stop(route.target.unit_number, route.item_name, freighter.unit_number)
  local available_insertable = math.max(0, target_inv.get_insertable_count(route.item_name) - reserved_inbound)
  if available_insertable < route.amount then
    return false
  end

  if not cargo_inv.can_insert{name = route.item_name, count = route.amount} then
    return false
  end

  local src_pos = station_dock_position(route.source.entity)
  local dst_pos = station_dock_position(route.target.entity)
  local trip_energy = trip_energy_between_positions(src_pos, dst_pos)
  if available_freighter_fuel_energy(freighter, fuel_inv) < trip_energy then
    if freighter_schedule_entry_allows_fuel_interrupt(active_entry) then
      begin_resupply_trip(freighter, tick, {fuel = true})
    end
    return false
  end

  local previous_fuel_credit_j = freighter.fuel_credit_j or 0
  local previous_fuel_debt_j = freighter.fuel_debt_j or 0
  if not consume_trip_energy(freighter, fuel_inv, trip_energy) then
    return false
  end

  if not try_freighter_teleport(freighter.entity, src_pos) then
    freighter.fuel_credit_j = previous_fuel_credit_j
    freighter.fuel_debt_j = previous_fuel_debt_j
    return false
  end

  freighter.state = "waiting_load"
  freighter.trip_operation = "transfer"
  freighter.trip_manifest = copy_item_count_manifest(route.manifest)
  freighter.idle_waiting_for_load = nil
  freighter.inbound_manifest = copy_item_count_manifest(route.manifest)
  freighter.source_station = route.source.unit_number
  freighter.target_station = route.target.unit_number
  freighter.route_network_id = route.route_network_id
  freighter.route_key = route.route_key
  add_inbound_reservation_manifest(route.target.unit_number, freighter.inbound_manifest)
  freighter.travel_start_tick = nil
  freighter.travel_end_tick = nil
  freighter.start_position = nil
  freighter.end_position = nil
  return true
end

clear_route_claim = function(freighter)
  if freighter.route_key then
    freighter.route_key = nil
  end
end

finish_unload = function(freighter)
  local source = freighter.source_station and global.ff.stations[freighter.source_station] or nil
  if source and rawget(source, "power_transfer_owner_unit_number") == freighter.unit_number then
    cancel_station_action_energy(source, freighter.unit_number)
  end
  local target = freighter.target_station and global.ff.stations[freighter.target_station] or nil
  if target and rawget(target, "power_transfer_owner_unit_number") == freighter.unit_number then
    cancel_station_action_energy(target, freighter.unit_number)
  end
  release_freighter_inbound_reservation(freighter)
  clear_route_claim(freighter)
  clear_freighter_destination(freighter.entity)
  if freighter.pending_schedule or freighter.pending_from_signal_key or freighter.pending_to_signal_key then
    apply_pending_route_update(freighter)
  elseif freighter.completed_schedule_leg then
    advance_freighter_schedule_leg(freighter)
  end
  freighter.completed_schedule_leg = nil
  sync_freighter_route_signal_fields(freighter)
  freighter.state = "idle"
  freighter.inbound_manifest = nil
  freighter.trip_manifest = nil
  freighter.trip_operation = nil
  freighter.idle_waiting_for_load = nil
  freighter.source_station = nil
  freighter.target_station = nil
  freighter.travel_start_tick = nil
  freighter.travel_end_tick = nil
  freighter.start_position = nil
  freighter.end_position = nil
  freighter.resupply_needs_fuel = nil
  freighter.resupply_needs_ammo = nil
  freighter.force_route_now = false
  freighter.force_waiting_for_trash = false
  sync_freighter_cargo_summary_from_inventory(freighter)
  if item_count_manifest_is_empty(freighter.cargo_manifest) then
    freighter.route_network_id = nil
  end
end

local function process_freighter(freighter, tick)
  if not is_valid(freighter.entity) then
    return
  end

  clear_freighter_startup_fuel_request_if_satisfied(freighter)

  local active_entry = active_freighter_schedule_entry(freighter)

  if abort_resupply_interrupt_for_pending_schedule(freighter, tick) then
    return
  end

  if entity_marked_for_deconstruction(freighter.entity) then
    clear_route_claim(freighter)
    clear_freighter_destination(freighter.entity)
    return
  end

  if freighter.force_route_now and freighter.state ~= "to_force_dump" and freighter.state ~= "waiting_force_dump" then
    local cargo_inv = get_freighter_inventory(freighter.entity)
    local has_cargo = cargo_inv and next(get_inventory_name_counts(cargo_inv)) ~= nil
    if not has_cargo and (freighter.pending_from_signal_key ~= nil or freighter.pending_to_signal_key ~= nil) then
      apply_pending_route_update(freighter)
      return
    end

    if begin_trash_dump_trip(freighter, tick) then
      return
    elseif not freighter.force_waiting_for_trash then
      freighter.force_route_now = false
      freighter.force_waiting_for_trash = true
      freighter.entity.force.print({"ff.no-trash-stop"})
    end
  end

  if freighter.bad_fuel_dump_pending and freighter.state == "idle" then
    local cargo_inv = get_freighter_inventory(freighter.entity)
    local has_cargo = cargo_inv and next(get_inventory_name_counts(cargo_inv)) ~= nil
    if not has_cargo then
      freighter.bad_fuel_dump_pending = nil
    elseif not freighter_schedule_entry_allows_trash_interrupt(active_entry) then
      return
    elseif begin_trash_dump_trip(freighter, tick) then
      return
    else
      return
    end
  end

  if freighter.state == "idle" then
    if should_advance_idle_freighter_to_next_unload_leg(freighter) then
      advance_freighter_schedule_leg(freighter)
      active_entry = active_freighter_schedule_entry(freighter)
    end

    local ammo_inv = get_freighter_ammo_inventory(freighter.entity)
    local fuel_inv = get_freighter_fuel_inventory(freighter.entity)
    if ammo_inv and fuel_inv and not manual_resupply_interrupt_is_deferred(freighter, tick) then
      local needs_fuel_interrupt = freighter_schedule_entry_allows_fuel_interrupt(active_entry)
        and available_freighter_fuel_energy(freighter, fuel_inv) < LOW_FUEL_ENERGY_J
      local needs_ammo_interrupt = freighter_schedule_entry_allows_ammo_interrupt(active_entry)
        and has_available_ammo_stop(freighter.entity and freighter.entity.surface and freighter.entity.surface.index or nil, freighter_service_network_id(freighter))
        and get_total_capsule_ammo(ammo_inv) < LOW_AMMO_COUNT
      if (needs_fuel_interrupt or needs_ammo_interrupt)
        and begin_resupply_trip(freighter, tick, {fuel = needs_fuel_interrupt, ammo = needs_ammo_interrupt})
      then
        return
      end
    end

    local route = choose_route_for_freighter(freighter)
    if route then
      depart(freighter, route, tick)
      return
    end

    if freighter_schedule_entry_operation(active_entry) == "load" then
      local idle_wait_route = choose_idle_load_wait_route_for_freighter(freighter, active_entry, get_runtime_cycle_cache())
      if idle_wait_route then
        depart(freighter, idle_wait_route, tick)
      end
    end
    return
  end

  if freighter.state == "in_transit" then
    if not freighter.travel_start_tick or not freighter.travel_end_tick then
      finish_unload(freighter)
      return
    end

    if not freighter.end_position then
      finish_unload(freighter)
      return
    end

    if freighter.entity.type == "spider-vehicle" then
      if not freighter.entity.autopilot_destination then
        set_freighter_destination(freighter.entity, freighter.end_position)
      end
      if distance_sq(freighter.entity.position, freighter.end_position) <= 4 then
        clear_freighter_destination(freighter.entity)
        freighter.state = freighter.trip_operation == "load" and "waiting_load" or "waiting_unload"
        return
      end
      if tick >= freighter.travel_end_tick then
        set_freighter_destination(freighter.entity, freighter.end_position)
        freighter.travel_end_tick = tick + MIN_TRAVEL_TICKS
      end
      return
    end

    local duration = freighter.travel_end_tick - freighter.travel_start_tick
    if duration <= 0 then
      duration = 1
    end

    local p = (tick - freighter.travel_start_tick) / duration
    if p < 0 then p = 0 end
    if p > 1 then p = 1 end

    local sx = freighter.start_position.x
    local sy = freighter.start_position.y
    local ex = freighter.end_position.x
    local ey = freighter.end_position.y

    local px = sx + (ex - sx) * p
    local py = sy + (ey - sy) * p
    freighter.entity.teleport({x = px, y = py})

    if tick >= freighter.travel_end_tick then
      freighter.state = freighter.trip_operation == "load" and "waiting_load" or "waiting_unload"
    end
    return
  end

  if freighter.state == "waiting_load" then
    local source = global.ff.stations[freighter.source_station or freighter.target_station]
    if not source or not is_valid(source.entity) then
      finish_unload(freighter)
      return
    end

    local source_inv = get_inventory(source.entity)
    local cargo_inv = get_freighter_inventory(freighter.entity)
    if not source_inv or not cargo_inv then
      cancel_station_action_energy(source, freighter.unit_number)
      finish_unload(freighter)
      return
    end

    local minimum_departure_fill_units = freighter_minimum_departure_fill_units(cargo_inv, active_entry)
    local current_fill_units = inventory_fill_units(cargo_inv)

    if freighter.idle_waiting_for_load then
      -- Pickup-side parking intentionally keeps the freighter docked at a matching
      -- source stop even before the leg is ready to depart. Rebuild the live load
      -- manifest each tick so the freighter starts boarding as soon as the source and
      -- any paired unload destination can satisfy the current leg's threshold.
      local live_manifest = nil
      local live_total_count = 0
      live_manifest, live_total_count = build_live_load_manifest_for_freighter(freighter, source, cargo_inv, get_runtime_cycle_cache())
      freighter.trip_manifest = live_manifest
      if live_total_count <= 0 then
        cancel_station_action_energy(source, freighter.unit_number)
        return
      end
      if item_count_manifest_fill_units(live_manifest) < minimum_departure_fill_units then
        cancel_station_action_energy(source, freighter.unit_number)
        return
      end
      freighter.idle_waiting_for_load = nil
    end

    -- A route can become stale after the freighter commits to it: inserters, bots, or
    -- another freighter may pull stock from the source before this freighter actually
    -- boards. Rebuild the live pickup manifest before charging the station so a stop
    -- never burns `100MJ` trying to chase cargo that is no longer sufficient to reach
    -- the configured minimum departure load.
    if current_fill_units < minimum_departure_fill_units then
      local live_manifest, live_total_count = build_live_load_manifest_for_freighter(freighter, source, cargo_inv, get_runtime_cycle_cache())
      local live_fill_units = item_count_manifest_fill_units(live_manifest)
      local remaining_fill_units_needed = math.max(0, minimum_departure_fill_units - current_fill_units)
      freighter.trip_manifest = live_manifest

      -- When the freighter is still empty and the source can no longer satisfy the leg's
      -- threshold, abandon the visit entirely so the freighter can choose a better stop
      -- instead of repeatedly charging the same understocked station.
      if current_fill_units <= 0 and (live_total_count <= 0 or live_fill_units < minimum_departure_fill_units) then
        cancel_station_action_energy(source, freighter.unit_number)
        finish_unload(freighter)
        return
      end

      -- Once a freighter has already boarded some cargo, keep it docked without charging
      -- the station again until enough additional stock exists to finish reaching the
      -- departure threshold. This prevents one-item retries from draining the stop every
      -- second while still preserving the configured "wait until full enough" behavior.
      if live_total_count <= 0 or live_fill_units < remaining_fill_units_needed then
        cancel_station_action_energy(source, freighter.unit_number)
        return
      end
    end

    -- Older saves may still reach a pickup stop with a route manifest that was
    -- selected before the stricter cargo-fill threshold was enforced during
    -- route planning. If the freighter is still empty and the planned pickup can
    -- never satisfy the configured departure threshold, cancel this visit so the
    -- freighter can idle and wait for a legitimately full-enough route instead of
    -- boarding a token amount of cargo.
    if inventory_fill_units(cargo_inv) <= 0
      and item_count_manifest_fill_units(freighter.trip_manifest) < minimum_departure_fill_units
    then
      cancel_station_action_energy(source, freighter.unit_number)
      finish_unload(freighter)
      return
    end

    local can_transfer = false
    for item_name, requested in pairs(freighter.trip_manifest or {}) do
      if requested > 0 and source_inv.get_item_count(item_name) > 0 and cargo_inv.get_insertable_count(item_name) > 0 then
        can_transfer = true
        break
      end
    end

    if can_transfer and not consume_station_action_energy(source, "waiting-load", freighter.unit_number) then
      return
    end
    if not can_transfer then
      cancel_station_action_energy(source, freighter.unit_number)
    end

    local transferred_any = false
    for item_name, requested in pairs(freighter.trip_manifest or {}) do
      local amount = math.min(requested, source_inv.get_item_count(item_name), cargo_inv.get_insertable_count(item_name))
      if amount > 0 then
        local moved = transfer_item(source_inv, cargo_inv, item_name, amount)
        if moved > 0 then
          transferred_any = true
          freighter.trip_manifest[item_name] = math.max(0, requested - moved)
        end
      end
    end

    if can_transfer and not transferred_any then
      -- The station had enough buffered power and the manifest looked valid when we
      -- decided to charge it, but nothing actually moved. Emit a GPS-tagged warning
      -- so persistent no-op drains can be located in live saves.
      warn_station_noop_power_drain(source, {"ff.noop_power_drain_context_load"})
    end

    if transferred_any then
      invalidate_runtime_cycle_cache()
      try_freighter_teleport(freighter.entity, station_dock_position(source.entity))
    end

    -- Minimum departure load is now enforced at the pickup stop itself. The
    -- route planner already guarantees the selected visit can meet the threshold
    -- using real cargo-slot fill, so the dock only needs to hold the freighter
    -- until the current cargo inventory itself reaches that configured fill level.
    do
      local current_fill_units = inventory_fill_units(cargo_inv)
      if current_fill_units < minimum_departure_fill_units then
        return
      end
    end

    if freighter.trip_operation == "transfer" then
      local target = global.ff.stations[freighter.target_station]
      if not target or not is_valid(target.entity) then
        finish_unload(freighter)
        return
      end
      freighter.state = "in_transit"
      start_travel(freighter, station_dock_position(source.entity), station_dock_position(target.entity), tick, "in_transit")
      sync_freighter_cargo_summary_from_inventory(freighter)
      return
    end

    freighter.completed_schedule_leg = true
    finish_unload(freighter)
    return
  end

  if freighter.state == "waiting_unload" then
    local target = global.ff.stations[freighter.target_station]
    if not target or not is_valid(target.entity) then
      finish_unload(freighter)
      return
    end

    local dst_inv = get_inventory(target.entity)
    local cargo_inv = get_freighter_inventory(freighter.entity)
    if not dst_inv or not cargo_inv then
      cancel_station_action_energy(target, freighter.unit_number)
      finish_unload(freighter)
      return
    end

    local cargo_manifest = get_inventory_name_counts(cargo_inv)
    local using_explicit_manifest = not item_count_manifest_is_empty(freighter.trip_manifest)
      or not item_count_manifest_is_empty(freighter.inbound_manifest)
    local planned_manifest = copy_item_count_manifest(freighter.trip_manifest)
    if item_count_manifest_is_empty(planned_manifest) then
      planned_manifest = copy_item_count_manifest(freighter.inbound_manifest)
    end
    if item_count_manifest_is_empty(planned_manifest) then
      planned_manifest = cargo_manifest
    end
    local demand_requests = station_demand_request_manifest(target)
    local current_counts = get_inventory_name_counts(dst_inv)
    local can_transfer = false
    for item_name, planned_amount in pairs(planned_manifest) do
      local carried_amount = cargo_manifest[item_name] or 0
      local live_amount = live_unloadable_amount_for_target(
        target,
        dst_inv,
        demand_requests,
        current_counts,
        item_name,
        carried_amount,
        planned_amount,
        freighter.unit_number
      )
      if live_amount > 0 then
        can_transfer = true
        break
      end
    end

    if can_transfer and not consume_station_action_energy(target, "waiting-unload", freighter.unit_number) then
      return
    end
    if not can_transfer then
      cancel_station_action_energy(target, freighter.unit_number)
    end

    local moved_any = false
    for item_name, planned_amount in pairs(planned_manifest) do
      local carried_amount = cargo_manifest[item_name] or 0
      if planned_amount > 0 and carried_amount > 0 then
        local live_amount = live_unloadable_amount_for_target(
          target,
          dst_inv,
          demand_requests,
          current_counts,
          item_name,
          carried_amount,
          planned_amount,
          freighter.unit_number
        )
        local moved = transfer_item(cargo_inv, dst_inv, item_name, live_amount)
        if moved > 0 then
          moved_any = true
          current_counts[item_name] = (current_counts[item_name] or 0) + moved
          if freighter.trip_manifest and freighter.trip_manifest[item_name] then
            freighter.trip_manifest[item_name] = math.max(0, freighter.trip_manifest[item_name] - moved)
            if freighter.trip_manifest[item_name] <= 0 then
              freighter.trip_manifest[item_name] = nil
            end
          end
          if freighter.inbound_manifest and freighter.inbound_manifest[item_name] then
            local reserved_moved = math.min(moved, freighter.inbound_manifest[item_name])
            freighter.inbound_manifest[item_name] = math.max(0, freighter.inbound_manifest[item_name] - reserved_moved)
            remove_inbound_reservation(target.unit_number, item_name, reserved_moved)
            if freighter.inbound_manifest[item_name] <= 0 then
              freighter.inbound_manifest[item_name] = nil
            end
          end
        end
      end
    end

    if can_transfer and not moved_any then
      -- Matching cargo and demand existed moments earlier, so a zero-move result
      -- means something changed after the action charge was consumed. Report the
      -- stop location so lingering unload-side drain bugs are easy to spot.
      warn_station_noop_power_drain(target, {"ff.noop_power_drain_context_unload"})
    end

    if moved_any then
      invalidate_runtime_cycle_cache()
      sync_freighter_cargo_summary_from_inventory(freighter)
    end

    if (using_explicit_manifest and item_count_manifest_is_empty(planned_manifest))
      or ((not using_explicit_manifest) and item_count_manifest_is_empty(freighter.cargo_manifest))
    then
      try_freighter_teleport(freighter.entity, station_dock_position(target.entity))
      freighter.completed_schedule_leg = true
      finish_unload(freighter)
    end
  end

  if freighter.state == "to_resupply" then
    if not freighter.travel_start_tick or not freighter.travel_end_tick then
      finish_unload(freighter)
      return
    end

    if not freighter.end_position then
      finish_unload(freighter)
      return
    end

    if freighter.entity.type == "spider-vehicle" then
      if not freighter.entity.autopilot_destination then
        set_freighter_destination(freighter.entity, freighter.end_position)
      end
      if distance_sq(freighter.entity.position, freighter.end_position) <= 4 then
        clear_freighter_destination(freighter.entity)
        freighter.state = "waiting_resupply"
        return
      end
      if tick >= freighter.travel_end_tick then
        set_freighter_destination(freighter.entity, freighter.end_position)
        freighter.travel_end_tick = tick + MIN_TRAVEL_TICKS
      end
      return
    end

    local duration = freighter.travel_end_tick - freighter.travel_start_tick
    if duration <= 0 then
      duration = 1
    end

    local p = (tick - freighter.travel_start_tick) / duration
    if p < 0 then p = 0 end
    if p > 1 then p = 1 end

    local sx = freighter.start_position.x
    local sy = freighter.start_position.y
    local ex = freighter.end_position.x
    local ey = freighter.end_position.y

    local px = sx + (ex - sx) * p
    local py = sy + (ey - sy) * p
    freighter.entity.teleport({x = px, y = py})

    if tick >= freighter.travel_end_tick then
      freighter.state = "waiting_resupply"
    end
    return
  end

  if freighter.state == "waiting_resupply" then
    local stop = global.ff.stations[freighter.target_station]
    if not stop or not is_valid(stop.entity) then
      finish_unload(freighter)
      return
    end
    local station_inv = get_inventory(stop.entity)
    local ammo_inv = get_freighter_ammo_inventory(freighter.entity)
    local fuel_inv = get_freighter_fuel_inventory(freighter.entity)
    if station_inv and fuel_inv and freighter.resupply_needs_fuel then
      local swap_plan = fuel_swap_plan(freighter, station_inv, fuel_inv)
      if swap_plan
        and not swap_plan.cargo_space_available
        and not swap_plan.trash_stop_available
        and swap_plan.unsupported_incompatible_entries
        and #swap_plan.unsupported_incompatible_entries > 0
      then
        local shortfall_info = next_dispatch_trip_energy_shortfall(freighter, fuel_inv)
        if shortfall_info then
          local blocked_names = {}
          for _, incompatible in ipairs(swap_plan.unsupported_incompatible_entries) do
            blocked_names[#blocked_names + 1] = incompatible.name
          end
          warn_freighter_refuel_deadlock(freighter, blocked_names, shortfall_info)
        end
      end
    end
    if not can_resupply_transfer_items(freighter, stop, station_inv, ammo_inv, fuel_inv) then
      cancel_station_action_energy(stop, freighter.unit_number)
      if ammo_inv and fuel_inv and not freighter_needs_resupply(freighter, ammo_inv, fuel_inv) then
        finish_unload(freighter)
      end
      return
    end
    if not consume_station_action_energy(stop, "waiting-resupply", freighter.unit_number) then
      return
    end
    if not do_resupply(freighter) then
      -- Resupply already proved there should be a legal fuel or ammo move before the
      -- stop spent its action charge. If the actual transfer still does nothing,
      -- emit a chat ping so the broken station can be inspected in-game.
      warn_station_noop_power_drain(stop, {"ff.noop_power_drain_context_resupply"})
      return
    end
    finish_unload(freighter)
    return
  end

  if freighter.state == "to_force_dump" then
    if not freighter.travel_start_tick or not freighter.travel_end_tick or not freighter.end_position then
      finish_unload(freighter)
      return
    end
    if freighter.entity.type == "spider-vehicle" then
      if not freighter.entity.autopilot_destination then
        set_freighter_destination(freighter.entity, freighter.end_position)
      end
      if distance_sq(freighter.entity.position, freighter.end_position) <= 4 then
        clear_freighter_destination(freighter.entity)
        freighter.state = "waiting_force_dump"
        return
      end
      if tick >= freighter.travel_end_tick then
        set_freighter_destination(freighter.entity, freighter.end_position)
        freighter.travel_end_tick = tick + MIN_TRAVEL_TICKS
      end
      return
    end
    freighter.state = "waiting_force_dump"
    return
  end

  if freighter.state == "waiting_force_dump" then
    local trash = global.ff.stations[freighter.target_station]
    local cargo_inv = get_freighter_inventory(freighter.entity)
    local trash_inv = trash and is_valid(trash.entity) and get_inventory(trash.entity) or nil
    if not trash_inv or not cargo_inv then
      cancel_station_action_energy(trash, freighter.unit_number)
      finish_unload(freighter)
      return
    end

    -- Trash stops should only spend their `100MJ` action charge when at least one
    -- carried stack can actually move into the station. Without this guard, a full
    -- or otherwise blocked trash stop can drain power every tick while the freighter
    -- keeps waiting with unchanged cargo.
    local can_transfer = false
    for item_name, count in pairs(get_inventory_name_counts(cargo_inv)) do
      if count > 0 and trash_inv.get_insertable_count(item_name) > 0 then
        can_transfer = true
        break
      end
    end
    if not can_transfer then
      cancel_station_action_energy(trash, freighter.unit_number)
      return
    end

    if not consume_station_action_energy(trash, "waiting-force-dump", freighter.unit_number) then
      return
    end
    local all_moved = true
    local moved_any = false
    for item_name, count in pairs(get_inventory_name_counts(cargo_inv)) do
      if count > 0 then
        local moved = transfer_item(cargo_inv, trash_inv, item_name, count)
        if moved < count then
          all_moved = false
        end
        if moved > 0 then
          moved_any = true
          invalidate_runtime_cycle_cache()
        end
      end
    end
    if not moved_any then
      -- Full or filtered trash stops should normally be caught by the insertable-count
      -- guard above. If a stop still burns its action charge without accepting any
      -- cargo, print a GPS-tagged warning so the specific stop can be examined.
      warn_station_noop_power_drain(trash, {"ff.noop_power_drain_context_trash"})
    end
    try_freighter_teleport(freighter.entity, station_dock_position(trash.entity))
    if all_moved then
      freighter.bad_fuel_dump_pending = nil
      finish_unload(freighter)
    end
    return
  end
end

local function maybe_release_defenders(entity)
  -- Capsule combat now handled by vehicle gun/ammo behavior.
end

local function maybe_warn_invalid_stop_contents(tick)
  local warning_bucket = math.floor(tick / TICK_INTERVAL) % STOP_WARNING_BUCKET_COUNT

  for unit_number, rec in pairs(global.ff.stations) do
    if (unit_number % STOP_WARNING_BUCKET_COUNT) == warning_bucket and is_valid(rec.entity) then
      if rec.is_fuel_stop or rec.is_ammo_stop then
        local inv = get_inventory(rec.entity)
        local by_unit = global.ff.stop_warning_tick[unit_number]
        local active_invalid_items = nil
        if inv then
          local contents = get_cached_station_inventory_counts(rec)
          for item_name, count in pairs(contents) do
            if count > 0 then
              local is_fuel_item = get_item_fuel_value(item_name) > 0
              local is_allowed_ammo = global.ff.capsule_ammo_set[item_name] or false
              local allowed = rec.is_trash_stop
                or (rec.is_fuel_stop and is_fuel_item)
                or (rec.is_ammo_stop and is_allowed_ammo)
              if not allowed then
                active_invalid_items = active_invalid_items or {}
                active_invalid_items[item_name] = true
                by_unit = by_unit or {}
                local last_tick = by_unit[item_name] or 0
                if tick - last_tick >= STOP_WARNING_INTERVAL then
                  local reason_key = "ff.warning_reason_not_fuel"
                  if rec.is_trash_stop then
                    reason_key = "ff.warning_reason_unexpected"
                  elseif rec.is_fuel_stop and rec.is_ammo_stop then
                    reason_key = "ff.warning_reason_neither"
                  elseif rec.is_ammo_stop then
                    reason_key = "ff.warning_reason_not_ammo"
                  end
                  rec.entity.force.print(
                    {"ff.invalid_stop_item", station_display_name(rec), {"item-name." .. item_name}, {reason_key}}
                  )
                  by_unit[item_name] = tick
                end
              end
            end
          end
        end

        if by_unit then
          for item_name in pairs(by_unit) do
            if not (active_invalid_items and active_invalid_items[item_name]) then
              by_unit[item_name] = nil
            end
          end
          if next(by_unit) == nil then
            global.ff.stop_warning_tick[unit_number] = nil
          else
            global.ff.stop_warning_tick[unit_number] = by_unit
          end
        end
      else
        global.ff.stop_warning_tick[unit_number] = nil
      end
    end
  end
end

local function maybe_warn_empty_routes(tick)
  local warning_bucket = math.floor(tick / TICK_INTERVAL) % STOP_WARNING_BUCKET_COUNT
  local store = global.ff.empty_route_warning_tick or {stations = {}, freighters = {}}
  global.ff.empty_route_warning_tick = store
  store.stations = store.stations or {}
  store.freighters = store.freighters or {}

  for unit_number, rec in pairs(global.ff.stations) do
    if (unit_number % STOP_WARNING_BUCKET_COUNT) == warning_bucket and is_valid(rec.entity) then
      if not station_route_signal_key(rec) then
        local entry = store.stations[unit_number]
        if not entry then
          entry = {started_tick = tick, last_warning_tick = nil}
          store.stations[unit_number] = entry
        elseif tick - entry.started_tick >= EMPTY_ROUTE_WARNING_INTERVAL
          and (not entry.last_warning_tick or tick - entry.last_warning_tick >= EMPTY_ROUTE_WARNING_INTERVAL)
        then
          rec.entity.force.print({"", {"ff.empty_stop_warning", station_display_name(rec)}, " ", gps_tag_for_entity(rec.entity)})
          entry.last_warning_tick = tick
        end
      else
        store.stations[unit_number] = nil
      end
    end
  end

  for unit_number, rec in pairs(global.ff.freighters) do
    if (unit_number % STOP_WARNING_BUCKET_COUNT) == warning_bucket and is_valid(rec.entity) then
      sync_freighter_route_signal_fields(rec)
      local missing_from, missing_to = freighter_active_leg_missing_route_flags(rec)
      if missing_from or missing_to then
        local entry = store.freighters[unit_number]
        if not entry then
          entry = {started_tick = tick, last_warning_tick = nil}
          store.freighters[unit_number] = entry
        elseif tick - entry.started_tick >= EMPTY_ROUTE_WARNING_INTERVAL
          and (not entry.last_warning_tick or tick - entry.last_warning_tick >= EMPTY_ROUTE_WARNING_INTERVAL)
        then
          local reason_key = "ff.empty_freighter_route_both"
          if missing_from and not missing_to then
            reason_key = "ff.empty_freighter_route_from"
          elseif missing_to and not missing_from then
            reason_key = "ff.empty_freighter_route_to"
          end
          rec.entity.force.print({"", {"ff.empty_freighter_route_warning", freighter_runtime_name(rec.entity, unit_number), {reason_key}}, " ", gps_tag_for_entity(rec.entity)})
          entry.last_warning_tick = tick
        end
      else
        store.freighters[unit_number] = nil
      end
    end
  end
end

local function destroy_gui(player)
  if player.gui.screen[GUI_ROOT] then
    player.gui.screen[GUI_ROOT].destroy()
  end
  if global and global.ff and global.ff.player_schedule_drag then
    global.ff.player_schedule_drag[player.index] = nil
  end
  if global and global.ff and global.ff.player_station_request_group_choices then
    global.ff.player_station_request_group_choices[player.index] = nil
  end
end

local function destroy_station_circuit_relative_gui(player)
  if player and player.gui and player.gui.relative and player.gui.relative[GUI_STATION_CIRCUIT_RELATIVE] then
    player.gui.relative[GUI_STATION_CIRCUIT_RELATIVE].destroy()
  end
end

local function trim_text(value)
  return tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
end

find_child_recursive_by_prefix = function(element, child_name_prefix)
  if not element or not element.valid then
    return nil
  end
  if type(element.name) == "string" and type(child_name_prefix) == "string" and element.name:sub(1, #child_name_prefix) == child_name_prefix then
    return element
  end
  for _, child in pairs(element.children) do
    local found = find_child_recursive_by_prefix(child, child_name_prefix)
    if found then
      return found
    end
  end
  return nil
end

local function gui_element_has_ancestor(element, ancestor_name)
  local current = element
  while current and current.valid do
    if current.name == ancestor_name then
      return true
    end
    current = current.parent
  end
  return false
end

local function is_gui_root_currently_open(player, root)
  if not player or not root or not root.valid then
    return false
  end
  local opened = player.opened
  return opened ~= nil and opened.valid and opened == root and player.opened_gui_type == defines.gui_type.custom
end

local function station_circuit_signal_locale(signal_name)
  return {"virtual-signal-name." .. signal_name}
end

local function add_station_circuit_signal_picker(parent, label_caption, element_name, signal_value, tooltip)
  parent.add{type = "label", caption = label_caption}
  local picker = parent.add{type = "choose-elem-button", name = element_name, elem_type = "signal"}
  picker.elem_value = copy_signal_id(signal_value)
  picker.tooltip = tooltip
  return picker
end

local function add_station_circuit_signal_label(parent, description)
  local label = parent.add{type = "label", caption = description}
  label.style.single_line = false
  return label
end

local function station_circuit_panel_target_entity(player, entity)
  -- Keep the relative circuit panel tied to the station whose inventory window
  -- is open. Once the container GUI is visible, that open-station context must
  -- win over transient hover/selection changes in the world.
  local opened = player and player.opened or nil
  if opened and opened.valid and opened.object_name == "LuaEntity" then
    local target = station_entity_from_target(opened) or as_valid_entity(opened)
    if target and is_freighter_station_name(target.name) then
      return target
    end
  end

  if player and player.opened_gui_type ~= defines.gui_type.none then
    local target = get_player_station_cargo_context_entity(player)
    if target and is_freighter_station_name(target.name) then
      return target
    end
  end

  local target = station_entity_from_target(entity) or as_valid_entity(entity)
  if target and is_freighter_station_name(target.name) then
    return target
  end

  target = player and (station_entity_from_target(player.selected) or as_valid_entity(player.selected)) or nil
  if target and is_freighter_station_name(target.name) then
    return target
  end

  return nil
end

local function station_circuit_panel_target_ghost(player, entity)
  -- Ghost stations do not open the same container GUI as built stations, so
  -- anchor their circuit controls beside Factorio's native ghost picker when it
  -- is open for this exact ghost.
  if not (player and defines.relative_gui_type and defines.relative_gui_type.ghost_picker_gui) then
    return nil
  end

  local opened = player.opened
  if opened and opened.valid and is_station_ghost_target(opened) and player.opened_gui_type ~= defines.gui_type.none then
    return opened
  end

  local target = as_valid_entity(entity)
  if target and is_station_ghost_target(target) and opened and opened.valid and opened == target and player.opened_gui_type ~= defines.gui_type.none then
    return target
  end

  return nil
end

local function add_station_circuit_controls(parent, record)
  local circuit_signals_frame = parent
  if parent.name ~= GUI_STATION_CIRCUIT_RELATIVE then
    circuit_signals_frame = parent.add{type = "frame", direction = "vertical", caption = {"ff.gui_circuit_panel_title"}}
    circuit_signals_frame.style.horizontally_stretchable = true
  end

  local circuit_signals_description = circuit_signals_frame.add{type = "label", caption = {"ff.gui_circuit_signals_description"}}
  circuit_signals_description.style.single_line = false
  local circuit_type_toggle = circuit_signals_frame.add{type = "checkbox", name = GUI_CIRCUIT_STATION_TYPE, state = station_uses_circuit_station_type(record), caption = {"ff.gui_circuit_station_type"}}
  circuit_type_toggle.tooltip = {"ff.gui_circuit_station_type_tooltip"}
  add_station_circuit_signal_picker(circuit_signals_frame, {"ff.gui_circuit_type_signal"}, GUI_CIRCUIT_TYPE_SIGNAL, station_circuit_type_signal(record), {"ff.gui_circuit_type_signal_tooltip"})
  add_station_circuit_signal_label(circuit_signals_frame, {"ff.gui_circuit_type_signal_description"})
  add_station_circuit_signal_picker(circuit_signals_frame, {"ff.gui_circuit_priority_signal"}, GUI_CIRCUIT_PRIORITY_SIGNAL, station_circuit_priority_signal(record), {"ff.gui_circuit_priority_signal_tooltip"})
  add_station_circuit_signal_label(circuit_signals_frame, {"ff.gui_circuit_priority_signal_description"})
  add_station_circuit_signal_picker(circuit_signals_frame, {"ff.gui_circuit_network_signal"}, GUI_CIRCUIT_NETWORK_SIGNAL, station_circuit_network_signal(record), {"ff.gui_circuit_network_signal_tooltip"})
  add_station_circuit_signal_label(circuit_signals_frame, {"ff.gui_circuit_network_signal_description"})
  add_station_circuit_signal_picker(circuit_signals_frame, {"ff.gui_circuit_energy_signal"}, GUI_CIRCUIT_ENERGY_SIGNAL, station_circuit_energy_signal(record), {"ff.gui_circuit_energy_signal_tooltip"})
  add_station_circuit_signal_label(circuit_signals_frame, {"ff.gui_circuit_energy_signal_description"})
end

local function station_connector_has_external_wire(station_connector, internal_circuit_entity)
  -- The station is always script-wired to its hidden output combinator, so the
  -- relative GUI should only count real connections that go somewhere else.
  if not (station_connector and station_connector.valid) then
    return false
  end

  for _, connection in ipairs(station_connector.real_connections or {}) do
    local target_connector = connection and connection.target or nil
    local target_owner = target_connector and target_connector.valid and target_connector.owner or nil
    if target_owner and target_owner.valid and target_owner ~= internal_circuit_entity then
      return true
    end
  end

  return false
end

station_has_external_circuit_wires = function(record)
  -- Only show the side-panel controls when the built station is actually wired
  -- into a player-visible red or green circuit network.
  local station_entity = record and as_valid_entity(record.entity) or nil
  if not station_entity then
    return false
  end

  local internal_circuit_entity = get_station_circuit_control_entity(record)
  local red_connector = station_entity.get_wire_connector(defines.wire_connector_id.circuit_red, true)
  if station_connector_has_external_wire(red_connector, internal_circuit_entity) then
    return true
  end

  local green_connector = station_entity.get_wire_connector(defines.wire_connector_id.circuit_green, true)
  if station_connector_has_external_wire(green_connector, internal_circuit_entity) then
    return true
  end

  return false
end

local function get_station_record_for_circuit_relative_gui(player, entity)
  if not player or player.opened_gui_type == defines.gui_type.none then
    return nil
  end

  local target = station_circuit_panel_target_entity(player, entity)
  if target then
    local record = resolve_station_record_for_entity(target)
    if record and station_has_external_circuit_wires(record) then
      return record, defines.relative_gui_type.container_gui, false
    end
  end

  local ghost = station_circuit_panel_target_ghost(player, entity)
  if ghost then
    local record = station_edit_settings_from_tags(ghost.tags)
    record.entity = ghost
    return record, defines.relative_gui_type.ghost_picker_gui, true
  end

  return nil
end

local function refresh_station_circuit_relative_gui(player, entity)
  destroy_station_circuit_relative_gui(player)

  if not player or not player.gui or not player.gui.relative then
    return
  end
  if not defines.relative_gui_type.container_gui then
    return
  end

  local record, anchor_gui = get_station_record_for_circuit_relative_gui(player, entity)
  if not record or not anchor_gui then
    return
  end

  local frame = player.gui.relative.add{
    type = "frame",
    name = GUI_STATION_CIRCUIT_RELATIVE,
    caption = {"ff.gui_circuit_panel_title"},
    direction = "vertical",
    anchor = {
      gui = anchor_gui,
      position = defines.relative_gui_position.right,
    },
  }
  frame.style.horizontally_stretchable = true
  add_station_circuit_controls(frame, record)
end

local function apply_station_circuit_signal_selection(record, element_name, signal_value)
  if not record then
    return false
  end

  local normalized_signal = normalize_circuit_signal_id(signal_value)

  if element_name == GUI_CIRCUIT_TYPE_SIGNAL then
    record.circuit_station_type_signal = normalized_signal
  elseif element_name == GUI_CIRCUIT_PRIORITY_SIGNAL then
    record.circuit_priority_signal = normalized_signal
  elseif element_name == GUI_CIRCUIT_NETWORK_SIGNAL then
    record.circuit_network_signal = normalized_signal
  elseif element_name == GUI_CIRCUIT_ENERGY_SIGNAL then
    record.circuit_energy_signal = normalized_signal
  else
    return false
  end

  record.circuit_station_type_signal = station_circuit_type_signal(record)
  record.circuit_priority_signal = station_circuit_priority_signal(record)
  record.circuit_network_signal = station_circuit_network_signal(record)
  record.circuit_energy_signal = station_circuit_energy_signal(record)
  return true
end

local function apply_station_circuit_relative_control(player, element)
  if not player or not element or not element.valid then
    return false
  end

  local target = resolve_config_target_entity(player)
  local record = target and get_station_record_by_entity(target) or nil
  local ghost = nil
  if not record then
    ghost = station_circuit_panel_target_ghost(player, target)
    if ghost then
      record = station_edit_settings_from_tags(ghost.tags)
      record.entity = ghost
    end
  end
  if not record then
    return false
  end

  if element.name == GUI_CIRCUIT_STATION_TYPE then
    record.circuit_set_station_type = element.state and true or false
  elseif not apply_station_circuit_signal_selection(record, element.name, element.elem_value) then
    return false
  else
    return false
  end

  if ghost then
    ghost.tags = station_settings_tags(record)
  else
    refresh_station_circuit_state(record)
  end
  refresh_station_circuit_relative_gui(player, ghost or record.entity)
  return true
end

update_station_label = function(unit_number)
  local rec = global.ff.stations[unit_number]
  if not rec or not is_valid(rec.entity) then
    return
  end
  debug_station_rename(nil, "update_station_label:start", rec, nil)
  create_station_label(rec)
  sync_station_entity_name(rec)
  update_station_chart_tag(rec)
  debug_station_rename(nil, "update_station_label:done", rec, nil)
end

function station_request_row_index_from_name(name, prefix)
  if type(name) ~= "string" or type(prefix) ~= "string" then
    return nil
  end
  if name:sub(1, #prefix) ~= prefix then
    return nil
  end
  return tonumber(name:sub(#prefix + 1))
end

function station_request_editor_rows(rows, include_blank_slot)
  local normalized_rows = {}
  for _, row in ipairs(rows or {}) do
    local count_text = row and row.count_text or ""
    if count_text ~= "" then
      count_text = tostring(count_text)
    end

    -- Keep any slot that already has an item or a typed amount so the player does
    -- not lose in-progress edits when the grid is rebuilt to match vanilla-style
    -- requester sections.
    if (row and row.name) or count_text ~= "" then
      normalized_rows[#normalized_rows + 1] = {name = row and row.name or nil, count_text = count_text}
    end
  end

  if include_blank_slot ~= false then
    normalized_rows[#normalized_rows + 1] = {name = nil, count_text = ""}
  end

  local minimum_slots = math.max(STATION_REQUEST_GRID_COLUMNS, #normalized_rows)
  local slot_count = math.ceil(minimum_slots / STATION_REQUEST_GRID_COLUMNS) * STATION_REQUEST_GRID_COLUMNS
  while #normalized_rows < slot_count do
    normalized_rows[#normalized_rows + 1] = {name = nil, count_text = ""}
  end
  return normalized_rows
end

function add_station_request_slot(slot_table, row, index, editable)
  local cell = slot_table.add{type = "flow", direction = "vertical"}
  cell.style.horizontal_align = "center"
  cell.style.vertical_spacing = 2

  local slot_frame = cell.add{type = "frame", style = "slot_button_deep_frame"}
  if editable then
    local picker = slot_frame.add{type = "choose-elem-button", name = GUI_STATION_REQUEST_ITEM_PREFIX .. index, elem_type = "item", style = "slot_button"}
    picker.elem_value = row.name
    picker.tooltip = {"ff.gui_station_requests_tooltip"}
  else
    local preview = slot_frame.add{type = "choose-elem-button", elem_type = "item", style = "slot_button"}
    preview.elem_value = row.name
    preview.enabled = false
  end

  if editable then
    local count_field = cell.add{type = "textfield", name = GUI_STATION_REQUEST_COUNT_PREFIX .. index, text = row.count_text or ""}
    count_field.style.width = 58
    count_field.style.horizontal_align = "right"
    count_field.numeric = true
    count_field.allow_decimal = false
    count_field.allow_negative = false
    count_field.enabled = row.name ~= nil
    count_field.tooltip = {"ff.gui_station_requests_tooltip"}
  else
    local count_label = cell.add{type = "label", caption = (row.count_text and row.count_text ~= "") and row.count_text or " "}
    count_label.style.width = 58
    count_label.style.horizontal_align = "center"
    count_label.style.font_color = row.name and {0.9, 0.9, 0.9} or {0.45, 0.45, 0.45}
  end
end

function rebuild_station_request_slot_table(holder, rows, editable)
  if not holder or not holder.valid then
    return
  end

  holder.clear()

  -- `on_gui_closed` can still touch a request holder that was built by an older
  -- GUI revision or another teardown path before the current table-based request
  -- grid is reconstructed. Guard the spacing writes by element type so legacy
  -- vertical flows do not raise style-type errors while the save finishes loading.
  if holder.type == "table" then
    holder.style.horizontal_spacing = 8
    holder.style.vertical_spacing = 8
  elseif holder.type == "flow" then
    if holder.direction == "horizontal" then
      holder.style.horizontal_spacing = 8
    else
      holder.style.vertical_spacing = 8
    end
  end

  for index, row in ipairs(rows) do
    add_station_request_slot(holder, row, index, editable)
  end
end

function station_request_rows_from_manifest(manifest)
  local rows = {}
  local names = {}
  local normalized_manifest = normalize_station_request_manifest(manifest)
  for item_name in pairs(normalized_manifest) do
    names[#names + 1] = item_name
  end
  table.sort(names)
  for _, item_name in ipairs(names) do
    rows[#rows + 1] = {name = item_name, count_text = tostring(normalized_manifest[item_name])}
  end
  return station_request_editor_rows(rows, true)
end

function collect_station_request_rows_from_gui(root)
  local holder = root and find_child_recursive(root, GUI_STATION_REQUESTS_FLOW) or nil
  local rows = {}
  if holder and holder.valid then
    for _, line in ipairs(holder.children or {}) do
      -- The manual request grid is intentionally nested so it can imitate the
      -- requester chest's slot layout. Resolve controls by prefix because each slot
      -- uses indexed names instead of one exact static child name.
      local row = {name = nil, count_text = ""}
      local item_picker = find_child_recursive_by_prefix(line, GUI_STATION_REQUEST_ITEM_PREFIX)
      if item_picker and item_picker.valid and item_picker.type == "choose-elem-button" then
        row.name = item_picker.elem_value
      end
      local count_field = find_child_recursive_by_prefix(line, GUI_STATION_REQUEST_COUNT_PREFIX)
      if count_field and count_field.valid and count_field.type == "textfield" then
        row.count_text = count_field.text or ""
      end
      rows[#rows + 1] = row
    end
  end
  return station_request_editor_rows(rows, true)
end

function station_request_manifest_from_rows(rows)
  local manifest = {}
  for _, row in ipairs(rows or {}) do
    local item_name = row and row.name or nil
    local amount = normalize_station_request_amount(row and row.count_text or nil)
    if type(item_name) == "string" and amount > 0 and has_item_prototype(item_name) then
      manifest[item_name] = amount
    end
  end
  return manifest
end

function station_request_group_choice_state(force, selected_group_name)
  local values = {nil}
  local captions = {{"ff.gui_station_request_group_none"}}
  local seen = {}
  local normalized_selected_group = normalize_station_request_group_name(selected_group_name)

  if force and force.get_logistic_groups then
    local sorted_names = {}
    local group_types = {
      defines.logistic_group_type and defines.logistic_group_type.roboport or nil,
      defines.logistic_group_type and defines.logistic_group_type.with_trash or nil,
      nil,
    }

    for _, group_type in ipairs(group_types) do
      local ok, names = pcall(force.get_logistic_groups, force, group_type)
      if ok and type(names) == "table" then
        for _, group_name in ipairs(names) do
          local normalized_group_name = normalize_station_request_group_name(group_name)
          if normalized_group_name and not seen[normalized_group_name] then
            seen[normalized_group_name] = true
            sorted_names[#sorted_names + 1] = normalized_group_name
          end
        end
      elseif not ok then
        throttled_diagnostic_log(
          "logistic_group_query_warning_tick",
          tostring(force.index or force.name or "nil") .. ":" .. tostring(group_type),
          {
            tag = "ff-logistic-group-query-warning",
            tick = game and game.tick or nil,
            force_name = force.name,
            group_type = group_type,
            error_message = names,
          }
        )
      end
    end

    table.sort(sorted_names)
    for _, group_name in ipairs(sorted_names) do
      values[#values + 1] = group_name
      captions[#captions + 1] = group_name
    end
  end

  if normalized_selected_group and not seen[normalized_selected_group] then
    values[#values + 1] = normalized_selected_group
    captions[#captions + 1] = {"ff.gui_station_request_group_missing", normalized_selected_group}
  end

  local selected_index = 1
  for index, value in ipairs(values) do
    if value == normalized_selected_group then
      selected_index = index
      break
    end
  end

  return captions, values, selected_index
end

function selected_station_request_group_name(player_index, dropdown)
  local choices = global.ff.player_station_request_group_choices[player_index] or {}
  return normalize_station_request_group_name(choices[dropdown and dropdown.selected_index or 0])
end

function station_request_group_summary_caption(force, group_name)
  local normalized_group_name = normalize_station_request_group_name(group_name)
  if not normalized_group_name then
    return {"ff.gui_station_request_group_summary_none"}
  end

  local logistic_group = get_force_logistic_group(force, normalized_group_name)
  if not logistic_group then
    return {"ff.gui_station_request_group_summary_missing", normalized_group_name}
  end

  local group_manifest = station_request_group_manifest(force, normalized_group_name)
  local request_count = 0
  for _ in pairs(group_manifest) do
    request_count = request_count + 1
  end

  if request_count == 0 then
    return {"ff.gui_station_request_group_summary_empty", normalized_group_name}
  end
  return {"ff.gui_station_request_group_summary", normalized_group_name, tostring(request_count)}
end

function refresh_station_request_group_summary(root, force, group_name)
  local summary = root and find_child_recursive(root, GUI_STATION_REQUEST_GROUP_INFO) or nil
  local holder = root and find_child_recursive(root, GUI_STATION_REQUEST_GROUP_FLOW) or nil
  local normalized_group_name = normalize_station_request_group_name(group_name)
  local preview_manifest = normalized_group_name and station_request_group_manifest(force, normalized_group_name) or {}
  local preview_rows = {}
  local preview_count = 0
  for _ in pairs(preview_manifest) do
    preview_count = preview_count + 1
  end
  if normalized_group_name then
    preview_rows = station_request_editor_rows(station_request_rows_from_manifest(preview_manifest), false)
  end

  if summary and summary.valid then
    summary.caption = station_request_group_summary_caption(force, group_name)
    summary.visible = normalized_group_name == nil or preview_count == 0
  end
  if holder and holder.valid then
    holder.visible = normalized_group_name ~= nil and preview_count > 0
    if holder.visible then
      rebuild_station_request_slot_table(holder, preview_rows, false)
    else
      holder.clear()
    end
  end
end

function refresh_station_complex_demands_gui(root, use_complex_demands)
  local complex_section = root and find_child_recursive(root, GUI_COMPLEX_DEMANDS_SECTION) or nil
  if not complex_section or not complex_section.valid then
    return
  end

  -- Keep the advanced request widgets alive while hidden so manual rows and the
  -- selected logistic group remain intact if the player turns complex demands back
  -- on before saving.
  complex_section.visible = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED and use_complex_demands == true
end

function rebuild_station_request_rows(root, rows)
  local holder = root and find_child_recursive(root, GUI_STATION_REQUESTS_FLOW) or nil
  if not holder or not holder.valid then
    return
  end

  rebuild_station_request_slot_table(holder, station_request_editor_rows(rows, true), true)
end

function add_station_numeric_settings_fields(frame, record)
  if not frame then
    return
  end

  frame.add{type = "label", caption = {"ff.gui_network_id"}}
  local field = frame.add{type = "textfield", name = GUI_NETWORK_ID, text = format_station_network_id(station_network_id(record))}
  field.numeric = true
  field.allow_decimal = false
  field.allow_negative = true
  field.tooltip = {"ff.gui_network_id_tooltip"}

  frame.add{type = "label", caption = {"ff.gui_stop_priority"}}
  field = frame.add{type = "textfield", name = GUI_STOP_PRIORITY, text = format_station_priority(station_priority_value(record))}
  field.numeric = true
  field.allow_decimal = false
  field.allow_negative = true
  field.tooltip = {"ff.gui_stop_priority_tooltip"}

  frame.add{type = "label", caption = {"ff.gui_supply_buffer_count"}}
  field = frame.add{type = "textfield", name = GUI_SUPPLY_BUFFER_COUNT, text = format_station_supply_buffer_count(station_supply_buffer_count(record))}
  field.numeric = true
  field.allow_decimal = false
  field.allow_negative = false
  field.tooltip = {"ff.gui_supply_buffer_count_tooltip"}

  frame.add{type = "label", caption = {"ff.gui_charge_rate"}}
  field = frame.add{type = "textfield", name = GUI_CHARGE_RATE, text = format_station_charge_rate_mw(station_charge_rate_w(record))}
  field.numeric = true
  field.allow_decimal = true
  field.allow_negative = false
  field.tooltip = {"ff.gui_charge_rate_tooltip", format_station_charge_rate_mw(station_power.default_charge_rate_w)}
end

local function open_station_gui(player, entity)
  destroy_gui(player)
  local is_ghost = is_station_ghost_target(entity)
  local record = is_ghost and station_edit_settings_from_tags(entity.tags) or get_station_record_by_entity(entity)
  if not record then
    return
  end

  if is_ghost then
    global.ff.player_station_cargo_context[player.index] = nil
  else
    set_player_station_cargo_context(player.index, record)
  end

  local frame = player.gui.screen.add{type = "frame", name = GUI_ROOT, caption = {"ff.gui_station_title"}, direction = "vertical"}
  frame.auto_center = true
  frame.add{type = "label", caption = {"ff.gui_stop_item"}}
  local signal_picker = frame.add{type = "choose-elem-button", name = GUI_NAME, elem_type = "signal"}
  signal_picker.elem_value = route_signal_from_value_or_nil(station_route_signal_key(record))
  signal_picker.tooltip = {"ff.gui_stop_item_tooltip"}
  frame.add{type = "label", caption = {"ff.gui_station_type"}}
  local station_type_dropdown = frame.add{
    type = "drop-down",
    name = GUI_STATION_TYPE,
    items = {{"ff.gui_station_type_supply"}, {"ff.gui_station_type_demand"}},
    selected_index = normalize_station_type(record) == "demand" and 2 or 1,
  }
  station_type_dropdown.tooltip = {"ff.gui_station_type_tooltip"}
  local complex_demands_toggle = frame.add{
    type = "checkbox",
    name = GUI_COMPLEX_DEMANDS,
    state = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED and record.use_complex_demands == true or false,
    caption = {"ff.gui_complex_demands"},
  }
  complex_demands_toggle.enabled = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED
  complex_demands_toggle.tooltip = {"ff.gui_complex_demands_tooltip"}
  local request_section = frame.add{type = "flow", name = GUI_COMPLEX_DEMANDS_SECTION, direction = "vertical"}
  request_section.style.horizontally_stretchable = true
  request_section.style.vertical_spacing = 8

  local request_group_section = request_section.add{type = "frame", direction = "vertical", style = "inside_shallow_frame_with_padding"}
  request_group_section.style.horizontally_stretchable = true
  local request_group_header = request_group_section.add{type = "frame", direction = "vertical", style = "logistic_section_subheader_frame"}
  request_group_header.style.horizontally_stretchable = true
  local request_group_flow = request_group_header.add{type = "flow", direction = "horizontal"}
  request_group_flow.style.horizontally_stretchable = true
  request_group_flow.style.vertical_align = "center"
  request_group_flow.style.horizontal_spacing = 8
  local request_group_label = request_group_flow.add{type = "label", caption = {"ff.gui_station_request_group"}, style = "frame_subheading_label"}
  request_group_label.style.horizontally_stretchable = true
  local request_group_items, request_group_values, request_group_index = station_request_group_choice_state(player.force, record.demand_request_group)
  global.ff.player_station_request_group_choices[player.index] = request_group_values
  local request_group_dropdown = request_group_flow.add{type = "drop-down", name = GUI_STATION_REQUEST_GROUP, items = request_group_items, selected_index = request_group_index}
  request_group_dropdown.tooltip = {"ff.gui_station_request_group_tooltip"}
  local request_group_info = request_group_section.add{type = "label", name = GUI_STATION_REQUEST_GROUP_INFO, caption = station_request_group_summary_caption(player.force, record.demand_request_group)}
  request_group_info.style.single_line = false
  request_group_info.style.font_color = {0.85, 0.85, 0.85}

  local request_group_pane = request_group_section.add{type = "scroll-pane", direction = "vertical", style = "logistic_sections_scroll_pane"}
  request_group_pane.style.maximal_height = 128
  request_group_pane.style.horizontally_stretchable = true
  request_group_pane.horizontal_scroll_policy = "never"
  local request_group_rows = request_group_pane.add{type = "table", name = GUI_STATION_REQUEST_GROUP_FLOW, column_count = STATION_REQUEST_GRID_COLUMNS}

  local manual_request_section = request_section.add{type = "frame", direction = "vertical", style = "inside_shallow_frame_with_padding"}
  manual_request_section.style.horizontally_stretchable = true
  local request_header = manual_request_section.add{type = "frame", direction = "vertical", style = "logistic_section_subheader_frame"}
  request_header.style.horizontally_stretchable = true
  local request_header_flow = request_header.add{type = "flow", direction = "horizontal"}
  request_header_flow.style.horizontally_stretchable = true
  request_header_flow.style.vertical_align = "center"
  local request_header_title = request_header_flow.add{type = "label", caption = {"ff.gui_station_requests"}, style = "frame_subheading_label"}
  request_header_title.style.horizontally_stretchable = true

  local request_rows_pane = manual_request_section.add{type = "scroll-pane", direction = "vertical", style = "logistic_sections_scroll_pane"}
  request_rows_pane.style.maximal_height = 220
  request_rows_pane.style.horizontally_stretchable = true
  request_rows_pane.horizontal_scroll_policy = "never"
  local request_rows = request_rows_pane.add{type = "table", name = GUI_STATION_REQUESTS_FLOW, column_count = STATION_REQUEST_GRID_COLUMNS}
  rebuild_station_request_rows(frame, station_request_rows_from_manifest(record.demand_requests))
  refresh_station_request_group_summary(frame, player.force, record.demand_request_group)
  refresh_station_complex_demands_gui(frame, record.use_complex_demands == true)
  local fuel_toggle = frame.add{type = "checkbox", name = GUI_FUEL_STOP, state = record.is_fuel_stop or false, caption = {"ff.gui_fuel_stop"}}
  fuel_toggle.tooltip = {"ff.gui_fuel_stop_tooltip"}
  local ammo_toggle = frame.add{type = "checkbox", name = GUI_AMMO_STOP, state = record.is_ammo_stop or false, caption = {"ff.gui_ammo_stop"}}
  ammo_toggle.tooltip = {"ff.gui_ammo_stop_tooltip"}
  local trash_toggle = frame.add{type = "checkbox", name = GUI_TRASH_STOP, state = record.is_trash_stop or false, caption = {"ff.gui_trash_stop"}}
  trash_toggle.tooltip = {"ff.gui_trash_stop_tooltip"}
  if is_ghost and not (defines.relative_gui_type and defines.relative_gui_type.ghost_picker_gui) then
    -- Only keep the old inline ghost circuit controls as a fallback for builds
    -- that do not expose Factorio's ghost picker relative GUI anchor.
    add_station_circuit_controls(frame, record)
  end
  add_station_numeric_settings_fields(frame, record)
  frame.add{type = "label", name = GUI_HOTKEY_SUMMARY, caption = {"ff.gui_station_hotkeys"}}
  if not is_ghost then
    frame.add{type = "button", name = GUI_OPEN_CARGO, caption = {"ff.gui_open_cargo"}}
  end
  local hotkey_hint = frame.add{type = "label", name = GUI_HOTKEY_ONLY_HINT, caption = {"ff.gui_hotkey_only_hint"}}
  hotkey_hint.visible = false
  hotkey_hint.style.single_line = false
  local spacer = frame.add{type = "empty-widget"}
  spacer.style.height = 8
  local save_button = frame.add{type = "button", name = GUI_SAVE, caption = {"ff.gui_save"}}
  save_button.style = "confirm_button"
  global.ff.player_edit[player.index] = is_ghost and {kind = "station-ghost", entity = entity} or {kind = "station", unit_number = entity.unit_number}
  apply_hotkey_only_mode_to_open_gui(player.index)
  debug_station_rename(player.index, "open_station_gui", record, signal_picker and signal_picker.elem_value or nil)
  player.opened = frame
  if signal_picker and signal_picker.valid then
    if signal_picker.focus then
      signal_picker.focus()
    end
  elseif station_type_dropdown and station_type_dropdown.valid and station_type_dropdown.focus then
    station_type_dropdown.focus()
  end
end

local function apply_station_gui_controls_to_record(player_index)
  local edit = global.ff.player_edit[player_index]
  if not edit or (edit.kind ~= "station" and edit.kind ~= "station-ghost") then
    return false
  end

  local player = game.get_player(player_index)
  if not player then
    return false
  end

  local root = player.gui.screen[GUI_ROOT]
  if not root then
    return false
  end

  local signal_picker = find_child_recursive(root, GUI_NAME)
  local station_type_dropdown = find_child_recursive(root, GUI_STATION_TYPE)
  local complex_demands_toggle = find_child_recursive(root, GUI_COMPLEX_DEMANDS)
  local fuel_toggle = find_child_recursive(root, GUI_FUEL_STOP)
  local ammo_toggle = find_child_recursive(root, GUI_AMMO_STOP)
  local trash_toggle = find_child_recursive(root, GUI_TRASH_STOP)
  local circuit_type_toggle = find_child_recursive(root, GUI_CIRCUIT_STATION_TYPE)
  local circuit_type_signal_picker = find_child_recursive(root, GUI_CIRCUIT_TYPE_SIGNAL)
  local circuit_priority_signal_picker = find_child_recursive(root, GUI_CIRCUIT_PRIORITY_SIGNAL)
  local circuit_network_signal_picker = find_child_recursive(root, GUI_CIRCUIT_NETWORK_SIGNAL)
  local circuit_energy_signal_picker = find_child_recursive(root, GUI_CIRCUIT_ENERGY_SIGNAL)
  local request_group_dropdown = find_child_recursive(root, GUI_STATION_REQUEST_GROUP)
  local request_rows = collect_station_request_rows_from_gui(root)

  if edit.kind == "station-ghost" then
    local ghost = as_valid_entity(edit.entity)
    if not is_station_ghost_target(ghost) then
      return false
    end

    local rec = station_edit_settings_from_tags(ghost.tags)
    if signal_picker then
      rec.route_signal = route_signal_from_value_or_nil(signal_picker.elem_value)
      rec.route_signal_key = route_signal_key(rec.route_signal)
      rec.route_signal_explicitly_empty = rec.route_signal == nil
    end
    sync_station_route_signal_fields(rec)
    if station_type_dropdown then
      rec.station_type = station_type_dropdown.selected_index == 2 and "demand" or "supply"
    end
    rec.use_complex_demands = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED and complex_demands_toggle and complex_demands_toggle.state == true or false
    if request_group_dropdown then
      rec.demand_request_group = selected_station_request_group_name(player_index, request_group_dropdown)
    end
    rec.demand_requests = station_request_manifest_from_rows(request_rows)

    -- Keep the player's in-progress slot picks visible even before they enter a
    -- positive amount. The persisted manifest still only stores valid positive
    -- requests, but the live GUI should behave like vanilla requester slots and
    -- retain the chosen item while the amount field is being edited.
    rebuild_station_request_rows(root, request_rows)
    refresh_station_request_group_summary(root, player.force, rec.demand_request_group)
    refresh_station_complex_demands_gui(root, rec.use_complex_demands)
    if fuel_toggle then
      rec.is_fuel_stop = fuel_toggle.state and true or false
    end
    if ammo_toggle then
      rec.is_ammo_stop = ammo_toggle.state and true or false
    end
    if trash_toggle then
      rec.is_trash_stop = trash_toggle.state and true or false
    end
    if circuit_type_toggle then
      rec.circuit_set_station_type = circuit_type_toggle.state and true or false
    end
    if circuit_type_signal_picker then
      apply_station_circuit_signal_selection(rec, circuit_type_signal_picker.name, circuit_type_signal_picker.elem_value)
      circuit_type_signal_picker.elem_value = station_circuit_type_signal(rec)
    end
    if circuit_priority_signal_picker then
      apply_station_circuit_signal_selection(rec, circuit_priority_signal_picker.name, circuit_priority_signal_picker.elem_value)
      circuit_priority_signal_picker.elem_value = station_circuit_priority_signal(rec)
    end
    if circuit_network_signal_picker then
      apply_station_circuit_signal_selection(rec, circuit_network_signal_picker.name, circuit_network_signal_picker.elem_value)
      circuit_network_signal_picker.elem_value = station_circuit_network_signal(rec)
    end
    if circuit_energy_signal_picker then
      apply_station_circuit_signal_selection(rec, circuit_energy_signal_picker.name, circuit_energy_signal_picker.elem_value)
      circuit_energy_signal_picker.elem_value = station_circuit_energy_signal(rec)
    end
    if find_child_recursive(root, GUI_NETWORK_ID) then
      rec.network_id = parse_station_network_id(find_child_recursive(root, GUI_NETWORK_ID).text)
      find_child_recursive(root, GUI_NETWORK_ID).text = format_station_network_id(rec.network_id)
    end
    if find_child_recursive(root, GUI_STOP_PRIORITY) then
      rec.priority = parse_station_priority(find_child_recursive(root, GUI_STOP_PRIORITY).text)
      find_child_recursive(root, GUI_STOP_PRIORITY).text = format_station_priority(rec.priority)
    end
    if find_child_recursive(root, GUI_SUPPLY_BUFFER_COUNT) then
      -- Buffer counts only control optional pre-positioning at Supply stops, but the
      -- value is always persisted so blueprints and copy-paste preserve the station's
      -- intended behavior if the stop is later flipped back to Supply.
      rec.supply_buffer_count = parse_station_supply_buffer_count(find_child_recursive(root, GUI_SUPPLY_BUFFER_COUNT).text)
      find_child_recursive(root, GUI_SUPPLY_BUFFER_COUNT).text = format_station_supply_buffer_count(rec.supply_buffer_count)
    end
    if find_child_recursive(root, GUI_CHARGE_RATE) then
      rec.charge_rate_w = parse_station_charge_rate_w(find_child_recursive(root, GUI_CHARGE_RATE).text)
      find_child_recursive(root, GUI_CHARGE_RATE).text = format_station_charge_rate_mw(station_charge_rate_w(rec))
    end
    refresh_station_circuit_state(rec)
    ghost.tags = station_settings_tags(rec)
    return true
  end

  local rec = global.ff.stations[edit.unit_number]
  if not rec then
    return false
  end

  debug_station_rename(player_index, "apply_station_gui_controls_to_record:before", rec, signal_picker and signal_picker.elem_value or nil)

  unindex_station_record(rec)

  if signal_picker then
    rec.route_signal = route_signal_from_value_or_nil(signal_picker.elem_value)
    rec.route_signal_key = route_signal_key(rec.route_signal)
    rec.route_signal_explicitly_empty = rec.route_signal == nil
  end
  sync_station_route_signal_fields(rec)

  if station_type_dropdown then
    rec.station_type = station_type_dropdown.selected_index == 2 and "demand" or "supply"
  end
  rec.use_complex_demands = STATION_COMPLEX_DEMANDS_FEATURE_ENABLED and complex_demands_toggle and complex_demands_toggle.state == true or false
  if request_group_dropdown then
    rec.demand_request_group = selected_station_request_group_name(player_index, request_group_dropdown)
  end
  rec.demand_requests = station_request_manifest_from_rows(request_rows)

  -- Rebuild from the live GUI rows instead of the filtered manifest so selecting an
  -- item does not immediately clear the slot just because its amount has not been
  -- typed yet.
  rebuild_station_request_rows(root, request_rows)
  refresh_station_request_group_summary(root, rec.entity and rec.entity.force or player.force, rec.demand_request_group)
  refresh_station_complex_demands_gui(root, rec.use_complex_demands)
  if fuel_toggle then
    rec.is_fuel_stop = fuel_toggle.state and true or false
  end
  if ammo_toggle then
    rec.is_ammo_stop = ammo_toggle.state and true or false
  end
  if trash_toggle then
    rec.is_trash_stop = trash_toggle.state and true or false
  end
  if circuit_type_toggle then
    rec.circuit_set_station_type = circuit_type_toggle.state and true or false
  end
  if circuit_type_signal_picker then
    apply_station_circuit_signal_selection(rec, circuit_type_signal_picker.name, circuit_type_signal_picker.elem_value)
    circuit_type_signal_picker.elem_value = station_circuit_type_signal(rec)
  end
  if circuit_priority_signal_picker then
    apply_station_circuit_signal_selection(rec, circuit_priority_signal_picker.name, circuit_priority_signal_picker.elem_value)
    circuit_priority_signal_picker.elem_value = station_circuit_priority_signal(rec)
  end
  if circuit_network_signal_picker then
    apply_station_circuit_signal_selection(rec, circuit_network_signal_picker.name, circuit_network_signal_picker.elem_value)
    circuit_network_signal_picker.elem_value = station_circuit_network_signal(rec)
  end
  if circuit_energy_signal_picker then
    apply_station_circuit_signal_selection(rec, circuit_energy_signal_picker.name, circuit_energy_signal_picker.elem_value)
    circuit_energy_signal_picker.elem_value = station_circuit_energy_signal(rec)
  end
  if find_child_recursive(root, GUI_NETWORK_ID) then
    rec.network_id = parse_station_network_id(find_child_recursive(root, GUI_NETWORK_ID).text)
    find_child_recursive(root, GUI_NETWORK_ID).text = format_station_network_id(rec.network_id)
  end
  if find_child_recursive(root, GUI_STOP_PRIORITY) then
    rec.priority = parse_station_priority(find_child_recursive(root, GUI_STOP_PRIORITY).text)
    find_child_recursive(root, GUI_STOP_PRIORITY).text = format_station_priority(rec.priority)
  end
  if find_child_recursive(root, GUI_SUPPLY_BUFFER_COUNT) then
    -- Keep the GUI normalized to a clamped non-negative integer so players can type
    -- freely, press Save, and immediately see the exact number of advance freighters
    -- this stop will allow to stage here while waiting for future pickup stock.
    rec.supply_buffer_count = parse_station_supply_buffer_count(find_child_recursive(root, GUI_SUPPLY_BUFFER_COUNT).text)
    find_child_recursive(root, GUI_SUPPLY_BUFFER_COUNT).text = format_station_supply_buffer_count(rec.supply_buffer_count)
  end
  if find_child_recursive(root, GUI_CHARGE_RATE) then
    local parsed_charge_rate_w = parse_station_charge_rate_w(find_child_recursive(root, GUI_CHARGE_RATE).text)
    rec.charge_rate_w = parsed_charge_rate_w
    apply_station_charge_rate_to_power_entity(rec)
    find_child_recursive(root, GUI_CHARGE_RATE).text = format_station_charge_rate_mw(station_charge_rate_w(rec))
  end

  refresh_station_circuit_state(rec)
  index_station_record(rec)
  update_station_label(edit.unit_number)
  debug_station_rename(player_index, "apply_station_gui_controls_to_record:after", rec, signal_picker and signal_picker.elem_value or nil)
  return true
end

local function handle_station_gui_hotkey(player_index, mode)
  local edit = global.ff.player_edit[player_index]
  if not edit or edit.kind ~= "station" then
    return
  end
  local player = game.get_player(player_index)
  if not player then
    return
  end
  local root = player.gui.screen[GUI_ROOT]
  if not root then
    return
  end

  local station_type_dropdown = find_child_recursive(root, GUI_STATION_TYPE)
  local fuel_toggle = find_child_recursive(root, GUI_FUEL_STOP)
  local ammo_toggle = find_child_recursive(root, GUI_AMMO_STOP)
  local trash_toggle = find_child_recursive(root, GUI_TRASH_STOP)

  if mode == "type" and station_type_dropdown then
    station_type_dropdown.selected_index = (station_type_dropdown.selected_index == 1) and 2 or 1
  elseif mode == "fuel" and fuel_toggle then
    fuel_toggle.state = not fuel_toggle.state
  elseif mode == "ammo" and ammo_toggle then
    ammo_toggle.state = not ammo_toggle.state
  elseif mode == "trash" and trash_toggle then
    trash_toggle.state = not trash_toggle.state
  end

  apply_station_gui_controls_to_record(player_index)
end

local function handle_gui_confirm_hotkey(player_index)
  local player = game.get_player(player_index)
  if not player then
    return
  end

  debug_station_gui_event(player_index, "handle_gui_confirm_hotkey:start", nil, nil)

  local root = player.gui.screen[GUI_ROOT]
  if not root then
    return
  end

  if not is_gui_root_currently_open(player, root) then
    return
  end
  if is_active_signal_picker(player_index) then
    debug_station_gui_event(player_index, "handle_gui_confirm_hotkey:signal-picker-active", nil, nil)
    return
  end
  if is_gui_confirm_hotkey_suppressed_this_tick(player_index) then
    debug_station_gui_event(player_index, "handle_gui_confirm_hotkey:suppressed", nil, nil)
    return
  end

  local edit = global.ff.player_edit[player_index]
  if not edit then
    return
  end
  if edit.kind == "station"
    or edit.kind == "station-ghost"
    or edit.kind == "freighter"
    or edit.kind == "freighter-map"
    or edit.kind == "freighter-ghost"
  then
    debug_station_gui_event(player_index, "handle_gui_confirm_hotkey:save-edit", nil, "edit_kind=" .. tostring(edit.kind))
    save_edit(player, player_index)
  end
end

function get_freighter_record_from_edit(edit)
  if not edit then
    return nil
  end

  if edit.kind == "freighter" then
    return edit.unit_number and global.ff.freighters[edit.unit_number] or nil
  end

  if edit.kind == "freighter-map" then
    return edit.freighter_unit_number and global.ff.freighters[edit.freighter_unit_number] or nil
  end

  return nil
end

function get_freighter_editor_signal_names(edit)
  if edit and edit.kind == "freighter-map" then
    return GUI_MAP_ROUTE_FROM, nil
  end
  return GUI_FROM, nil
end

function ensure_freighter_edit_schedule_state(edit)
  if not edit then
    return nil
  end

  edit.schedule = copy_freighter_schedule_entries(edit.schedule)
  edit.selected_schedule_index = clamp_freighter_schedule_index(edit.selected_schedule_index or 1, edit.schedule)
  return edit
end

function freighter_schedule_operation_dropdown_items()
  return {
    {"ff.gui_schedule_operation_load"},
    {"ff.gui_schedule_operation_unload"},
  }
end

function freighter_schedule_operation_dropdown_index(entry)
  return freighter_schedule_entry_operation(entry) == "unload" and 2 or 1
end

function freighter_schedule_operation_from_dropdown_index(index)
  if index == 2 then
    return "unload"
  end
  return "load"
end

function apply_freighter_schedule_editor_controls_to_edit(player_index)
  local player = player_index and game.get_player(player_index) or nil
  if not player then
    return false
  end

  local root = player.gui.screen[GUI_ROOT]
  local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[player_index])
  if not root or not edit or (edit.kind ~= "freighter" and edit.kind ~= "freighter-map" and edit.kind ~= "freighter-ghost") then
    return false
  end

  local entry = freighter_schedule_entry_at(edit.schedule, edit.selected_schedule_index)
  if not entry then
    return false
  end

  local operation_dropdown = find_child_recursive(root, GUI_SCHEDULE_OPERATION)
  if operation_dropdown and operation_dropdown.valid then
    local stop_signal_key = freighter_schedule_entry_stop_signal_key(entry)
    entry.operation = freighter_schedule_operation_from_dropdown_index(operation_dropdown.selected_index)
    set_freighter_schedule_entry_stop_signal_key(entry, stop_signal_key)
  end

  local min_load_field = find_child_recursive(root, GUI_SCHEDULE_MIN_LOAD)
  if min_load_field and min_load_field.valid then
    entry.departure_min_load_percent = clamp_freighter_departure_load_percent(min_load_field.text)
  end

  local fuel_interrupt = find_child_recursive(root, GUI_SCHEDULE_FUEL_INTERRUPT)
  if fuel_interrupt and fuel_interrupt.valid then
    entry.allow_fuel_interrupt = fuel_interrupt.state and true or false
  end

  local ammo_interrupt = find_child_recursive(root, GUI_SCHEDULE_AMMO_INTERRUPT)
  if ammo_interrupt and ammo_interrupt.valid then
    entry.allow_ammo_interrupt = ammo_interrupt.state and true or false
  end

  local trash_interrupt = find_child_recursive(root, GUI_SCHEDULE_TRASH_INTERRUPT)
  if trash_interrupt and trash_interrupt.valid then
    entry.allow_trash_interrupt = trash_interrupt.state and true or false
  end

  local network_field = find_child_recursive(root, GUI_FREIGHTER_NETWORK_ID)
  if network_field and network_field.valid then
    edit.network_id = parse_station_network_id(network_field.text)
    network_field.text = format_station_network_id(edit.network_id)
  end

  return true
end

function set_freighter_edit_schedule_from_record(edit, rec)
  if not edit then
    return nil
  end

  edit.schedule = copy_freighter_schedule_entries(rec and freighter_schedule_entries(rec) or nil)
  edit.network_id = freighter_network_id(rec)
  edit.selected_schedule_index = 1
  if edit.player_index then
    clear_freighter_schedule_drag_state(edit.player_index)
  end
  return ensure_freighter_edit_schedule_state(edit)
end

function refresh_freighter_schedule_editor(player_index)
  local player = player_index and game.get_player(player_index) or nil
  if not player then
    return false
  end

  local root = player.gui.screen[GUI_ROOT]
  local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[player_index])
  if not root or not edit or (edit.kind ~= "freighter" and edit.kind ~= "freighter-map" and edit.kind ~= "freighter-ghost") then
    return false
  end

  local list = find_child_recursive(root, GUI_SCHEDULE_LIST)
  if list and list.valid and list.clear_items then
    list.clear_items()
    for _, item in ipairs(freighter_schedule_list_items(edit.schedule)) do
      list.add_item(item)
    end
    list.selected_index = edit.selected_schedule_index
  end

  rebuild_freighter_schedule_rows(root, player_index, edit)

  local drag_status = find_child_recursive(root, GUI_SCHEDULE_DRAG_STATUS)
  if drag_status and drag_status.valid then
    drag_status.caption = freighter_schedule_drag_status_caption(edit.schedule, normalize_freighter_schedule_drag_state(player_index, edit.schedule))
  end

  local summary = find_child_recursive(root, GUI_SCHEDULE_SUMMARY)
  if summary and summary.valid then
    summary.caption = freighter_schedule_summary_label(edit.schedule)
  end

  local from_name = get_freighter_editor_signal_names(edit)
  local from_field = find_child_recursive(root, from_name)
  local entry = freighter_schedule_entry_at(edit.schedule, edit.selected_schedule_index) or {operation = "load", stop_signal_key = nil}
  if from_field and from_field.valid then
    from_field.elem_value = route_signal_from_value_or_nil(freighter_schedule_entry_stop_signal_key(entry))
  end

  local operation_dropdown = find_child_recursive(root, GUI_SCHEDULE_OPERATION)
  if operation_dropdown and operation_dropdown.valid then
    operation_dropdown.selected_index = freighter_schedule_operation_dropdown_index(entry)
  end

  local min_load_field = find_child_recursive(root, GUI_SCHEDULE_MIN_LOAD)
  if min_load_field and min_load_field.valid then
    min_load_field.text = tostring(freighter_schedule_entry_departure_load_percent(entry))
  end

  local network_field = find_child_recursive(root, GUI_FREIGHTER_NETWORK_ID)
  if network_field and network_field.valid then
    network_field.text = format_station_network_id(edit.network_id)
    network_field.enabled = freighter_network_hard_mode_enabled()
  end

  local fuel_interrupt = find_child_recursive(root, GUI_SCHEDULE_FUEL_INTERRUPT)
  if fuel_interrupt and fuel_interrupt.valid then
    fuel_interrupt.state = freighter_schedule_entry_allows_fuel_interrupt(entry)
  end

  local ammo_interrupt = find_child_recursive(root, GUI_SCHEDULE_AMMO_INTERRUPT)
  if ammo_interrupt and ammo_interrupt.valid then
    ammo_interrupt.state = freighter_schedule_entry_allows_ammo_interrupt(entry)
  end

  local trash_interrupt = find_child_recursive(root, GUI_SCHEDULE_TRASH_INTERRUPT)
  if trash_interrupt and trash_interrupt.valid then
    trash_interrupt.state = freighter_schedule_entry_allows_trash_interrupt(entry)
  end

  return true
end

function modify_freighter_edit_schedule(player_index, operation)
  local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[player_index])
  if not edit or (edit.kind ~= "freighter" and edit.kind ~= "freighter-map" and edit.kind ~= "freighter-ghost") then
    return false
  end

  apply_freighter_schedule_editor_controls_to_edit(player_index)
  local selected_index = clamp_freighter_schedule_index(edit.selected_schedule_index or 1, edit.schedule)
  if operation == "add" then
    table.insert(edit.schedule, selected_index + 1, normalize_freighter_schedule_entry({}))
    edit.selected_schedule_index = selected_index + 1
  elseif operation == "remove" then
    if #edit.schedule <= 1 then
      edit.schedule[1] = normalize_freighter_schedule_entry({})
      edit.selected_schedule_index = 1
    else
      table.remove(edit.schedule, selected_index)
      edit.selected_schedule_index = math.min(selected_index, #edit.schedule)
    end
  elseif operation == "up" then
    if selected_index > 1 then
      edit.schedule[selected_index], edit.schedule[selected_index - 1] = edit.schedule[selected_index - 1], edit.schedule[selected_index]
      edit.selected_schedule_index = selected_index - 1
    end
  elseif operation == "down" then
    if selected_index < #edit.schedule then
      edit.schedule[selected_index], edit.schedule[selected_index + 1] = edit.schedule[selected_index + 1], edit.schedule[selected_index]
      edit.selected_schedule_index = selected_index + 1
    end
  else
    return false
  end

  ensure_freighter_edit_schedule_state(edit)
  clear_freighter_schedule_drag_state(player_index)
  refresh_freighter_schedule_editor(player_index)
  return true
end

function add_vanilla_window_titlebar(frame, title)
  -- Mirror the base game's screen windows by using a titlebar with a drag
  -- handle and frame action close button instead of relying on a plain caption.
  local titlebar = frame.add{type = "flow", direction = "horizontal"}
  titlebar.drag_target = frame

  local title_label = titlebar.add{type = "label", caption = title, style = "frame_title"}
  title_label.drag_target = frame

  local drag_handle = titlebar.add{type = "empty-widget", style = "draggable_space_header"}
  drag_handle.style.horizontally_stretchable = true
  drag_handle.style.height = 24
  drag_handle.drag_target = frame

  titlebar.add{
    type = "sprite-button",
    name = GUI_CLOSE,
    style = "frame_action_button",
    sprite = "utility/close",
    hovered_sprite = "utility/close_black",
    clicked_sprite = "utility/close_black",
    tooltip = {"gui.close"},
  }
end

function add_freighter_schedule_editor(parent, edit)
  -- Use the same broad layout language as vanilla train/platform scheduling:
  -- a shallow content pane, subheaders, and compact action controls around the
  -- schedule list, while still editing the mod's simpler stop-by-stop cargo schedule.
  local from_name = get_freighter_editor_signal_names(edit)
  local content = parent.add{
    type = "frame",
    direction = "vertical",
    style = "inside_shallow_frame_with_padding",
  }
  content.style.horizontally_stretchable = true

  local panes = content.add{type = "flow", direction = "horizontal"}
  panes.style.horizontal_spacing = 12
  panes.style.horizontally_stretchable = true

  local list_pane = panes.add{type = "frame", direction = "vertical", style = "inside_shallow_frame_with_padding"}
  list_pane.style.minimal_width = 392
  list_pane.style.horizontally_stretchable = true

  local list_subheader = list_pane.add{type = "frame", style = "subheader_frame"}
  list_subheader.style.horizontally_stretchable = true
  local list_title = list_subheader.add{type = "label", caption = {"ff.gui_schedule_title"}, style = "subheader_label"}
  list_title.style.horizontally_stretchable = true
  list_subheader.add{type = "button", name = GUI_SCHEDULE_ADD, caption = {"ff.gui_schedule_add"}, style = "train_schedule_add_station_button"}

  local summary = list_pane.add{type = "label", name = GUI_SCHEDULE_SUMMARY, caption = ""}
  summary.style.single_line = false
  summary.style.maximal_width = 360

  local rows_pane = list_pane.add{
    type = "scroll-pane",
    name = GUI_SCHEDULE_ROWS_PANE,
    direction = "vertical",
    horizontal_scroll_policy = "never",
    vertical_scroll_policy = "auto",
  }
  rows_pane.style.width = 360
  rows_pane.style.height = 252
  rows_pane.style.horizontally_stretchable = true

  local rows = rows_pane.add{type = "flow", name = GUI_SCHEDULE_ROWS, direction = "vertical"}
  rows.style.vertical_spacing = 6
  rows.style.horizontally_stretchable = true

  local drag_status = list_pane.add{type = "label", name = GUI_SCHEDULE_DRAG_STATUS, caption = ""}
  drag_status.style.single_line = false
  drag_status.style.maximal_width = 360

  local list_actions = list_pane.add{type = "flow", direction = "horizontal"}
  list_actions.style.horizontal_spacing = 8
  list_actions.add{type = "button", name = GUI_SCHEDULE_REMOVE, caption = "−", style = "train_schedule_action_button", tooltip = {"ff.gui_schedule_remove"}}
  list_actions.add{type = "button", name = GUI_SCHEDULE_UP, caption = "▲", style = "train_schedule_action_button", tooltip = {"ff.gui_schedule_up"}}
  list_actions.add{type = "button", name = GUI_SCHEDULE_DOWN, caption = "▼", style = "train_schedule_action_button", tooltip = {"ff.gui_schedule_down"}}

  local detail_pane = panes.add{type = "frame", direction = "vertical", style = "inside_shallow_frame_with_padding"}
  detail_pane.style.minimal_width = 296
  detail_pane.style.maximal_width = 320

  local detail_subheader = detail_pane.add{type = "frame", style = "subheader_frame"}
  detail_subheader.style.horizontally_stretchable = true
  detail_subheader.add{type = "label", caption = {"ff.gui_schedule_entry_title"}, style = "subheader_label"}

  local help = detail_pane.add{type = "label", caption = {"ff.gui_schedule_help"}}
  help.style.single_line = false

  local network_table = detail_pane.add{type = "table", column_count = 2}
  network_table.style.horizontal_spacing = 12
  network_table.style.vertical_spacing = 8
  network_table.style.column_alignments[1] = "left"
  network_table.style.column_alignments[2] = "left"

  network_table.add{type = "label", caption = {"ff.gui_network_id"}}
  local network_field = network_table.add{type = "textfield", name = GUI_FREIGHTER_NETWORK_ID, text = format_station_network_id(edit and edit.network_id or 0)}
  network_field.numeric = true
  network_field.allow_decimal = false
  network_field.allow_negative = true
  network_field.enabled = freighter_network_hard_mode_enabled()
  network_field.tooltip = {"ff.gui_freighter_network_id_tooltip"}

  local field_table = detail_pane.add{type = "table", column_count = 2}
  field_table.style.horizontal_spacing = 12
  field_table.style.vertical_spacing = 8
  field_table.style.column_alignments[1] = "left"
  field_table.style.column_alignments[2] = "left"

  field_table.add{type = "label", caption = {"ff.gui_schedule_operation"}, tooltip = {"ff.gui_schedule_operation_tooltip"}}
  field_table.add{type = "drop-down", name = GUI_SCHEDULE_OPERATION, items = freighter_schedule_operation_dropdown_items(), selected_index = 1}

  field_table.add{type = "label", caption = {"ff.gui_schedule_stop"}, tooltip = {"ff.gui_schedule_stop_tooltip"}}
  field_table.add{type = "choose-elem-button", name = from_name, elem_type = "signal"}

  field_table.add{type = "label", caption = {"ff.gui_schedule_min_load"}, tooltip = {"ff.gui_schedule_min_load_tooltip"}}
  local min_load = field_table.add{type = "textfield", name = GUI_SCHEDULE_MIN_LOAD, text = "100", numeric = true, allow_decimal = false, allow_negative = false}
  min_load.style.width = 80

  local interrupt_header = detail_pane.add{type = "label", caption = {"ff.gui_schedule_interrupts_title"}}
  interrupt_header.style.top_margin = 8
  interrupt_header.style.font = "heading-2"

  local interrupt_help = detail_pane.add{type = "label", caption = {"ff.gui_schedule_interrupts_help"}}
  interrupt_help.style.single_line = false

  detail_pane.add{type = "checkbox", name = GUI_SCHEDULE_FUEL_INTERRUPT, state = true, caption = {"ff.gui_schedule_fuel_interrupt"}, tooltip = {"ff.gui_schedule_fuel_interrupt_tooltip"}}
  detail_pane.add{type = "checkbox", name = GUI_SCHEDULE_AMMO_INTERRUPT, state = true, caption = {"ff.gui_schedule_ammo_interrupt"}, tooltip = {"ff.gui_schedule_ammo_interrupt_tooltip"}}
  detail_pane.add{type = "checkbox", name = GUI_SCHEDULE_TRASH_INTERRUPT, state = true, caption = {"ff.gui_schedule_trash_interrupt"}, tooltip = {"ff.gui_schedule_trash_interrupt_tooltip"}}
end

local function open_freighter_gui(player, entity)
  destroy_gui(player)
  local is_ghost = is_freighter_ghost_target(entity)
  local record = is_ghost and freighter_edit_settings_from_tags(entity.tags) or get_freighter_record_by_entity(entity)
  if not record then
    return
  end

  global.ff.player_station_cargo_context[player.index] = nil

  local frame = player.gui.screen.add{type = "frame", name = GUI_ROOT, direction = "vertical"}
  frame.auto_center = true
  add_vanilla_window_titlebar(frame, {"ff.gui_freighter_title"})
  local edit = is_ghost
    and {kind = "freighter-ghost", entity = entity, schedule = copy_freighter_schedule_entries(record.schedule), selected_schedule_index = 1, network_id = freighter_network_id(record)}
    or {kind = "freighter", unit_number = entity.unit_number, schedule = copy_freighter_schedule_entries(record.schedule), selected_schedule_index = 1, network_id = freighter_network_id(record)}
  global.ff.player_edit[player.index] = edit
  add_freighter_schedule_editor(frame, edit)
  local footer = frame.add{type = "flow", direction = "horizontal"}
  footer.style.horizontally_stretchable = true
  local hotkey_hint = footer.add{type = "label", name = GUI_HOTKEY_ONLY_HINT, caption = {"ff.gui_hotkey_only_hint"}}
  hotkey_hint.visible = false
  hotkey_hint.style.single_line = false
  local footer_spacer = footer.add{type = "empty-widget"}
  footer_spacer.style.horizontally_stretchable = true
  if not is_ghost then
    footer.add{type = "checkbox", name = GUI_FORCE_NOW, state = false, caption = {"ff.gui_force_route_now"}}
    footer.add{type = "button", name = GUI_WAIT_STATUS, caption = {"ff.gui_wait_status"}}
  end
  local save_button = footer.add{type = "button", name = GUI_SAVE, caption = {"ff.gui_save"}}
  save_button.style = "confirm_button"
  apply_hotkey_only_mode_to_open_gui(player.index)
  player.opened = frame
  refresh_freighter_schedule_editor(player.index)
  local from_field = find_child_recursive(frame, GUI_FROM)
  if from_field and from_field.valid and from_field.focus then
    from_field.focus()
  end
end

local function collect_freighter_choices()
  local choices = {}
  for unit_number, rec in pairs(global.ff.freighters) do
    if is_valid(rec.entity) then
      local name = freighter_runtime_name(rec.entity, unit_number)
      choices[#choices + 1] = {
        unit_number = unit_number,
        label = {"", name, " (#", unit_number, ")  (", freighter_schedule_summary_label(freighter_schedule_entries(rec)), ")"},
      }
    end
  end
  table.sort(choices, function(a, b) return a.unit_number < b.unit_number end)
  return choices
end

local function open_map_route_gui(player)
  destroy_gui(player)
  global.ff.player_station_cargo_context[player.index] = nil
  local choices = collect_freighter_choices()
  if #choices == 0 then
    player.print({"ff.no_freighters"})
    return
  end

  local labels = {}
  for i, item in ipairs(choices) do
    labels[i] = item.label
  end
  global.ff.player_map_choices[player.index] = choices

  local first = global.ff.freighters[choices[1].unit_number]
  local frame = player.gui.screen.add{type = "frame", name = GUI_ROOT, direction = "vertical"}
  frame.auto_center = true
  add_vanilla_window_titlebar(frame, {"ff.gui_routes_title"})

  local chooser_pane = frame.add{type = "frame", direction = "vertical", style = "inside_shallow_frame_with_padding"}
  chooser_pane.style.horizontally_stretchable = true
  local chooser_subheader = chooser_pane.add{type = "frame", style = "subheader_frame"}
  chooser_subheader.style.horizontally_stretchable = true
  chooser_subheader.add{type = "label", name = GUI_MAP_ROUTE_TITLE, caption = {"ff.gui_configure_map"}, style = "subheader_label"}
  local dropdown = chooser_pane.add{type = "drop-down", name = GUI_MAP_ROUTE_DROPDOWN, items = labels, selected_index = 1}
  dropdown.style.horizontally_stretchable = true

  local edit = {kind = "freighter-map", freighter_unit_number = choices[1].unit_number, schedule = copy_freighter_schedule_entries(first and first.schedule or nil), selected_schedule_index = 1, network_id = freighter_network_id(first)}
  global.ff.player_edit[player.index] = edit
  add_freighter_schedule_editor(frame, edit)

  local footer = frame.add{type = "flow", direction = "horizontal"}
  footer.style.horizontally_stretchable = true
  local hotkey_hint = footer.add{type = "label", name = GUI_HOTKEY_ONLY_HINT, caption = {"ff.gui_hotkey_only_hint"}}
  hotkey_hint.visible = false
  hotkey_hint.style.single_line = false
  footer.add{type = "checkbox", name = GUI_FORCE_NOW, state = false, caption = {"ff.gui_force_route_now"}}
  footer.add{type = "button", name = GUI_WAIT_STATUS, caption = {"ff.gui_wait_status"}}
  local footer_spacer = footer.add{type = "empty-widget"}
  footer_spacer.style.horizontally_stretchable = true
  local save_button = footer.add{type = "button", name = GUI_MAP_ROUTE_SAVE, caption = {"ff.gui_save"}}
  save_button.style = "confirm_button"
  apply_hotkey_only_mode_to_open_gui(player.index)
  player.opened = frame
  refresh_freighter_schedule_editor(player.index)
  local from_field = find_child_recursive(frame, GUI_MAP_ROUTE_FROM)
  if from_field and from_field.valid and from_field.focus then
    from_field.focus()
  end
end

local function warn_open_config_hotkey_conflict(player)
  if not player then
    return
  end

  -- The mod uses Shift+F by default for its config hotkey, so warn each player
  -- once that a flip binding on the same shortcut will prevent reliable flips.
  if global.ff.open_config_conflict_warning_shown[player.index] then
    return
  end

  global.ff.open_config_conflict_warning_shown[player.index] = true
  player.print({"ff.open_config_hotkey_conflict_warning"})
end

local function broadcast_artist_help_message_for_first_join(player)
  if not player then
    return
  end

  -- Keep this tied to save data so each player only triggers the artist-help
  -- broadcast once for a given save, even if they disconnect and rejoin later.
  if global.ff.artist_join_notice_shown[player.index] then
    return
  end

  global.ff.artist_join_notice_shown[player.index] = true
  game.print({"", "[Flying Freighters] ", {"ff.artist_help_join_broadcast"}})
end

local function play_menu_confirm_sound(player)
  if not player then
    return
  end

  -- Match Factorio's built-in green confirm click so saving this custom GUI
  -- feels like the rest of the game's menus.
  player.play_sound{path = "utility/confirm"}
end

local function open_config_for_player(player, suppress_missing_target_warning)
  if not player then
    return
  end

  local target = resolve_config_target_entity(player)
  if not is_valid(target) then
    if not suppress_missing_target_warning then
      player.print({"ff.select_config_target"})
    end
    return
  end

  local station_record = get_station_record_by_entity(target)
  local target_name = target and target.name or nil
  if station_record then
    open_station_gui(player, station_record.entity)
  elseif is_station_ghost_target(target) then
    open_station_gui(player, target)
  elseif target_name == FREIGHTER_NAME then
    open_freighter_gui(player, target)
  elseif is_freighter_ghost_target(target) then
    open_freighter_gui(player, target)
  elseif not suppress_missing_target_warning then
    player.print({"ff.select_config_target"})
  end
end

local function remove_quick_config_button(player)
  if player and player.gui and player.gui.left and player.gui.left[GUI_OPEN_CONFIG_BUTTON] then
    player.gui.left[GUI_OPEN_CONFIG_BUTTON].destroy()
  end
end

local function remove_relative_config_button(player)
  if player and player.gui and player.gui.relative and player.gui.relative[GUI_OPEN_CONFIG_RELATIVE] then
    player.gui.relative[GUI_OPEN_CONFIG_RELATIVE].destroy()
  end
end

local function queue_station_cargo_open(player_index, station_ref)
  if not player_index or not station_ref then
    return
  end

  ensure_state()
  local entity = as_valid_entity(station_ref)
  local rec = nil
  if entity and is_freighter_station_name(entity.name) then
    rec = resolve_station_record_for_entity(entity)
  elseif type(station_ref) == "table" then
    rec = station_ref
    if is_valid(rec.entity) and is_freighter_station_name(rec.entity.name) then
      rec = resolve_station_record_for_entity(rec.entity) or rec
    end
  end

  local station_entity = entity or (rec and as_valid_entity(rec.entity)) or nil
  local station_unit_number = (rec and rec.unit_number) or (station_entity and station_entity.unit_number) or nil
  if not station_unit_number then
    return
  end

  set_player_station_cargo_context(player_index, station_entity or rec)

  global.ff.pending_player_open[player_index] = {
    tick = game.tick + 1,
    kind = "station-cargo",
    station_unit_number = station_unit_number,
    surface_index = station_entity and station_entity.surface.index or rec and rec.surface_index or nil,
    position = station_entity and {x = station_entity.position.x, y = station_entity.position.y} or rec and rec.position or nil,
    force_name = station_entity and station_entity.force.name or rec and rec.force_name or nil,
  }
end

local function current_quick_config_target(player, entity)
  return resolve_config_target_entity(player, entity)
end

local function refresh_quick_config_button(player, entity)
  if not player then
    return
  end

  entity = current_quick_config_target(player, entity)
  local entity_name = entity and entity.name
  local station_record = entity and get_station_record_by_entity(entity) or nil
  local station_ghost = entity and is_station_ghost_target(entity) or false
  local freighter_ghost = entity and is_freighter_ghost_target(entity) or false

  remove_relative_config_button(player)
  if station_record or station_ghost or entity_name == FREIGHTER_NAME or freighter_ghost then
    local anchor_gui
    if entity_name == FREIGHTER_NAME and defines.relative_gui_type.spider_vehicle_gui then
      anchor_gui = defines.relative_gui_type.spider_vehicle_gui
    elseif entity_name == FREIGHTER_NAME then
      anchor_gui = defines.relative_gui_type.car_gui
    end
    if anchor_gui and player.gui.relative then
      local button = player.gui.relative.add{
        type = "button",
        name = GUI_OPEN_CONFIG_RELATIVE,
        caption = {"ff.gui_configure"},
        anchor = {
          gui = anchor_gui,
          position = defines.relative_gui_position.right,
        },
      }
      button.tooltip = {"ff.gui_configure_flying_button_tooltip"}
    end
    if not player.gui.left[GUI_OPEN_CONFIG_BUTTON] then
      local button = player.gui.left.add{
        type = "button",
        name = GUI_OPEN_CONFIG_BUTTON,
        caption = {"ff.gui_configure_flying_button"},
      }
      button.tooltip = {"ff.gui_configure_flying_button_tooltip"}
    end
  else
    remove_quick_config_button(player)
    remove_relative_config_button(player)
  end
end

local function handle_gui_opened(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  local entity = as_valid_entity(event.entity)
  local station_record = entity and resolve_station_record_for_entity(entity) or nil
  refresh_quick_config_button(player, entity)

  if station_record then
    set_player_station_cargo_context(event.player_index, station_record)
    local direct_inventory = entity and entity.get_inventory and entity.get_inventory(defines.inventory.chest) or nil
    if not direct_inventory then
      debug_station_gui_event(event.player_index, "handle_gui_opened:station-redirect", event, "unit=" .. tostring(station_record.unit_number))
      destroy_station_circuit_relative_gui(player)
      player.opened = nil
      queue_station_cargo_open(event.player_index, station_record)
    else
      refresh_station_circuit_relative_gui(player, entity)
    end
  elseif entity and is_station_ghost_target(entity) then
    refresh_station_circuit_relative_gui(player, entity)
  elseif entity and entity.name == STATION_CARGO_NAME then
    set_player_station_cargo_context(event.player_index, entity)
    refresh_station_circuit_relative_gui(player, entity)
  else
    destroy_station_circuit_relative_gui(player)
  end
end

local function handle_selected_entity_changed(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end
  local selected_station = station_entity_from_target(player.selected)
  if selected_station then
    set_player_station_cargo_context(event.player_index, selected_station)
  end
  refresh_quick_config_button(player, player.selected)
  refresh_station_circuit_relative_gui(player, player.selected)
end

local function handle_gui_closed(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end
  debug_station_gui_event(event.player_index, "handle_gui_closed:start", event, nil)
  if event.element and event.element.valid then
    clear_active_signal_picker(event.player_index, event.element.name)
  else
    clear_active_signal_picker(event.player_index)
  end

  local edit = global.ff.player_edit[player.index]
  local root = player.gui.screen[GUI_ROOT]
  if edit and (edit.kind == "station" or edit.kind == "station-ghost") and root then
    apply_station_gui_controls_to_record(player.index)
  end

  if event.element and event.element.valid and event.element.name == GUI_ROOT then
    destroy_gui(player)
    global.ff.player_edit[player.index] = nil
    global.ff.player_map_choices[player.index] = nil
    refresh_quick_config_button(player)
    refresh_station_circuit_relative_gui(player)
    debug_station_gui_event(event.player_index, "handle_gui_closed:root-destroyed", event, nil)
    return
  end

  if not player.gui.screen[GUI_ROOT] then
    global.ff.player_edit[player.index] = nil
    global.ff.player_map_choices[player.index] = nil
  end
  refresh_quick_config_button(player)
  refresh_station_circuit_relative_gui(player)
  debug_station_gui_event(event.player_index, "handle_gui_closed:done", event, nil)
end

save_edit = function(player, player_index)
  local edit = global.ff.player_edit[player_index]
  if not edit then
    destroy_gui(player)
    return true
  end

  local root = player.gui.screen[GUI_ROOT]
  if not root then
    return false
  end

  local saved_configuration = false

  if edit.kind == "freighter" or edit.kind == "freighter-ghost" or edit.kind == "freighter-map" then
    apply_freighter_schedule_editor_controls_to_edit(player_index)
  end

  if edit.kind == "station" then
    local rec = global.ff.stations[edit.unit_number]
    local field = find_child_recursive(root, GUI_NAME)
    debug_station_rename(player_index, "save_edit:station:before", rec, field and field.elem_value or nil)
    apply_station_gui_controls_to_record(player_index)
    debug_station_rename(player_index, "save_edit:station:after", global.ff.stations[edit.unit_number], field and field.elem_value or nil)
    saved_configuration = true
  elseif edit.kind == "station-ghost" then
    apply_station_gui_controls_to_record(player_index)
    saved_configuration = true
  elseif edit.kind == "freighter" then
    local rec = global.ff.freighters[edit.unit_number]
    if rec then
      rec.network_id = parse_station_network_id(edit.network_id)
      invalidate_runtime_cycle_cache()
      local force_now = find_child_recursive(root, GUI_FORCE_NOW)
      local result = apply_freighter_schedule_update(rec, edit.schedule, 1, force_now and force_now.state or false)
      if result == "forced" then
        player.print({"ff.route_change_forced"})
      elseif result == "queued" then
        player.print({"ff.route_change_queued"})
      end
      saved_configuration = true
    end
  elseif edit.kind == "freighter-ghost" then
    local ghost = as_valid_entity(edit.entity)
    if is_freighter_ghost_target(ghost) then
      local rec = freighter_edit_settings_from_tags(ghost.tags)
      rec.schedule = copy_freighter_schedule_entries(edit.schedule)
      rec.schedule_current_index = 1
      rec.network_id = parse_station_network_id(edit.network_id)
      sync_freighter_route_signal_fields(rec)
      ghost.tags = freighter_settings_tags(rec)
      saved_configuration = true
    end
  elseif edit.kind == "freighter-map" then
    local force_now = find_child_recursive(root, GUI_FORCE_NOW)
    local rec = edit.freighter_unit_number and global.ff.freighters[edit.freighter_unit_number] or nil
    if rec then
      rec.network_id = parse_station_network_id(edit.network_id)
      invalidate_runtime_cycle_cache()
      local result = apply_freighter_schedule_update(rec, edit.schedule, 1, force_now and force_now.state or false)
      if result == "forced" then
        player.print({"ff.route_change_forced"})
      elseif result == "queued" then
        player.print({"ff.route_change_queued"})
      end
      saved_configuration = true
    end
  end

  if saved_configuration then
    play_menu_confirm_sound(player)
  end

  destroy_gui(player)
  global.ff.player_edit[player_index] = nil
  global.ff.player_map_choices[player_index] = nil
  return true
end

local function apply_freighter_signal_key_without_closing(player, player_index, signal_side)
  local edit = global.ff.player_edit[player_index]
  if not edit or (edit.kind ~= "freighter" and edit.kind ~= "freighter-map" and edit.kind ~= "freighter-ghost") then
    return false
  end
  local root = player.gui.screen[GUI_ROOT]
  if not root then
    return false
  end

  ensure_freighter_edit_schedule_state(edit)
  apply_freighter_schedule_editor_controls_to_edit(player_index)
  local from_name = get_freighter_editor_signal_names(edit)
  local from_field = find_child_recursive(root, from_name)
  local target_field = from_field
  if not target_field then
    return false
  end

  local next_value = normalize_freighter_route_signal_key(target_field.elem_value)
  local entry = freighter_schedule_entry_at(edit.schedule, edit.selected_schedule_index)
  if not entry then
    return false
  end
  set_freighter_schedule_entry_stop_signal_key(entry, next_value)
  refresh_freighter_schedule_editor(player_index)

  if from_field and from_field.valid and from_field.focus then
    from_field.focus()
  end
  return true
end

local function handle_gui_click(event)
  if not (event.element and event.element.valid) then
    return
  end
  local player = game.get_player(event.player_index)
  if not player then
    return
  end
  if event.element.name == GUI_NAME
    or event.element.name == GUI_CIRCUIT_TYPE_SIGNAL
    or event.element.name == GUI_CIRCUIT_PRIORITY_SIGNAL
    or event.element.name == GUI_CIRCUIT_NETWORK_SIGNAL
    or event.element.name == GUI_CIRCUIT_ENERGY_SIGNAL
    or event.element.name == GUI_FROM
    or event.element.name == GUI_TO
    or event.element.name == GUI_MAP_ROUTE_FROM
    or event.element.name == GUI_MAP_ROUTE_TO then
    set_active_signal_picker(event.player_index, event.element.name)
    return
  end
  if event.element.name == GUI_STATION_REQUESTS_ADD or station_request_row_index_from_name(event.element.name, GUI_STATION_REQUEST_REMOVE_PREFIX) then
    local root = player.gui.screen[GUI_ROOT]
    if not root then
      return
    end
    local rows = collect_station_request_rows_from_gui(root)
    local remove_index = station_request_row_index_from_name(event.element.name, GUI_STATION_REQUEST_REMOVE_PREFIX)
    if remove_index then
      if #rows <= 1 then
        rows = {{name = nil, count_text = ""}}
      else
        table.remove(rows, remove_index)
      end
    else
      rows[#rows + 1] = {name = nil, count_text = ""}
    end
    rebuild_station_request_rows(root, rows)
    return
  end
  if event.element.name == GUI_OPEN_CONFIG_BUTTON then
    open_config_for_player(player)
    return
  end
  if event.element.name == GUI_OPEN_CONFIG_RELATIVE then
    open_config_for_player(player)
    return
  end
  if event.element.name == GUI_CLOSE then
    destroy_gui(player)
    global.ff.player_edit[event.player_index] = nil
    global.ff.player_map_choices[event.player_index] = nil
    return
  end
  if event.element.name == GUI_SAVE then
    if player_forces_gui_hotkey_usage(event.player_index) then
      return
    end
    save_edit(player, event.player_index)
    return
  end
  if event.element.name == GUI_SCHEDULE_ADD then
    modify_freighter_edit_schedule(event.player_index, "add")
    return
  end
  local schedule_drag_index = freighter_schedule_row_index_from_name(event.element.name, GUI_SCHEDULE_DRAG_PREFIX)
  if schedule_drag_index then
    local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[event.player_index])
    if not edit then
      return
    end
    apply_freighter_schedule_editor_controls_to_edit(event.player_index)
    local drag_state = normalize_freighter_schedule_drag_state(event.player_index, edit.schedule)
    if drag_state and drag_state.source_index == schedule_drag_index then
      clear_freighter_schedule_drag_state(event.player_index)
    else
      set_freighter_schedule_drag_state(event.player_index, schedule_drag_index, nil)
      edit.selected_schedule_index = clamp_freighter_schedule_index(schedule_drag_index, edit.schedule)
    end
    refresh_freighter_schedule_editor(event.player_index)
    return
  end
  local schedule_select_index = freighter_schedule_row_index_from_name(event.element.name, GUI_SCHEDULE_SELECT_PREFIX)
  if schedule_select_index then
    local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[event.player_index])
    if not edit then
      return
    end
    apply_freighter_schedule_editor_controls_to_edit(event.player_index)
    local drag_state = normalize_freighter_schedule_drag_state(event.player_index, edit.schedule)
    if drag_state and drag_state.source_index and drag_state.source_index ~= schedule_select_index then
      move_freighter_schedule_entry(edit, drag_state.source_index, schedule_select_index)
      clear_freighter_schedule_drag_state(event.player_index)
    else
      clear_freighter_schedule_drag_state(event.player_index)
      edit.selected_schedule_index = clamp_freighter_schedule_index(schedule_select_index, edit.schedule)
    end
    refresh_freighter_schedule_editor(event.player_index)
    return
  end
  if event.element.name == GUI_SCHEDULE_REMOVE then
    modify_freighter_edit_schedule(event.player_index, "remove")
    return
  end
  if event.element.name == GUI_SCHEDULE_UP then
    modify_freighter_edit_schedule(event.player_index, "up")
    return
  end
  if event.element.name == GUI_SCHEDULE_DOWN then
    modify_freighter_edit_schedule(event.player_index, "down")
    return
  end
  if event.element.name == GUI_WAIT_STATUS then
    local freighter = get_gui_target_freighter_record(event.player_index)
    player.print(waiting_status_message_for_freighter(freighter))
    return
  end
  if event.element.name == GUI_OPEN_CARGO then
    local edit = global.ff.player_edit[event.player_index]
    local rec = edit and edit.kind == "station" and global.ff.stations[edit.unit_number] or nil
    local cargo_entity = rec and ensure_station_cargo_entity(rec) or nil
    if cargo_entity and cargo_entity.valid then
      apply_station_gui_controls_to_record(event.player_index)
      destroy_gui(player)
      global.ff.player_edit[event.player_index] = nil
      global.ff.player_map_choices[event.player_index] = nil
      queue_station_cargo_open(event.player_index, rec)
    end
    return
  end
  if event.element.name == GUI_MAP_ROUTE_SAVE then
    if player_forces_gui_hotkey_usage(event.player_index) then
      return
    end
    save_edit(player, event.player_index)
  end
end

function handle_gui_hover(event)
  if not (event.element and event.element.valid) then
    return
  end

  local hover_index = freighter_schedule_row_index_from_name(event.element.name, GUI_SCHEDULE_SELECT_PREFIX)
  if not hover_index then
    return
  end

  local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[event.player_index])
  if not edit then
    return
  end

  local drag_state = normalize_freighter_schedule_drag_state(event.player_index, edit.schedule)
  if not drag_state or not drag_state.source_index or drag_state.source_index == hover_index or drag_state.hover_index == hover_index then
    return
  end

  set_freighter_schedule_drag_state(event.player_index, drag_state.source_index, hover_index)
  refresh_freighter_schedule_editor(event.player_index)
end

function handle_gui_leave(event)
  if not (event.element and event.element.valid) then
    return
  end

  local hover_index = freighter_schedule_row_index_from_name(event.element.name, GUI_SCHEDULE_SELECT_PREFIX)
  if not hover_index then
    return
  end

  local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[event.player_index])
  if not edit then
    return
  end

  local drag_state = normalize_freighter_schedule_drag_state(event.player_index, edit.schedule)
  if not drag_state or drag_state.hover_index ~= hover_index then
    return
  end

  set_freighter_schedule_drag_state(event.player_index, drag_state.source_index, nil)
  refresh_freighter_schedule_editor(event.player_index)
end

local function handle_gui_selection_state_changed(event)
  if not event.element or not event.element.valid then
    return
  end
  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  if event.element.name == GUI_SCHEDULE_LIST then
    local edit = ensure_freighter_edit_schedule_state(global.ff.player_edit[event.player_index])
    if not edit then
      return
    end
    apply_freighter_schedule_editor_controls_to_edit(event.player_index)
    edit.selected_schedule_index = clamp_freighter_schedule_index(event.element.selected_index or 1, edit.schedule)
    refresh_freighter_schedule_editor(event.player_index)
    return
  end

  if event.element.name == GUI_SCHEDULE_OPERATION then
    apply_freighter_schedule_editor_controls_to_edit(event.player_index)
    refresh_freighter_schedule_editor(event.player_index)
    return
  end

  if event.element.name == GUI_STATION_REQUEST_GROUP then
    apply_station_gui_controls_to_record(event.player_index)
    return
  end

  if event.element.name == GUI_STATION_TYPE and player_forces_gui_hotkey_usage(event.player_index) then
    local root = player.gui.screen[GUI_ROOT]
    if root then
      restore_station_hotkey_only_controls_from_record(event.player_index, root)
    end
    return
  end

  if event.element.name ~= GUI_MAP_ROUTE_DROPDOWN then
    return
  end

  local choices = global.ff.player_map_choices[event.player_index] or {}
  local selected = choices[event.element.selected_index]
  local rec = selected and global.ff.freighters[selected.unit_number] or nil
  local edit = global.ff.player_edit[event.player_index]
  if not rec or not edit or edit.kind ~= "freighter-map" then
    return
  end

  edit.freighter_unit_number = selected.unit_number
  clear_freighter_schedule_drag_state(event.player_index)
  set_freighter_edit_schedule_from_record(edit, rec)
  refresh_freighter_schedule_editor(event.player_index)
end

local function handle_gui_checked_state_changed(event)
  local element = event.element
  if not element or not element.valid then
    return
  end

  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  if element.name == GUI_SCHEDULE_FUEL_INTERRUPT
    or element.name == GUI_SCHEDULE_AMMO_INTERRUPT
    or element.name == GUI_SCHEDULE_TRASH_INTERRUPT
  then
    apply_freighter_schedule_editor_controls_to_edit(event.player_index)
    refresh_freighter_schedule_editor(event.player_index)
    return
  end

  if element.name == GUI_CIRCUIT_STATION_TYPE then
    if gui_element_has_ancestor(element, GUI_STATION_CIRCUIT_RELATIVE) then
      apply_station_circuit_relative_control(player, element)
      return
    end

    if gui_element_has_ancestor(element, GUI_ROOT) then
      apply_station_gui_controls_to_record(event.player_index)
    end
    return
  end

  if (element.name == GUI_FUEL_STOP or element.name == GUI_AMMO_STOP or element.name == GUI_TRASH_STOP)
    and player_forces_gui_hotkey_usage(event.player_index)
  then
    local root = player.gui.screen[GUI_ROOT]
    if root then
      restore_station_hotkey_only_controls_from_record(event.player_index, root)
    end
    return
  end

  if element.name == GUI_COMPLEX_DEMANDS and gui_element_has_ancestor(element, GUI_ROOT) then
    apply_station_gui_controls_to_record(event.player_index)
  end
end

function handle_runtime_mod_setting_changed(event)
  if event.setting ~= "ff-force-gui-hotkey-usage" then
    return
  end

  apply_hotkey_only_mode_to_open_gui(event.player_index)
end

local function handle_gui_elem_changed(event)
  if not event.element or not event.element.valid then
    return
  end

  if event.element.name == GUI_NAME
    or event.element.name == GUI_CIRCUIT_TYPE_SIGNAL
    or event.element.name == GUI_CIRCUIT_PRIORITY_SIGNAL
    or event.element.name == GUI_CIRCUIT_NETWORK_SIGNAL
    or event.element.name == GUI_CIRCUIT_ENERGY_SIGNAL
    or station_request_row_index_from_name(event.element.name, GUI_STATION_REQUEST_ITEM_PREFIX) then
    clear_active_signal_picker(event.player_index, event.element.name)
    suppress_gui_confirm_hotkey_this_tick(event.player_index)
    if event.element.name == GUI_NAME then
      debug_station_gui_event(event.player_index, "handle_gui_elem_changed:station-signal", event, "elem=" .. debug_signal_value_text(event.element.elem_value))
      local rec = global.ff.player_edit[event.player_index] and global.ff.stations[global.ff.player_edit[event.player_index].unit_number] or nil
      debug_station_rename(event.player_index, "handle_gui_elem_changed", rec, event.element.elem_value)
    end
    local player = game.get_player(event.player_index)
    if player and gui_element_has_ancestor(event.element, GUI_STATION_CIRCUIT_RELATIVE) then
      apply_station_circuit_relative_control(player, event.element)
    else
      apply_station_gui_controls_to_record(event.player_index)
    end
    return
  end

  if event.element.name ~= GUI_FROM
    and event.element.name ~= GUI_TO
    and event.element.name ~= GUI_MAP_ROUTE_FROM
    and event.element.name ~= GUI_MAP_ROUTE_TO then
    return
  end

  clear_active_signal_picker(event.player_index, event.element.name)
  local player = game.get_player(event.player_index)
  if player then
    apply_freighter_signal_key_without_closing(player, event.player_index, (event.element.name == GUI_TO or event.element.name == GUI_MAP_ROUTE_TO) and "to" or "from")
  end
end

local function handle_gui_confirmed(event)
  if not event.element or not event.element.valid then
    return
  end

  if event.element.name ~= GUI_NAME
    and event.element.name ~= GUI_CIRCUIT_TYPE_SIGNAL
    and event.element.name ~= GUI_CIRCUIT_PRIORITY_SIGNAL
    and event.element.name ~= GUI_CIRCUIT_NETWORK_SIGNAL
    and event.element.name ~= GUI_CIRCUIT_ENERGY_SIGNAL
    and event.element.name ~= GUI_FROM
    and event.element.name ~= GUI_TO
    and event.element.name ~= GUI_MAP_ROUTE_FROM
    and event.element.name ~= GUI_MAP_ROUTE_TO
    and not station_request_row_index_from_name(event.element.name, GUI_STATION_REQUEST_COUNT_PREFIX)
    and event.element.name ~= GUI_SCHEDULE_MIN_LOAD then
    return
  end

  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  debug_station_gui_event(event.player_index, "handle_gui_confirmed:start", event, nil)

  if event.element.name == GUI_FROM or event.element.name == GUI_MAP_ROUTE_FROM then
    clear_active_signal_picker(event.player_index, event.element.name)
    suppress_gui_confirm_hotkey_this_tick(event.player_index)
    apply_freighter_signal_key_without_closing(player, event.player_index, "from")
    return
  end

  if event.element.name == GUI_TO or event.element.name == GUI_MAP_ROUTE_TO then
    clear_active_signal_picker(event.player_index, event.element.name)
    suppress_gui_confirm_hotkey_this_tick(event.player_index)
    apply_freighter_signal_key_without_closing(player, event.player_index, "to")
    return
  end

  if event.element.name == GUI_NAME then
    clear_active_signal_picker(event.player_index, event.element.name)
    suppress_gui_confirm_hotkey_this_tick(event.player_index)
    debug_station_gui_event(event.player_index, "handle_gui_confirmed:station-signal", event, "elem=" .. debug_signal_value_text(event.element.elem_value))
    local rec = global.ff.player_edit[event.player_index] and global.ff.stations[global.ff.player_edit[event.player_index].unit_number] or nil
    debug_station_rename(event.player_index, "handle_gui_confirmed", rec, event.element.elem_value)
    apply_station_gui_controls_to_record(event.player_index)
    return
  end

  if event.element.name == GUI_SCHEDULE_MIN_LOAD then
    apply_freighter_schedule_editor_controls_to_edit(event.player_index)
    refresh_freighter_schedule_editor(event.player_index)
    return
  end

  if station_request_row_index_from_name(event.element.name, GUI_STATION_REQUEST_COUNT_PREFIX) then
    apply_station_gui_controls_to_record(event.player_index)
    return
  end

  save_edit(player, event.player_index)
end

local function on_built(event)
  local entity = event.created_entity or event.entity
  if not is_valid(entity) then
    return
  end

  global.ff.cleanup_dirty = true

  if is_freighter_station_name(entity.name) then
    register_station(entity)
    if event.tags then
      local rec = get_station_record_by_entity(entity)
      if rec then
        apply_station_settings_tags(rec, event.tags)
      end
    end
  elseif entity.name == FREIGHTER_NAME then
    register_freighter(entity)
    if event.tags then
      local rec = get_freighter_record_by_entity(entity)
      if rec then
        apply_freighter_settings_tags(rec, event.tags)
      end
    end
    try_seed_new_freighter_with_setting_fuel(entity)
  end
end

local function handle_player_setup_blueprint(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  local stack = player.blueprint_to_setup
  if not (stack and stack.valid_for_read and stack.is_blueprint and stack.is_blueprint_setup()) then
    local cursor_stack = player.cursor_stack
    if cursor_stack and cursor_stack.valid_for_read and cursor_stack.is_blueprint and cursor_stack.is_blueprint_setup() then
      stack = cursor_stack
    end
  end
  if not (stack and stack.valid_for_read and stack.is_blueprint and stack.is_blueprint_setup()) then
    return
  end

  local blueprint_entities = stack.get_blueprint_entities()
  if not blueprint_entities then
    return
  end

  local mapping = event.mapping and event.mapping.valid and event.mapping:get() or nil
  if not mapping then
    return
  end

  local changed = false
  for _, blueprint_entity in ipairs(blueprint_entities) do
    if is_freighter_station_name(blueprint_entity.name) then
      local source_entity = mapping[blueprint_entity.entity_number]
      local source_rec = source_entity and get_station_record_by_entity(source_entity) or nil
      if source_rec then
        local tags = blueprint_entity.tags or {}
        tags.ff_station_settings = station_settings_tags(source_rec).ff_station_settings
        blueprint_entity.tags = tags
        changed = true
      end
    elseif blueprint_entity.name == FREIGHTER_NAME then
      local source_entity = mapping[blueprint_entity.entity_number]
      local source_rec = source_entity and get_freighter_record_by_entity(source_entity) or nil
      if source_rec then
        local tags = blueprint_entity.tags or {}
        tags.ff_freighter_settings = freighter_settings_tags(source_rec).ff_freighter_settings
        blueprint_entity.tags = tags
        changed = true
      end
    end
  end

  if changed then
    stack.set_blueprint_entities(blueprint_entities)
  end
end

local function on_removed(event)
  local entity = event.entity
  if not is_valid(entity) then
    return
  end

  -- Save freighter route/name info on death so the next placed freighter
  -- can inherit its configuration.
  if entity.name == FREIGHTER_NAME then
    local rec = global.ff.freighters[entity.unit_number]
    if rec then
      sync_freighter_route_signal_fields(rec)
      global.ff.last_died_freighter = global.ff.last_died_freighter or {}
      global.ff.last_died_freighter[entity.force.name] = {
        schedule = copy_freighter_schedule_entries(rec.schedule),
        schedule_current_index = clamp_freighter_schedule_index(rec.schedule_current_index, rec.schedule),
        from_signal_key = rec.from_signal_key,
        to_signal_key = rec.to_signal_key,
        network_id = freighter_network_id(rec),
        backer_name = freighter_runtime_name(entity, entity.unit_number),
        tick = game.tick,
      }
    end
  end

  unregister_entity(entity)
end

local function on_damaged(event)
  if not event.entity or not event.entity.valid then
    return
  end
  if is_freighter_station_name(event.entity.name) or event.entity.name == FREIGHTER_NAME then
    maybe_release_defenders(event.entity)
  end
end

local function on_player_driving_changed_state(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end
  local vehicle = player.vehicle
  if vehicle and vehicle.valid and vehicle.name == FREIGHTER_NAME then
    player.driving = false
    player.print({"ff.automated_only"})
  end
end

-- Prevent spidertron remotes from issuing move commands to freighters.
local function on_player_used_spider_remote(event)
  local vehicle = event.vehicle
  if vehicle and vehicle.valid and vehicle.name == FREIGHTER_NAME then
    -- Cancel the autopilot command the remote just set.
    vehicle.autopilot_destination = nil
    if vehicle.follow_target then
      vehicle.follow_target = nil
    end
    local player = game.get_player(event.player_index)
    if player then
      player.print({"ff.automated_only"})
    end
  end
end

local function process_pending_player_open_requests(current_tick)
  local pending = global.ff.pending_player_open
  if not pending then
    return
  end

  for player_index, request in pairs(pending) do
    if request and request.tick and request.tick <= current_tick then
      pending[player_index] = nil
      local player = game.get_player(player_index)
      if player and request.kind == "station-cargo" and request.station_unit_number then
        local rec = global.ff.stations[request.station_unit_number]
        if (not rec or not is_valid(rec.entity)) and request.surface_index and request.position and request.force_name then
          local surface = game.surfaces[request.surface_index]
          local force = game.forces[request.force_name]
          if surface and force and request.position then
            local entities = surface.find_entities_filtered{
              name = freighter_station_entity_names(),
              position = request.position,
              force = force,
            }
            local entity = entities and entities[1] or nil
            rec = entity and resolve_station_record_for_entity(entity) or rec
          end
        end
        local cargo_entity = rec and ensure_station_cargo_entity(rec) or nil
        local cargo_inventory = cargo_entity and cargo_entity.valid and get_inventory(cargo_entity) or nil
        if cargo_entity and cargo_entity.valid then
          set_player_station_cargo_context(player_index, rec)
          player.opened = cargo_entity
          if player.opened_gui_type == defines.gui_type.none and cargo_inventory and cargo_inventory.valid then
            player.opened = cargo_inventory
          end
        end
        if player.opened_gui_type ~= defines.gui_type.none then
          debug_station_gui_event(player_index, "process_pending_player_open_requests:opened", nil,
            "unit=" .. tostring(rec and rec.unit_number)
              .. " gui_type=" .. tostring(player.opened_gui_type)
              .. " cargo_entity=" .. tostring(cargo_entity and cargo_entity.valid or false)
              .. " inventory_valid=" .. tostring(cargo_inventory and cargo_inventory.valid or false))
        else
          debug_station_gui_event(player_index, "process_pending_player_open_requests:failed", nil,
            "unit=" .. tostring(request.station_unit_number)
              .. " rec=" .. tostring(rec ~= nil)
              .. " entity_valid=" .. tostring(rec and is_valid(rec.entity) or false)
              .. " cargo_valid=" .. tostring(cargo_entity and cargo_entity.valid or false)
              .. " inventory_valid=" .. tostring(cargo_inventory and cargo_inventory.valid or false)
              .. " gui_type=" .. tostring(player.opened_gui_type))
        end
      end
    end
  end
end

local function rescan_runtime_entities()
  for _, surface in pairs(game.surfaces) do
    for _, entity in pairs(surface.find_entities_filtered{name = freighter_station_entity_names()}) do
      register_station(entity)
    end
    for _, entity in pairs(surface.find_entities_filtered{name = FREIGHTER_NAME}) do
      register_freighter(entity)
    end
  end
end

local function init()
  ensure_state()
  rebuild_capsule_ammo_catalog()
  rendering.clear(script.mod_name)
  global.ff.station_labels = {}
  cleanup_invalid_entities()
  rescan_runtime_entities()
  global.ff.needs_entity_rescan = false

  for _, player in pairs(game.players) do
    remove_quick_config_button(player)
    destroy_station_circuit_relative_gui(player)
    refresh_quick_config_button(player)
    warn_open_config_hotkey_conflict(player)
  end
end

local function on_load()
  runtime_global_table()
end

local function on_player_created(event)
  local player = event and game.get_player(event.player_index) or nil
  if not player then
    return
  end
  warn_open_config_hotkey_conflict(player)
end

local function on_player_joined_game(event)
  ensure_state()

  local player = event and game.get_player(event.player_index) or nil
  if not player then
    return
  end

  broadcast_artist_help_message_for_first_join(player)
end

script.on_init(init)
script.on_configuration_changed(init)
script.on_load(on_load)
script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_player_joined_game, on_player_joined_game)

script.on_event(defines.events.on_built_entity, on_built)
script.on_event(defines.events.on_robot_built_entity, on_built)
script.on_event(defines.events.script_raised_built, on_built)
script.on_event(defines.events.script_raised_revive, on_built)

script.on_event(defines.events.on_player_mined_entity, on_removed)
script.on_event(defines.events.on_robot_mined_entity, on_removed)
script.on_event(defines.events.on_entity_died, on_removed)
script.on_event(defines.events.script_raised_destroy, on_removed)

script.on_event(defines.events.on_entity_damaged, on_damaged)
script.on_event(defines.events.on_selected_entity_changed, handle_selected_entity_changed)
script.on_event(defines.events.on_gui_opened, handle_gui_opened)
script.on_event(defines.events.on_gui_closed, handle_gui_closed)
script.on_event(defines.events.on_gui_click, handle_gui_click)
if defines.events.on_gui_hover then
  script.on_event(defines.events.on_gui_hover, handle_gui_hover)
end
if defines.events.on_gui_leave then
  script.on_event(defines.events.on_gui_leave, handle_gui_leave)
end
script.on_event(defines.events.on_gui_checked_state_changed, handle_gui_checked_state_changed)
script.on_event(defines.events.on_gui_selection_state_changed, handle_gui_selection_state_changed)
script.on_event(defines.events.on_gui_elem_changed, handle_gui_elem_changed)
script.on_event(defines.events.on_gui_confirmed, handle_gui_confirmed)
script.on_event(defines.events.on_entity_settings_pasted, handle_entity_settings_pasted)
script.on_event(defines.events.on_player_setup_blueprint, handle_player_setup_blueprint)
script.on_event(defines.events.on_player_driving_changed_state, on_player_driving_changed_state)
script.on_event(defines.events.on_runtime_mod_setting_changed, handle_runtime_mod_setting_changed)
if defines.events.on_player_used_spider_remote then
  script.on_event(defines.events.on_player_used_spider_remote, on_player_used_spider_remote)
end
script.on_event(INPUT_OPEN_CONFIG, function(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end
  warn_open_config_hotkey_conflict(player)
  open_config_for_player(player, true)
end)
script.on_event(INPUT_TOGGLE_STATION_TYPE, function(event)
  handle_station_gui_hotkey(event.player_index, "type")
end)
script.on_event(INPUT_TOGGLE_FUEL_STOP, function(event)
  handle_station_gui_hotkey(event.player_index, "fuel")
end)
script.on_event(INPUT_TOGGLE_AMMO_STOP, function(event)
  handle_station_gui_hotkey(event.player_index, "ammo")
end)
script.on_event(INPUT_TOGGLE_TRASH_STOP, function(event)
  handle_station_gui_hotkey(event.player_index, "trash")
end)
script.on_event(INPUT_GUI_CONFIRM, function(event)
  handle_gui_confirm_hotkey(event.player_index)
end)

script.on_event(defines.events.on_tick, function(event)
  ensure_state()
  if global.ff.needs_entity_rescan then
    cleanup_invalid_entities()
    rescan_runtime_entities()
    global.ff.needs_entity_rescan = false
  end
  process_pending_player_open_requests(event.tick)

  local tick_bucket = (event.tick % TICK_INTERVAL) + 1

  if global.ff.cleanup_dirty or event.tick % CLEANUP_SWEEP_INTERVAL == 0 then
    cleanup_invalid_entities_in_bucket(tick_bucket)
  end
  update_active_station_power_states()
  update_station_power_states_in_bucket(tick_bucket)

  for unit in pairs(global.ff.freighter_units_by_tick_bucket[tick_bucket] or {}) do
    local freighter = global.ff.freighters[unit]
    if freighter then
      process_freighter(freighter, event.tick)
    end
  end

  if event.tick % TICK_INTERVAL == 0 then
    maybe_warn_invalid_stop_contents(event.tick)
    maybe_warn_empty_routes(event.tick)
  end
end)
