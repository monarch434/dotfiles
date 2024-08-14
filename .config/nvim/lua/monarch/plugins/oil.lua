return {
    "stevearc/oil.nvim",
    tag = "v2.8.0",
    config = function()
        local oil = require("oil")
        oil.setup({
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git"
                end,
            },
            float = {
                padding = 5,
                max_width = 70,
                max_height = 30,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            cleanup_delay_ms = 500,
        })
        vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
    end,
}
