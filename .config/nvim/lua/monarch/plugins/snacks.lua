return {
  "folke/snacks.nvim",
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    lazygit = {
      enabled = true,
      theme = {
        -- NOTE: Added because of AlexvZyl/nordic.nvim theme, default couldn't be seen
        inactiveBorderColor = { fg = "WinBar" },
      },
    },
    statuscolumn = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
    -- stylua: ingore end
  },
}
