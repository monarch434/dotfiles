return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = require("monarch.core.globals").tools_ensure_installed,
    },
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
      { "j-hui/fidget.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim" },
      -- { "smjonas/inc-rename.nvim", cmd = "IncRename", opts = {} },
    },
    config = function()
      require "monarch.plugins.lsp.settings.keymaps"
      local icons = require("monarch.core.globals").icons

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = { vim.diagnostic.severity.ERROR } },
        update_in_insert = true, -- TODO: Do I like this?
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
          },
        } or {},
        virtual_text = {
          source = "if_many",
          spacing = 4,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }
      require("mason-lspconfig").setup {
        ensure_installed = require("monarch.core.globals").lsp_ensure_installed,
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
