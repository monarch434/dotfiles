local tokyonight = "tokyonight"
local catppuccin = "catppuccin"

vim.g.tokyonight_style = "storm"
vim.g.catppuccin_flavour = "frappe"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. catppuccin)

if not status_ok then
	vim.notify("colorscheme " .. catppuccin .. " not found")
	return
end
