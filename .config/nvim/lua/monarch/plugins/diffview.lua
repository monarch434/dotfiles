return {
  {
    "sindrets/diffview.nvim",
    opts = {
      use_icons = false,
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "[G]it [D]iffview" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "[G]it [D]iffview" },
    },
  },
}
