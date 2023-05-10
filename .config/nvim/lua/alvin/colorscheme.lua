local tokyonight = "tokyonight"
local catppuccin = "catppuccin"

vim.g.tokyonight_style = "storm"
vim.g.catppuccin_flavour = "frappe"

local chosen_theme = tokyonight

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. chosen_theme)

if not status_ok then
    vim.notify("colorscheme " .. chosen_theme .. " not found")
    return
end
