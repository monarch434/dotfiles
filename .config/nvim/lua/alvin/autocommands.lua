local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("formatting", {clear = true})
autocmd({"FileType"}, {group = "formatting", pattern= {"*"}, command = "setlocal formatoptions-=cro"})

augroup("yank", {clear = true})
autocmd('TextYankPost', {
    group = "yank",
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
