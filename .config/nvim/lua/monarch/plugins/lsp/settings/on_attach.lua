local M = {}

---@param on_attach fun(client:vim.lsp.Client, buffer)
---@param name? string
function M.attach(on_attach, name)
  return vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and (not name or client.name == name) then
        return on_attach(client, buffer)
      end
    end,
  })
end

function M.on_attach(client, bufnr)
  if client.supports_method "textDocument/documentSymbol" then
    require("nvim-navic").attach(client, bufnr)
  end

  if client.supports_method "textDocument/codeLens" then
    vim.lsp.codelens.refresh()
    -- NOTE: changed from 'CursorHold' too 'BufWritePost' because of constent flickering
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("monarch_codelensRefresh", { clear = true }),
      buffer = bufnr,
      callback = vim.lsp.codelens.refresh,
    })
  end

  if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
    local semantic = client.config.capabilities.textDocument.semanticTokens
    client.server_capabilities.semanticTokensProvider = {
      full = true,
      legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
      range = true,
    }
    print "Semantic tokens provider enabled for gopls"
  end
end

return M
