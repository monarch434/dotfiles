return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
  opts = {},
  keys = {
    { "]h", "<cmd>silent Gitsigns next_hunk <cr>", desc = "Next hunk" },
    { "[h", "<cmd>silent Gitsigns prev_hunk <cr>", desc = "Previous hunk" },
    { "<leader>ghr", "<cmd> Gitsigns reset_hunk <cr>", desc = "Reset hunk" },
    { "<leader>ghR", "<cmd> Gitsigns reset_buffer <cr>", desc = "Reset buffer" },
    { "<leader>ghs", "<cmd> Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
    { "<leader>ghp", "<cmd> Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
    { "<leader>gb", "<cmd> Gitsigns blame_line<cr>", desc = "Toggle Line Blame" },
  },
}
