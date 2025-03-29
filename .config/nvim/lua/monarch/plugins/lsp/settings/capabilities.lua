local M = {}

local cap = {
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
}

M.get = function()
  local has_blink, blink = pcall(require, "blink.cmp")
  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    has_blink and blink.get_lsp_capabilities() or {},
    cap
  )
  return capabilities
end

return M
