return {
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   enabled = false,
  --   lazy = false,
  --   priority = 1000,
  --   opts = function()
  --     ---@diagnostic disable-next-line: missing-parameter
  --     require("nordic").load()
  --   end,
  -- },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      vim.cmd "colorscheme nightfox"
    end,
  },
}
