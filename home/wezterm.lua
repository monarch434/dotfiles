local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- for better error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = "Everforest Dark (Gogh)"
config.font = wezterm.font_with_fallback({
    { family = "JetBrains Mono", weight = "Medium" },
    { family = "Fira Code", weight = "Regular" },
})

config.keys = {
    {
        key = "K",
        mods = "CTRL|SHIFT",
        action = act.Multiple({
            act.ClearScrollback("ScrollbackAndViewport"),
            act.SendKey({ key = "L", mods = "CTRL" }),
        }),
    },
}

return config
