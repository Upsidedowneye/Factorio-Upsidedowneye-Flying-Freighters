-- Keep this in data stage so the engine can award the achievement automatically
-- without any runtime bookkeeping or control-stage event handling.
-- The icon is a mod-local purple retint of base's arachnophilia achievement art so
-- the badge reads as a special freighter milestone instead of reusing the plain
-- spidertron item icon.
local flying_freighter_achievements = {
  {
    type = "build-entity-achievement",
    name = "flying-freighter-first-flight",
    order = "a[progress]-z[flying-freighter-first-flight]",
    to_build = "flying-freighter",
    icon = "__upsidedowneye-flying-freighters__/graphics/achievement/flying-freighter-first-flight.png",
    icon_size = 128,
  },
}

data:extend(flying_freighter_achievements)