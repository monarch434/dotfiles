local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- for better error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- setup hyperlinks
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

-- Set color_scheme
-- config.color_scheme = "Nord (Gogh)"
-- config.color_scheme = "Oceanic-Next"
-- config.color_scheme = "Monokai Vivid"

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.enable_tab_bar = false
config.initial_rows = 60
config.initial_cols = 210

-- config.color_scheme = "Everforest Dark (Gogh)"
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		weight = "Medium",
	},
	{ family = "Fira Code", weight = "Regular" },
})
config.font_size = 13.0

return config
