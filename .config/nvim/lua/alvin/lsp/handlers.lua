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
	-- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	-- local opts = { noremap = true, silent = true }
	local opts = { buffer = bufnr, noremap = true, silent = true }
	keymap("n", "gD", vim.lsp.buf.declaration, opts)
	keymap("n", "gd", vim.lsp.buf.definition, opts)
	-- keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	-- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap("n", "K", vim.lsp.buf.hover, opts)
	keymap("n", "gi", vim.lsp.buf.implementation, opts)
	keymap("n", "<space>f", vim.lsp.buf.formatting_sync, opts)
	-- keymap("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)
	--[[ buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap(
    "n",
    "gl",
    '<cmd>lua vim.diagnostic.get(' .. tostring(bufnr) .. ', { border = "rounded" })<CR>',
    opts
    )
    buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next(' .. bufnr .. ', { border = "rounded" })<CR>', opts) ]]
end

local function lsp_word_highlight(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end

	illuminate.on_attach(client)
end

M.on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
	lsp_keymaps(bufnr)
	lsp_word_highlight(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print("failed to load cmp_nvim_lsp")
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
