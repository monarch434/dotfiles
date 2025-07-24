return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = { "davidmh/cspell.nvim" },
  opts = function(_, opts)
    local nls = require "null-ls"
    local cspell = require "cspell"
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- Golang
      nls.builtins.code_actions.gomodifytags,
      nls.builtins.code_actions.impl,
      nls.builtins.formatting.goimports,
      nls.builtins.formatting.gofumpt,
      -- Lua
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
      -- Web dev
      nls.builtins.formatting.prettier,
      nls.builtins.formatting.prettierd,
      -- Python
      nls.builtins.formatting.black,
      -- spelling
      -- cspell.diagnostics.with {
      --   diagnostics_postprocess = function(diagnostic)
      --     diagnostic.severity = vim.diagnostic.severity.HINT
      --   end,
      -- },
      cspell.code_action,
    })
  end,
}
