local startup_setting_specs = {
  {
    name = "ff-lock-behind-gleba",
    default_value = true,
    order = "a[space-age-lock]-a[gleba]",
  },
  {
    name = "ff-lock-behind-fulgora",
    default_value = false,
    order = "a[space-age-lock]-b[fulgora]",
  },
  {
    name = "ff-lock-behind-vulcanus",
    default_value = false,
    order = "a[space-age-lock]-c[vulcanus]",
  },
  {
    name = "ff-freighter-network-hard-mode",
    default_value = false,
    order = "b[hard-mode]-a[freighter-network-id]",
  },
}

local module = {
  specs = startup_setting_specs,
}

-- Keep startup-setting metadata in one shared table so the settings stage and the
-- data stage cannot silently drift on names, defaults, or ordering during later
-- progression refactors.
function module.startup_bool_value(setting_name)
  local settings_root = rawget(_G, "settings")
  for _, spec in ipairs(startup_setting_specs) do
    if spec.name == setting_name then
      local setting = settings_root and settings_root.startup and settings_root.startup[setting_name] or nil
      if setting == nil or setting.value == nil then
        return spec.default_value
      end
      return setting.value
    end
  end

  return nil
end

return module
