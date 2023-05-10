local status_ok, nls = pcall(require, "null-ls")
if not status_ok then
    print("unable to load null-ls")
    return
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
    print("unable to load mason-null-ls")
    return
end

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local completion = nls.builtins.completion

nls.setup({
    sources = {
        formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "4" } }),
        diagnostics.eslint_d,
        formatting.prettierd.with({ extra_args = { "--no-semi" } }),
        completion.spell,
        diagnostics.golangci_lint.with({ extra_args = { "run" } }),
        formatting.goimports,
        formatting.gofumpt,
        formatting.terraform_fmt,
    },
})

mason_null_ls.setup({ automatic_installation = true })

local M = {}

function M.list_registered_providers_names(filetype)
    local s = require("null-ls.sources")
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
