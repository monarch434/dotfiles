require "monarch.options"
require "monarch.remaps"
require "monarch.init"

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- decrease yank timout an highlight yanked text
augroup("yank", { clear = true })
autocmd("TextYankPost", {
    group = "yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- json file indent
augroup("jsonIndent", { clear = true })
autocmd("FileType", {
    group = "jsonIndent",
    pattern = { "json" },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end,
})
