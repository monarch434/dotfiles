local wezterm = require("wezterm")
local config = {}

-- for better error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = "Everforest Dark (Gogh)"
config.font = wezterm.font_with_fallback({
    { family = 'JetBrains Mono', weight = 'Medium' },
    { family = "Fira Code", weight = "Regular"}
})

return config
