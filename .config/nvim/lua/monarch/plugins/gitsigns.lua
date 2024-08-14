return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = " " },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
        },
    },
    keys = {
        { "]h", "<cmd> Gitsigns next_hunk <cr>", desc = "Next hunk" },
        { "[h", "<cmd> Gitsigns prev_hunk <cr>", desc = "Previous hunk" },
        { "<leader>gr", "<cmd> Gitsigns reset_hunk <cr>", desc = "Reset hunk" },
        { "<leader>gR", "<cmd> Gitsigns reset_buffer <cr>", desc = "Reset buffer" },
        { "<leader>gS", "<cmd> Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
        { "<leader>gs", "<cmd> Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
        -- { "<leader>gd", "<cmd> Gitsigns diffthis <cr>", desc = "Git diff" },
        -- { "<leader>gD", "<cmd> Gitsigns diffthis ~ <cr>", desc = "Git diff HEAD~" },
    },
}
