local startup_settings = require("shared.startup-settings")

-- Startup settings let the player decide which Space Age planets should be
-- treated as required progression gates for Flying Freighters. The defaults are
-- intentionally conservative: Gleba stays on because carbon fiber is already a
-- core late-game material for the freighter frame, while Fulgora and Vulcanus
-- remain opt-in so existing saves do not pick up extra planet locks unless the
-- player explicitly wants them.
local settings_to_extend = {}
for _, spec in ipairs(startup_settings.specs) do
  settings_to_extend[#settings_to_extend + 1] = {
    type = "bool-setting",
    name = spec.name,
    setting_type = "startup",
    default_value = spec.default_value,
    order = spec.order,
  }
end

-- Let each save choose the bootstrap fuel that freshly built flying freighters
-- should receive. Keeping this runtime-global makes it a per-map preference
-- instead of a machine-wide startup decision.
settings_to_extend[#settings_to_extend + 1] = {
  type = "bool-setting",
  name = "ff-force-gui-hotkey-usage",
  setting_type = "runtime-per-user",
  default_value = false,
  order = "zy[gui-hotkeys]",
}

settings_to_extend[#settings_to_extend + 1] = {
  type = "string-setting",
  name = "ff-new-freighter-fuel",
  setting_type = "runtime-global",
  default_value = "coal",
  allowed_values = {"none", "wood", "coal", "solid-fuel", "rocket-fuel", "nuclear-fuel", "carbon"},
  order = "zz[new-freighter-fuel]",
}

data:extend(settings_to_extend)
