return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  opts = function()
    ---@diagnostic disable-next-line: missing-parameter
    require("nordic").load()
  end,
}
