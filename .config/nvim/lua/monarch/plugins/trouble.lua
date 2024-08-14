return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    -- config = function()
    --     local keymap = vim.keymap.set
    --     local trouble = require("trouble")
    --
    -- keymap("n", "]t", function()
    --     trouble.next({ skip_groups = true, jump = true })
    -- end)
    --
    --     keymap("n", "[t", function()
    --         trouble.previous({ skip_groups = true, jump = true })
    --     end)
    -- end,
    keys = {
        {
            "tt",
            "<cmd>Trouble todo toggle<cr>",
            desc = "Toggle Trouble",
        },
        {
            "<leader>td",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics Trouble",
        },
        {
            "<leader>tw",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Workspace Diagnostics Trouble",
        },
        {
            "<leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Toggle quickfix list Trouble",
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle pinned=true win.relative=win win.position=right<cr>",
            desc = "Toggle Document symbols",
        },
    },
}
