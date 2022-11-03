local M = {}
local keymap = vim.keymap.set

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_keymaps(bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "rn", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>f", vim.lsp.buf.format, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    -- keymap('n', '<leader>gw', vim.diagnostic.setloclis, opts)
    -- keymap('n', '<leader>ggw', vim.diagnostic.setqflist, opts)
    -- keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    -- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- keymap("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)
end

local function lsp_word_highlight(client)
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end

    illuminate.on_attach(client)
end

M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    lsp_keymaps(bufnr)
    lsp_word_highlight(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    print("failed to load cmp_nvim_lsp")
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
