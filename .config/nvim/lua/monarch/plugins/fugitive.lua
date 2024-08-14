return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gg", vim.cmd.Git, desc = "Git" },
        { "<leader>gD", "<cmd> Gvdiffsplit! <CR>", desc = "Git diff split" },
        { "<leader>h", "<cmd>diffget //2<CR>", desc = "Get //2" },
        { "<leader>l", "<cmd>diffget //3<CR>", desc = "Get //3" },
    },
    config = function()
        vim.api.nvim_create_augroup("fugitive_keymaps", { clear = true })
        vim.api.nvim_create_autocmd("BufWinEnter", {
            group = "fugitive_keymaps",
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>U", function()
                    vim.cmd.Git("push --force-with-lease")
                end, opts)

                -- rebase always
                vim.keymap.set("n", "<leader>d", function()
                    vim.cmd.Git({ "pull", "--rebase" })
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("close_with_esc", { clear = true }),
            pattern = {
                "fugitive",
            },
            callback = function(event)
                vim.bo[event.buf].buflisted = false
                vim.keymap.set(
                    "n",
                    "<ESC>",
                    "<cmd>close<cr>",
                    { buffer = event.buf, silent = true, desc = "Close fugiteve with <ESC>" }
                )
            end,
        })
    end,
}
