return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  init = function()
    vim.g.navic_silence = true
    vim.o.winbar = "."
  end,
  config = function()
    local navic = require "nvim-navic"
    navic.setup {
      separator = " ",
      highlight = true,
      depth_limit = 5,
      icons = monarch.kinds,
      lazy_update_context = true,
    }
  end,
}
