return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      enabled = true,
      theme = {
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
