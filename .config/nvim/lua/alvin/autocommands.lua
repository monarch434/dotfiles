local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- set formatting options
augroup("formatting", { clear = true })
autocmd({ "FileType" }, { group = "formatting", pattern = { "*" }, command = "setlocal formatoptions-=cro" })

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

--fix terraform and hcl comment string
augroup("FixTerraformCommentString", { clear = true })
autocmd("FileType", {
    group = "FixTerraformCommentString",
    callback = function(ev)
        vim.bo[ev.buf].commentstring = "# %s"
    end,
    pattern = { "terraform", "hcl" },
})

-- vim fugitive keymaps
augroup("fugitive_keymaps", { clear = true })
autocmd("BufWinEnter", {
    group = "fugitive_keymaps",
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git("push")
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({ "pull", "--rebase" })
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
    end,
})
