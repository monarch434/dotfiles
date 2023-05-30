local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    print("unable to load mason")
    return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    print("unable to load mason-lspconfig")
    return
end

local handlers_ok, handlers = pcall(require, "alvin.lsp.handlers")
if not handlers_ok then
    print("unable to load handlers")
    return
end

local lsp_servers = {
    -- language servers --
    "gopls",
    "lua_ls",
    "jsonls",
    "yamlls",
    "bashls",
    "vimls",
    "tsserver",
    "jdtls",
}

mason.setup({
    ui = {
        border = "single",
        icons = {
            package_installed = "✓",
            package_pending = "",
            package_uninstalled = "➜",
        },
    },
})

mason_lspconfig.setup({ ensure_installed = lsp_servers })

mason_lspconfig.setup_handlers({
    function(server_name)
        local opts = {
            on_attach = handlers.on_attach,
            capabilities = handlers.capabilities,
        }
        local require_ok, server = pcall(require, "alvin.lsp.settings." .. server_name)
        if require_ok then
            opts = vim.tbl_deep_extend("force", server, opts)
        end
        lspconfig[server_name].setup(opts)
        if server_name == "jsonls" then
            vim.api.nvim_create_augroup("jsonIndent", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = "jsonIndent",
                pattern = { "json" },
                callback = function()
                    vim.opt.tabstop = 2
                    vim.opt.shiftwidth = 2
                end,
            })
        end
    end,
})
