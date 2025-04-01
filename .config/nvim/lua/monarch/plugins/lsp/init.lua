return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = _G.monarch.tools_ensure_installed,
    },
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "saghen/blink.cmp",
      { "j-hui/fidget.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require "monarch.plugins.lsp.settings.keymaps"
      require("mason-lspconfig").setup {
        ensure_installed = _G.monarch.lsp_ensure_installed,
        automatic_installation = false,
        handlers = {
          function(server_name)
            local opts = {
              capabilities = require("monarch.plugins.lsp.settings.capabilities").get(),
              handlers = require("monarch.plugins.lsp.settings.handlers").get(),
              -- Note: might not need the workaround
              -- on_attach = require("monarch.plugins.lsp.settings.workaround").on_attach,
            }

            local ok, server_opts = pcall(require, "monarch.plugins.lsp.settings.lang." .. server_name)
            if ok then
              opts = vim.tbl_deep_extend("force", opts, server_opts)
            end

            require("lspconfig")[server_name].setup(opts)
          end,
        },
      }
    end,
  },
}
