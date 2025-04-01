local M = {}

M.get = function()
  -- NOTE: becuase 'AlexvZyl/nordic.nvim' has a darker FloatBorder
  local border = {
    { "🭽", "NormalFloat" },
    { "▔", "NormalFloat" },
    { "🭾", "NormalFloat" },
    { "▕", "NormalFloat" },
    { "🭿", "NormalFloat" },
    { "▁", "NormalFloat" },
    { "🭼", "NormalFloat" },
    { "▏", "NormalFloat" },
    -- { "🭽", "FloatBorder" },
    -- { "▔", "FloatBorder" },
    -- { "🭾", "FloatBorder" },
    -- { "▕", "FloatBorder" },
    -- { "🭿", "FloatBorder" },
    -- { "▁", "FloatBorder" },
    -- { "🭼", "FloatBorder" },
    -- { "▏", "FloatBorder" },
  }
  -- end NOTE

  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    -- ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    -- ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  }
  return handlers
end

return M
