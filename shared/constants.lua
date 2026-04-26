local function copy_signal_id(signal)
  return {
    type = signal.type,
    name = signal.name,
  }
end

local circuit_signal_specs = {
  {
    field = "CIRCUIT_SIGNAL_SUPPLY",
    prototype_name = "ff-supply",
    signal = {type = "virtual", name = "ff-supply"},
    icon = "__base__/graphics/icons/passive-provider-chest.png",
    order = "ff-a[supply]",
  },
  {
    field = "CIRCUIT_SIGNAL_DEMAND",
    prototype_name = "ff-demand",
    signal = {type = "virtual", name = "ff-demand"},
    icon = "__base__/graphics/icons/requester-chest.png",
    order = "ff-b[demand]",
  },
  {
    field = "CIRCUIT_SIGNAL_SUPPLY_DEMAND",
    prototype_name = "ff-supply-demand",
    signal = {type = "virtual", name = "ff-supply-demand"},
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    order = "ff-c[supply-demand]",
  },
  {
    field = "CIRCUIT_SIGNAL_PRIORITY",
    prototype_name = "ff-priority",
    signal = {type = "virtual", name = "ff-priority"},
    icon = "__base__/graphics/icons/selector-combinator.png",
    order = "ff-d[priority]",
  },
  {
    field = "CIRCUIT_SIGNAL_NETWORK_ID",
    prototype_name = "ff-network-id",
    signal = {type = "virtual", name = "ff-network-id"},
    icon = "__base__/graphics/icons/radar.png",
    order = "ff-e[network-id]",
  },
  {
    field = "CIRCUIT_SIGNAL_ENERGY_MJ",
    prototype_name = "ff-energy-mj",
    signal = {type = "virtual", name = "ff-energy-mj"},
    icon = "__base__/graphics/icons/accumulator.png",
    order = "ff-f[energy-mj]",
  },
}

local constants = {
  STATION_NAME = "flying-freighter-station",
  PASSIVE_PROVIDER_STATION_NAME = "flying-freighter-passive-provider-station",
  FREIGHTER_NAME = "flying-freighter",
  STATION_CARGO_NAME = "flying-freighter-station-cargo",
  STATION_POWER_NAME = "flying-freighter-station-power",
  STATION_CIRCUIT_NAME = "flying-freighter-station-circuit",
  station_power = {
    buffer_j = 100 * 1000000,
    action_j = 100 * 1000000,
    default_charge_rate_w = 10 * 1000000,
  },
  STATION_REQUEST_GRID_COLUMNS = 10,
  INPUT_OPEN_CONFIG = "ff-open-config",
  INPUT_TOGGLE_STATION_TYPE = "ff-station-toggle-type",
  INPUT_TOGGLE_FUEL_STOP = "ff-station-toggle-fuel",
  INPUT_TOGGLE_AMMO_STOP = "ff-station-toggle-ammo",
  INPUT_TOGGLE_TRASH_STOP = "ff-station-toggle-trash",
  INPUT_GUI_CONFIRM = "ff-gui-confirm",
  CIRCUIT_SIGNAL_SPECS = circuit_signal_specs,
  STATION_HIDDEN_COMPANION_NAMES = {
    "flying-freighter-station-cargo",
    "flying-freighter-station-power",
    "flying-freighter-station-circuit",
  },
}

for _, signal_spec in ipairs(circuit_signal_specs) do
  constants[signal_spec.field] = copy_signal_id(signal_spec.signal)
end

return constants