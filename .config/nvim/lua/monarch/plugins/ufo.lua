return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" },
  init = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,

  config = function()
    require("ufo").setup {}
  end,
}
