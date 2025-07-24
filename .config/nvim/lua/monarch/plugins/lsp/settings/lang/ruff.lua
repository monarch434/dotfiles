return {
  cmd_env = { RUFF_TRACE = "messages" },
  init_options = {
    settings = {
      logLevel = "error",
      lint = {
        enable = false,
      },
    },
  },
  -- keys = {
  --   {
  --     "<leader>co",
  --     -- LazyVim.lsp.action["source.organizeImports"],
  --     function()
  --       vim.lsp.buf.code_action { apply = true, context = { only = { "source.organizeImports" }, diagnostics = {} } }
  --     end,
  --     desc = "Organize Imports",
  --   },
  -- },
}
