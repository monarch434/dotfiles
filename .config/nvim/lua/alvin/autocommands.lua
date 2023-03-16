local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("formatting", { clear = true })
autocmd({ "FileType" }, { group = "formatting", pattern = { "*" }, command = "setlocal formatoptions-=cro" })

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

augroup("ChangeNvimTreeDirectory", { clear = true })
autocmd({ "VimEnter" }, {
    group = "ChangeNvimTreeDirectory",
    callback = function(data)
        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        -- buffer is a real file on the disk
        local real_file = vim.fn.filereadable(data.file) == 1

        -- buffer is a [No Name]
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

        if not directory then
            return
        end

        -- change to the directory
        vim.cmd.cd(data.file)
        -- if real_file or no_name then
        --     require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
        -- end
    end,
})
