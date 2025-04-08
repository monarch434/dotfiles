return {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = { "ConformInfo" },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofumpt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      vue = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      python = { "black" },
      bash = { "shfmt" },
    },
    notify_on_error = false,
    default_format_opts = {
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
}
