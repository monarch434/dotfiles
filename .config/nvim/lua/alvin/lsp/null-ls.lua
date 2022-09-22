local status_ok, nls = pcall(require, "null-ls")
if not status_ok then
	print("unable to load null-ls")
	return
end

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local completion = nls.builtins.completion

nls.setup({
	sources = {
		formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "4" } }),
		diagnostics.eslint,
		completion.spell,
		formatting.goimports,
		formatting.gofumpt,
	},
	on_attach = function(client, bufnr) end,
})

local M = {}

function M.list_registered_providers_names(filetype)
  local s = require "null-ls.sources"
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

function M.list_registered_formatters(filetype)
  local registered_providers = M.list_registered_providers_names(filetype)
  local method = nls.methods.FORMATTING
  return registered_providers[method] or {}
end

function M.list_registered_linters(filetype)
  local registered_providers = M.list_registered_providers_names(filetype)
  local method = nls.methods.DIAGNOSTICS
  return registered_providers[method] or {}
end

return M
