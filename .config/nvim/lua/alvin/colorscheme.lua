local tokyonight = "tokyonight"
local catppuccin = "catppuccin"
local everforest = "everforest"

vim.g.tokyonight_style = "storm"

vim.g.catppuccin_flavour = "frappe"

vim.g.everforest_background = "medium"
vim.g.everforest_dim_inactive_windows = 0
vim.g.everforest_ui_contrast = "high"
vim.g.everforest_current_word = "bold" -- default "grey background"

local chosen_theme = everforest

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. chosen_theme)

if not status_ok then
    vim.notify("colorscheme " .. chosen_theme .. " not found")
    return
end
