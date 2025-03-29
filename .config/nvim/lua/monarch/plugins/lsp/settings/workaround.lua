local M = {}

M.on_attach = function(client, _)
  if client.name == "gopls" then
    vim.print(client.config.capabilities.textDocument.semanticTokens)
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
