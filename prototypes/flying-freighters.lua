local shared_constants = require("shared.constants")
local startup_settings = require("shared.startup-settings")
local mods_root = rawget(_G, "mods") or {}
local station_name = shared_constants.STATION_NAME
local passive_provider_station_name = shared_constants.PASSIVE_PROVIDER_STATION_NAME
local freighter_name = shared_constants.FREIGHTER_NAME
local station_cargo_name = shared_constants.STATION_CARGO_NAME
local station_power_name = shared_constants.STATION_POWER_NAME
local station_circuit_name = shared_constants.STATION_CIRCUIT_NAME
local station_power_defaults = shared_constants.station_power
local station_tint = {r = 0.72, g = 0.42, b = 1, a = 1}
local passive_provider_station_tint = {r = 1, g = 0.32, b = 0.32, a = 1}
local freighter_tint = {r = 0.76, g = 0.46, b = 1, a = 1}
local station_visual_growth_tiles = 1.25
local station_visual_y_offset = 0.5
local space_age_enabled = mods_root["space-age"] ~= nil
local freighter_wing_flap_sound = {
  filename = "__upsidedowneye-flying-freighters__/sound/flying-freighter-wing-flap.ogg",
  volume = 0.55,
}

local function build_circuit_virtual_signals()
  local signals = {}
  for _, signal_spec in ipairs(shared_constants.CIRCUIT_SIGNAL_SPECS) do
    signals[#signals + 1] = {
      type = "virtual-signal",
      name = signal_spec.prototype_name,
      icon = signal_spec.icon,
      icon_size = 64,
      subgroup = "virtual-signal-special",
      order = signal_spec.order,
    }
  end
  return signals
end

-- These startup settings let the player decide which Space Age planet-specific
-- materials and milestone technologies Flying Freighters should sit behind.
-- They only affect the Space Age branch; vanilla progression remains unchanged.
local lock_behind_gleba = startup_settings.startup_bool_value("ff-lock-behind-gleba")
local lock_behind_fulgora = startup_settings.startup_bool_value("ff-lock-behind-fulgora")
local lock_behind_vulcanus = startup_settings.startup_bool_value("ff-lock-behind-vulcanus")
local any_planet_lock_enabled = lock_behind_gleba or lock_behind_fulgora or lock_behind_vulcanus

-- Keep recipe and technology edits idempotent so later refactors or optional
-- compatibility hooks can safely reuse the same helpers without duplicating
-- ingredients or prerequisites.
local function recipe_has_ingredient(recipe, ingredient_name)
  for _, ingredient in ipairs(recipe.ingredients or {}) do
    if ingredient.name == ingredient_name then
      return true
    end
  end
  return false
end

local function add_recipe_ingredient(recipe, ingredient)
  if not recipe_has_ingredient(recipe, ingredient.name) then
    recipe.ingredients[#recipe.ingredients + 1] = ingredient
  end
end

local function tech_has_prerequisite(technology, prerequisite_name)
  for _, prerequisite in ipairs(technology.prerequisites or {}) do
    if prerequisite == prerequisite_name then
      return true
    end
  end
  return false
end

local function add_tech_prerequisite(technology, prerequisite_name)
  if not tech_has_prerequisite(technology, prerequisite_name) then
    technology.prerequisites[#technology.prerequisites + 1] = prerequisite_name
  end
end

local function tech_has_unit_ingredient(technology, ingredient_name)
  for _, ingredient in ipairs(technology.unit and technology.unit.ingredients or {}) do
    if ingredient[1] == ingredient_name or ingredient.name == ingredient_name then
      return true
    end
  end
  return false
end

local function add_tech_unit_ingredient(technology, ingredient_name, amount)
  if not tech_has_unit_ingredient(technology, ingredient_name) then
    technology.unit.ingredients[#technology.unit.ingredients + 1] = {ingredient_name, amount}
  end
end

local function scale_with_tile_growth(base_scale, reference_pixels)
  return base_scale + ((station_visual_growth_tiles * 32) / reference_pixels)
end

local function tinted_spidertron_icon(scale)
  return {
    icon = "__base__/graphics/icons/spidertron.png",
    icon_size = 64,
    tint = freighter_tint,
    scale = scale,
  }
end

local function cargo_pad_layer(name, width, height, shift, opts)
  local base_shift = shift or {0, -1}
  local layer = {
    filename = "__base__/graphics/entity/cargo-hubs/hubs/" .. name .. ".png",
    priority = "high",
    width = width,
    height = height,
    shift = {base_shift[1], base_shift[2] + station_visual_y_offset},
    scale = scale_with_tile_growth(0.5, 500),
  }
  opts = opts or {}
  if opts.draw_as_shadow then
    layer.draw_as_shadow = true
  else
    layer.tint = station_tint
  end
  if opts.draw_as_glow then
    layer.draw_as_glow = true
    layer.blend_mode = "additive"
  end
  return layer
end

local function tint_sprite_layers(sprite, tint)
  if type(sprite) ~= "table" then
    return
  end
  if sprite.layers then
    for _, layer in ipairs(sprite.layers) do
      tint_sprite_layers(layer, tint)
    end
  end
  if sprite.sheet then
    tint_sprite_layers(sprite.sheet, tint)
  end
  if sprite.sheets then
    for _, sheet in ipairs(sprite.sheets) do
      tint_sprite_layers(sheet, tint)
    end
  end
  if sprite.filenames then
    sprite.tint = tint
  elseif sprite.filename then
    sprite.tint = tint
  end
  if sprite.hr_version then
    tint_sprite_layers(sprite.hr_version, tint)
  end
end

local function make_station_picture()
  local cargo_landing_pad = data.raw["cargo-landing-pad"] and data.raw["cargo-landing-pad"]["cargo-landing-pad"]
  if cargo_landing_pad then
    return {
      layers = {
        cargo_pad_layer("planet-hub-shadow", 318, 408, {8, 0}, {draw_as_shadow = true}),
        cargo_pad_layer("planet-hub-2", 476, 500),
        cargo_pad_layer("planet-hub-0-A", 290, 106),
        cargo_pad_layer("planet-hub-0-B", 66, 194),
        cargo_pad_layer("planet-hub-0-C", 66, 112),
        cargo_pad_layer("planet-hub-0-D", 96, 210),
        cargo_pad_layer("planet-hub-1-A", 210, 70),
        cargo_pad_layer("planet-hub-1-B", 108, 60),
        cargo_pad_layer("planet-hub-1-C", 96, 120),
        cargo_pad_layer("planet-hub-3", 498, 506),
        cargo_pad_layer("planet-hub-emission-A", 244, 198, {0, -1}, {draw_as_glow = true}),
        cargo_pad_layer("planet-hub-emission-C", 232, 102, {0, -1}, {draw_as_glow = true}),
      }
    }
  end

  return {
    layers = {
      {
        filename = "__base__/graphics/entity/roboport/roboport-base.png",
        priority = "high",
        width = 143,
        height = 135,
        shift = {0.5, 0.75},
        scale = scale_with_tile_growth(1.4, 143),
        tint = station_tint,
      }
    }
  }
end

-- The passive-provider variant reuses the same oversized station art but gets
-- its own red tint so players can distinguish it from the standard station at
-- a glance while keeping the same overall silhouette.
local function make_passive_provider_station_picture()
  local picture = make_station_picture()
  tint_sprite_layers(picture, passive_provider_station_tint)
  return picture
end

local station = table.deepcopy(data.raw.container["steel-chest"])
station.name = station_name
station.icon = "__base__/graphics/icons/cargo-landing-pad.png"
station.icon_size = 64
station.minable = {mining_time = 1, result = station_name}
station.max_health = 2500
station.localised_description = nil
station.flags = {"placeable-player", "player-creation", "not-flammable"}
station.collision_box = {{-3.8, -3.8}, {3.8, 3.8}}
station.selection_box = {{-4, -4}, {4, 4}}
station.inventory_size = 480
station.picture = make_station_picture()
station.fast_replaceable_group = nil
station.vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
station.circuit_wire_max_distance = 9

local passive_provider_station = table.deepcopy(data.raw["logistic-container"]["passive-provider-chest"])
passive_provider_station.name = passive_provider_station_name
passive_provider_station.icons = {
  {icon = "__base__/graphics/icons/cargo-landing-pad.png", icon_size = 64, tint = passive_provider_station_tint},
}
passive_provider_station.icon = "__base__/graphics/icons/cargo-landing-pad.png"
passive_provider_station.icon_size = 64
passive_provider_station.minable = {mining_time = 1, result = passive_provider_station_name}
passive_provider_station.max_health = 2500
passive_provider_station.localised_description = nil
passive_provider_station.flags = {"placeable-player", "player-creation", "not-flammable"}
passive_provider_station.collision_box = {{-3.8, -3.8}, {3.8, 3.8}}
passive_provider_station.selection_box = {{-4, -4}, {4, 4}}
passive_provider_station.inventory_size = 480
passive_provider_station.picture = make_passive_provider_station_picture()
passive_provider_station.fast_replaceable_group = nil
passive_provider_station.vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
passive_provider_station.circuit_wire_max_distance = 9

local station_power = table.deepcopy(data.raw["electric-energy-interface"]["electric-energy-interface"])
station_power.name = station_power_name
station_power.icon = "__base__/graphics/icons/cargo-landing-pad.png"
station_power.icon_size = 64
station_power.hidden = true
station_power.flags = {"not-on-map", "not-blueprintable", "not-deconstructable", "not-flammable"}
station_power.selectable_in_game = false
station_power.minable = nil
station_power.max_health = 1
station_power.localised_description = nil
station_power.collision_box = {{-3.8, -3.8}, {3.8, 3.8}}
station_power.selection_box = {{-4, -4}, {4, 4}}
station_power.collision_mask = {layers = {doodad = true}, not_colliding_with_itself = true}
station_power.picture = {
  filename = "__core__/graphics/empty.png",
  priority = "extra-high",
  width = 1,
  height = 1,
}
station_power.fast_replaceable_group = nil
station_power.gui_mode = "none"
station_power.energy_source = {
  type = "electric",
  buffer_capacity = tostring(math.floor(station_power_defaults.buffer_j / 1000000)) .. "MJ",
  usage_priority = "secondary-input",
  input_flow_limit = "100GW",
  output_flow_limit = "0W",
}
station_power.energy_production = "0W"
station_power.energy_usage = "0W"

local station_cargo = table.deepcopy(data.raw.container["steel-chest"])
station_cargo.name = station_cargo_name
station_cargo.icon = "__base__/graphics/icons/steel-chest.png"
station_cargo.icon_size = 64
station_cargo.hidden = true
station_cargo.flags = {"not-on-map", "not-blueprintable", "not-deconstructable", "not-flammable"}
station_cargo.selectable_in_game = false
station_cargo.minable = nil
station_cargo.max_health = 1
station_cargo.inventory_size = 480
station_cargo.localised_description = nil
station_cargo.collision_box = {{-3.8, -3.8}, {3.8, 3.8}}
station_cargo.selection_box = {{-4, -4}, {4, 4}}
station_cargo.collision_mask = {layers = {doodad = true}, not_colliding_with_itself = true}
station_cargo.picture = {
  filename = "__core__/graphics/empty.png",
  priority = "extra-high",
  width = 1,
  height = 1,
}
station_cargo.fast_replaceable_group = nil

local station_circuit = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
station_circuit.name = station_circuit_name
station_circuit.icon = "__base__/graphics/icons/constant-combinator.png"
station_circuit.icon_size = 64
station_circuit.hidden = true
station_circuit.flags = {"not-on-map", "not-blueprintable", "not-deconstructable", "not-flammable"}
station_circuit.selectable_in_game = false
station_circuit.minable = nil
station_circuit.max_health = 1
station_circuit.localised_description = nil
station_circuit.item_slot_count = 1
station_circuit.collision_box = {{-3.8, -3.8}, {3.8, 3.8}}
station_circuit.selection_box = {{-4, -4}, {4, 4}}
station_circuit.collision_mask = {layers = {doodad = true}, not_colliding_with_itself = true}
station_circuit.sprites = {
  north = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
  east = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
  south = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
  west = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
}
station_circuit.activity_led_sprites = {
  north = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
  east = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
  south = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
  west = {filename = "__core__/graphics/empty.png", width = 1, height = 1, frame_count = 1, shift = {0, 0}},
}
station_circuit.activity_led_light = {
  intensity = 0,
  size = 0,
  color = {r = 0, g = 0, b = 0},
}
station_circuit.activity_led_light_offsets = {
  {0, 0},
  {0, 0},
  {0, 0},
  {0, 0},
}

local circuit_virtual_signals = build_circuit_virtual_signals()

local spider_base = data.raw["spider-vehicle"] and data.raw["spider-vehicle"]["spidertron"]
local freighter = table.deepcopy(spider_base or data.raw.car.tank)
freighter.name = freighter_name
freighter.icon = "__base__/graphics/icons/spidertron.png"
freighter.icon_size = 64
freighter.minable = {mining_time = 1, result = freighter_name}
freighter.max_health = 3000
freighter.collision_box = {{-1.1, -1.1}, {1.1, 1.1}}
freighter.selection_box = {{-1.2, -1.2}, {1.2, 1.2}}
freighter.corpse = freighter.corpse or "spidertron-remnants"
freighter.effectivity = freighter.effectivity or 1
freighter.consumption = freighter.consumption or "1kW"
freighter.weight = 5000
freighter.movement_speed = spider_base and spider_base.movement_speed or freighter.movement_speed
freighter.turret_rotation_speed = 0.0
freighter.energy_per_hit_point = 1
freighter.inventory_size = 120
freighter.trunk_inventory_size = nil
freighter.automatic_weapon_cycling = true

local gun_candidates = {
  "mortar-gun-rampant-arsenal",
  "capsule-launcher-gun-rampant-arsenal",
  "rocket-launcher",
  "tank-cannon",
}
local selected_gun = nil
for _, gun_name in ipairs(gun_candidates) do
  if data.raw.gun and data.raw.gun[gun_name] then
    selected_gun = gun_name
    break
  end
end
freighter.guns = selected_gun and {selected_gun} or {}
freighter.equipment_grid = nil
freighter.trash_inventory_size = 0
freighter.energy_source = {
  type = "burner",
  fuel_categories = {"chemical"},
  effectivity = 1,
  fuel_inventory_size = 1,
  smoke = {},
}
freighter.movement_energy_consumption = spider_base and spider_base.movement_energy_consumption or freighter.movement_energy_consumption or "250kW"
freighter.has_belt_immunity = true
freighter.color = freighter_tint
-- Spider vehicles emit their main locomotion audio from the chassis-level
-- working sound. Overriding only the hidden leg sound leaves the inherited
-- spidertron movement loop in place, so players still hear the default sound.
-- Route the freighter's primary movement audio through the packaged wing flap
-- clip so the audible motion matches the airborne presentation.
freighter.working_sound = {
  sound = freighter_wing_flap_sound,
  match_speed_to_activity = true,
  activity_to_speed_modifiers = {
    multiplier = 6.0,
    minimum = 1.0,
    offset = 0.93333333333,
  },
}

local function tint_masked_layers(animation)
  if type(animation) ~= "table" then
    return
  end
  if animation.layers then
    for _, layer in ipairs(animation.layers) do
      tint_masked_layers(layer)
    end
    return
  end
  local flags = animation.flags
  if flags then
    for _, flag in ipairs(flags) do
      if flag == "mask" then
        animation.tint = freighter_tint
        break
      end
    end
  end
  if animation.hr_version then
    tint_masked_layers(animation.hr_version)
  end
end

tint_masked_layers(freighter.animation)
tint_masked_layers(freighter.turret_animation)
tint_masked_layers(freighter.light_animation)

local hidden_leg_names = {}
if data.raw["spider-leg"] then
  for i = 1, 1 do
    local base_leg = data.raw["spider-leg"]["spidertron-leg-" .. i]
    if base_leg then
      local leg = table.deepcopy(base_leg)
      leg.name = freighter_name .. "-leg-" .. i
      leg.initial_movement_speed = base_leg.initial_movement_speed or leg.initial_movement_speed or 0.06
      leg.movement_acceleration = base_leg.movement_acceleration or leg.movement_acceleration or 0.03
      -- Flying freighters are visually airborne, so reusing the spidertron leg
      -- prototype is only a movement hack. Swap the ground-step sound out for
      -- the imported wing flap audio so movement reads like flight instead of
      -- metal footsteps. The leg prototype also carries separate walking sound
      -- volume/speed modifiers that still let surface-specific spidertron step
      -- sounds leak through on some tiles, so zero those inherited modifiers
      -- as well and leave the packaged flap clip as the only movement sound.
      leg.working_sound = {
        match_progress_to_activity = true,
        sound = freighter_wing_flap_sound,
      }
      leg.walking_sound_volume_modifier = 0
      leg.walking_sound_speed_modifier = 0
      leg.collision_box = {{0, 0}, {0, 0}}
      leg.selection_box = {{0, 0}, {0, 0}}
      leg.graphics_set = {
        upper_part = {
          layers = {{
            filename = "__core__/graphics/empty.png",
            width = 1,
            height = 1,
            frame_count = 1,
            direction_count = 1,
          }},
        },
        lower_part = {
          layers = {{
            filename = "__core__/graphics/empty.png",
            width = 1,
            height = 1,
            frame_count = 1,
            direction_count = 1,
          }},
        },
      }
      hidden_leg_names[i] = leg.name
      data:extend({leg})
    end
  end
end

if freighter.spider_engine and freighter.spider_engine.legs and #freighter.spider_engine.legs > 0 then
  local leg_ref = table.deepcopy(freighter.spider_engine.legs[1])
  if leg_ref and hidden_leg_names[1] then
    leg_ref.leg = hidden_leg_names[1]
    leg_ref.blocking_legs = {}
    -- The freighter no longer pretends to strike the ground, so suppress the
    -- spidertron landing smoke trigger that would otherwise spawn a footstep
    -- puff every time the hidden locomotion leg advances. Clearing the field
    -- entirely keeps the prototype valid, whereas an empty trigger array is
    -- rejected by the data stage because every trigger entry must have a
    -- concrete `type`.
    leg_ref.leg_hit_the_ground_trigger = nil
    freighter.spider_engine.legs = {leg_ref}
  end
end

local station_item = {
  type = "item",
  name = station_name,
  icons = {
    {icon = "__base__/graphics/icons/cargo-landing-pad.png", icon_size = 64, tint = station_tint},
  },
  icon = "__base__/graphics/icons/cargo-landing-pad.png",
  icon_size = 64,
  subgroup = "logistic-network",
  order = "c[signal]-z[flying-freighter-station]",
  place_result = station_name,
  stack_size = 20,
  weight = 50000,
}

local freighter_item = {
  type = "item-with-entity-data",
  name = freighter_name,
  icons = {
    tinted_spidertron_icon(),
  },
  icon = "__base__/graphics/icons/spidertron.png",
  icon_size = 64,
  subgroup = "transport",
  order = "b[personal-transport]-z[flying-freighter]",
  place_result = freighter_name,
  stack_size = 5,
  weight = 200000,
}

local passive_provider_station_item = {
  type = "item",
  name = passive_provider_station_name,
  icons = {
    {icon = "__base__/graphics/icons/cargo-landing-pad.png", icon_size = 64, tint = passive_provider_station_tint},
  },
  icon = "__base__/graphics/icons/cargo-landing-pad.png",
  icon_size = 64,
  subgroup = "logistic-network",
  order = "c[signal]-za[flying-freighter-passive-provider-station]",
  place_result = passive_provider_station_name,
  stack_size = 20,
  weight = 50000,
}

local station_recipe = {
  type = "recipe",
  name = station_name,
  enabled = false,
  energy_required = 20,
  ingredients = {
    {type = "item", name = "steel-plate", amount = 200},
    {type = "item", name = "stone-brick", amount = 120},
    {type = "item", name = "advanced-circuit", amount = 100},
    {type = "item", name = "solar-panel", amount = 30},
    {type = "item", name = "accumulator", amount = 30},
  },
  results = {
    {type = "item", name = station_name, amount = 1},
  },
}

local station_nuclear_recipe = {
  type = "recipe",
  name = station_name .. "-nuclear",
  enabled = false,
  energy_required = 20,
  ingredients = {
    {type = "item", name = "steel-plate", amount = 200},
    {type = "item", name = "stone-brick", amount = 120},
    {type = "item", name = "advanced-circuit", amount = 100},
    {type = "item", name = "nuclear-reactor", amount = 1},
  },
  results = {
    {type = "item", name = station_name, amount = 1},
  },
}

local freighter_recipe = {
  type = "recipe",
  name = freighter_name,
  enabled = false,
  energy_required = 15,
  ingredients = {
    {type = "item", name = "steel-plate", amount = 120},
    {type = "item", name = "stone-brick", amount = 80},
    {type = "item", name = "advanced-circuit", amount = 80},
    {type = "item", name = "production-science-pack", amount = 30},
  },
  results = {
    {type = "item", name = freighter_name, amount = 1},
  },
}

local passive_provider_station_recipe = {
  type = "recipe",
  name = passive_provider_station_name,
  enabled = false,
  energy_required = 20,
  ingredients = {
    {type = "item", name = station_name, amount = 1},
    {type = "item", name = "passive-provider-chest", amount = 1},
  },
  results = {
    {type = "item", name = passive_provider_station_name, amount = 1},
  },
}

local tech = {
  type = "technology",
  name = "flying-freighters",
  icons = {
    tinted_spidertron_icon(4),
  },
  icon_size = 64,
  prerequisites = {
    "production-science-pack",
  },
  unit = {
    count = 300,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
  effects = {
    {type = "unlock-recipe", recipe = station_name},
    {type = "unlock-recipe", recipe = station_name .. "-nuclear"},
    {type = "unlock-recipe", recipe = freighter_name},
  },
  order = "c-k-f[flying-freighters]",
}

local passive_provider_tech = {
  type = "technology",
  name = "flying-freighter-passive-provider-stations",
  icons = {
    {icon = "__base__/graphics/icons/passive-provider-chest.png", icon_size = 64},
    tinted_spidertron_icon(2.5),
  },
  icon_size = 64,
  prerequisites = {
    "flying-freighters",
    "logistic-system",
  },
  unit = {
    count = 1000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
    },
    time = 30,
  },
  effects = {
    {type = "unlock-recipe", recipe = passive_provider_station_name},
  },
  order = "c-k-g[flying-freighter-passive-provider-stations]",
}

-- Space Age progression is intentionally stricter so flying freighters sit
-- behind whichever planet gates the player has enabled in startup settings.
-- The base production science prerequisite remains so the feature still lands
-- in the late-game logistics band even when every optional planet gate is off.
if space_age_enabled then
  tech.prerequisites = {
    "production-science-pack",
  }
  tech.unit.count = 1000
  tech.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"space-science-pack", 1},
  }

  if not any_planet_lock_enabled then
    add_tech_unit_ingredient(tech, "utility-science-pack", 1)
  end

  -- Gleba stays enabled by default because the freighter frame now already uses
  -- carbon fiber, so that default keeps the recipe and tech gate aligned.
  if lock_behind_gleba then
    add_tech_unit_ingredient(tech, "agricultural-science-pack", 1)
    add_recipe_ingredient(freighter_recipe, {type = "item", name = "carbon-fiber", amount = 20})
    add_tech_prerequisite(tech, "carbon-fiber")
  end

  -- Fulgora gating uses the electromagnetic plant milestone explicitly and adds
  -- one of Fulgora's signature advanced electrical materials to the hull.
  if lock_behind_fulgora then
    add_recipe_ingredient(freighter_recipe, {type = "item", name = "supercapacitor", amount = 20})
    add_tech_prerequisite(tech, "electromagnetic-plant")
    add_tech_unit_ingredient(tech, "electromagnetic-science-pack", 1)
  end

  -- Vulcanus gating can be expressed through tungsten plates directly because
  -- that recipe dependency already forces access to Vulcanus metallurgy, and
  -- the extra science pack keeps the research cost aligned with that choice.
  if lock_behind_vulcanus then
    add_recipe_ingredient(freighter_recipe, {type = "item", name = "tungsten-plate", amount = 40})
    add_tech_unit_ingredient(tech, "metallurgic-science-pack", 1)
  end

  -- Treat the passive-provider upgrade as the full Space Age end-game branch:
  -- it keeps the normal late-game logistics packs, then layers in every
  -- planetary science pack plus Aquilo's cryogenic science so the hybrid
  -- station only unlocks after the whole interplanetary science ladder.
  passive_provider_tech.prerequisites = {
    "flying-freighters",
    "logistic-system",
    "space-science-pack",
    "agricultural-science-pack",
    "electromagnetic-science-pack",
    "metallurgic-science-pack",
    "cryogenic-science-pack",
  }
  passive_provider_tech.unit.count = 10000
  passive_provider_tech.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    {"agricultural-science-pack", 1},
    {"electromagnetic-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"cryogenic-science-pack", 1},
  }
end

local open_config_input = {
  type = "custom-input",
  name = shared_constants.INPUT_OPEN_CONFIG,
  key_sequence = "SHIFT + F",
  consuming = "game-only",
}

local station_toggle_type_input = {
  type = "custom-input",
  name = shared_constants.INPUT_TOGGLE_STATION_TYPE,
  key_sequence = "Q",
  consuming = "none",
}

local station_toggle_fuel_input = {
  type = "custom-input",
  name = shared_constants.INPUT_TOGGLE_FUEL_STOP,
  key_sequence = "Z",
  consuming = "none",
}

local station_toggle_ammo_input = {
  type = "custom-input",
  name = shared_constants.INPUT_TOGGLE_AMMO_STOP,
  key_sequence = "X",
  consuming = "none",
}

local station_toggle_trash_input = {
  type = "custom-input",
  name = shared_constants.INPUT_TOGGLE_TRASH_STOP,
  key_sequence = "C",
  consuming = "none",
}

local gui_confirm_input = {
  type = "custom-input",
  name = shared_constants.INPUT_GUI_CONFIRM,
  key_sequence = "E",
  consuming = "none",
}

data:extend({
  station_item,
  passive_provider_station_item,
  freighter_item,
  station,
  passive_provider_station,
  station_power,
  station_cargo,
  station_circuit,
  freighter,
  station_recipe,
  station_nuclear_recipe,
  freighter_recipe,
  passive_provider_station_recipe,
  tech,
  passive_provider_tech,
  open_config_input,
  station_toggle_type_input,
  station_toggle_fuel_input,
  station_toggle_ammo_input,
  station_toggle_trash_input,
  gui_confirm_input,
})

data:extend(circuit_virtual_signals)
