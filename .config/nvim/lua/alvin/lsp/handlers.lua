local M = {}

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    print("unable to load which-key")
    return
end

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
    local n_opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
    }

    local n_mappings = {
        l = {
            name = "LSP",
            f = { ":lua vim.lsp.buf.format()<cr>", "Format file" },
            -- D = { ":lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
            D = { "<cmd>Lspsaga peek_definition<cr>", "Goto Declaration" },
            i = { ":lua vim.lsp.buf.implementation()<cr>", "Goto implementation" },
            d = { ":lua vim.lsp.buf.definition()<cr>", "Goto definition" },
            r = { "<cmd>Lspsaga finder ref<cr>", "List references" },
            t = { "<cmd>Lspsaga finder def+tyd<cr>", "Goto type definition" },
            a = { "<cmd>Lspsaga code_action<CR>", "Code action", mode = { "n", "v" } },
            n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next diagnostic" },
            p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous diagnostic" },
            R = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
            -- R = { "<cmd>Lspsaga rename<CR>", "Rename" }, -- NOTE: This is broken :(
            -- k = { ":lua vim.lsp.buf.hover()<cr>", "Hover" },
            k = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
        },
    }

    wk.register(n_mappings, n_opts)

    -- keymap('n', '<leader>gw', vim.diagnostic.setloclist, opts)
    -- keymap('n', '<leader>ggw', vim.diagnostic.setqflist, opts)
    -- keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    -- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- keymap("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)
end

local function lsp_word_highlight(client)
    local illuminate_status_ok, illuminate = pcall(require, "illuminate")
    if not illuminate_status_ok then
        return
    end

    illuminate.on_attach(client)
end

local function format_on_save(bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    if client.name == "html" then
        client.capabilities.textDocument.completion.completionItem.snippetSupport = true
    end
    lsp_keymaps(bufnr)
    -- it's nice, but annoying
    -- format_on_save(bufnr)
    lsp_word_highlight(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
    print("failed to load cmp_nvim_lsp")
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
M.capabilities.offsetEncoding = { "utf-16" } -- clangd fix

return M
