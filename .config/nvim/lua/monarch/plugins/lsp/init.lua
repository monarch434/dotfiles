return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = _G.monarch.tools_ensure_installed,
    },
  },
  {
    "neovim/nvim-lspconfig",
    tag = "v2.2.0",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      { "williamboman/mason.nvim", tag = "v2.0.0", opts = {} },
      "saghen/blink.cmp",
      -- { "j-hui/fidget.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim", tag = "v2.0.0" },
    },
    config = function()
      require "monarch.plugins.lsp.settings.keymaps"
      require("mason-lspconfig").setup {
        ensure_installed = _G.monarch.lsp_ensure_installed,
        automatic_installation = false,
      }

      local servers = require("mason-lspconfig").get_installed_servers()
      for _, server_name in ipairs(servers) do
        local opts = {
          capabilities = require("monarch.plugins.lsp.settings.capabilities").get(server_name),
          -- handlers = require("monarch.plugins.lsp.settings.handlers").get(),
          -- on_attach = require("monarch.plugins.lsp.settings.workaround").on_attach,
          on_attach = require("monarch.plugins.lsp.settings.on_attach").on_attach,
        }
        local ok, server_opts = pcall(require, "monarch.plugins.lsp.settings.lang." .. server_name)
        if ok then
          opts = vim.tbl_deep_extend("force", opts, server_opts)
        end

        vim.lsp.config(server_name, opts)
        vim.lsp.enable(server_name)
      end


      vim.filetype.add {
        extension = {
          jinja = "jinja",
          jinja2 = "jinja",
          j2 = "jinja",
        },
      }
      -- handlers = {
      --   function(server_name)
      --     local opts = {
      --       capabilities = require("monarch.plugins.lsp.settings.capabilities").get(server_name),
      --       handlers = require("monarch.plugins.lsp.settings.handlers").get(),
      --       -- on_attach = require("monarch.plugins.lsp.settings.workaround").on_attach,
      --       on_attach = require("monarch.plugins.lsp.settings.on_attach").on_attach,
      --     }
      --
      --     local ok, server_opts = pcall(require, "monarch.plugins.lsp.settings.lang." .. server_name)
      --     if ok then
      --       opts = vim.tbl_deep_extend("force", opts, server_opts)
      --     end
      --
      --     require("lspconfig")[server_name].setup(opts)
      --   end,
      -- },
      -- }
    end,
  },
}
