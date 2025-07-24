local M = {}

local default_capabilities = {
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

local yamlls_capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

local ruff_capabilities = {
  hoverProvider = false,
}

M.get = function(server_name)
  local ok, blink = pcall(require, "blink.cmp")
  if not ok then
    print "blink not loaded"
  end

  local capabilities = vim.tbl_deep_extend("force", {}, blink.get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()) or {}, default_capabilities)

  if server_name == "yamlls" then
    capabilities = vim.tbl_deep_extend("force", capabilities, yamlls_capabilities)
  end

  if server_name == "ruff" then
    capabilities = vim.tbl_deep_extend("force", capabilities, ruff_capabilities)
  end

  return capabilities
end

return M
