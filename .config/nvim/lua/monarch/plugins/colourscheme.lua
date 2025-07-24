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

  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = function()
  --     vim.cmd "colorscheme nightfox"
  --   end,
  -- },

  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd "colorscheme moonfly"
    --   vim.o.background = "dark"
    --   vim.api.nvim_set_hl(0, "FloatBorder", { link = "NormalFloat" })
    end,
  },
}
