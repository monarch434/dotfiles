return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "towolf/vim-helm", ft = "helm" },
		"b0o/schemastore.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		require("fidget").setup()
		require("mason").setup()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local cmp_lsp = require("cmp_nvim_lsp")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp_lsp.default_capabilities(capabilities)

		-- Set global defaults for all servers
		capabilities = vim.tbl_deep_extend(
			"force",
			capabilities,
			-- returns configured operations if setup() was already called
			-- or default operations if not
			require("lsp-file-operations").default_capabilities()
		)

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local border = {
			{ "🭽", "FloatBorder" },
			{ "▔", "FloatBorder" },
			{ "🭾", "FloatBorder" },
			{ "▕", "FloatBorder" },
			{ "🭿", "FloatBorder" },
			{ "▁", "FloatBorder" },
			{ "🭼", "FloatBorder" },
			{ "▏", "FloatBorder" },
		}

		-- LSP settings (for overriding per client)
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}

		vim.api.nvim_create_augroup("Monarch", { clear = true })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = "Monarch",
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				client.server_capabilities.semanticTokensProvider = nil

				local keymap = vim.keymap.set
				local opts = { buffer = ev.buf }

				keymap("n", "gd", vim.lsp.buf.definition, opts)
				keymap("n", "K", vim.lsp.buf.hover, opts)
				keymap({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, opts)
				keymap("n", "gi", vim.lsp.buf.implementation, opts)
				-- keymap("n", "gi", "<cmd> Trouble lsp_implementations toggle<cr>", opts)
				keymap("n", "gt", vim.lsp.buf.type_definition, opts)
				-- keymap("n", "gr", "<cmd>Trouble lsp_references toggle<cr>", opts)
				keymap("n", "grr", vim.lsp.buf.references, opts)
				keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap("n", "grn", vim.lsp.buf.rename, opts)
				keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
				keymap("n", "]d", vim.diagnostic.goto_next, opts)
				keymap("n", "[d", vim.diagnostic.goto_prev, opts)
				--[[
          name = "LSP",
            -- D = { ":lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
            D = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
            -- i = { ":lua vim.lsp.buf.implementation()<cr>", "Goto implementation" },
            i = { "<cmd>Lspsaga finder imp<cr>", "Goto implementation" },
            -- d = { ":lua vim.lsp.buf.definition()<cr>", "Goto definition" },
            d = { "<cmd>Lspsaga goto_definition<cr>", "Goto definition" },
            r = { "<cmd>Lspsaga finder ref<cr>", "List references" },
            t = { "<cmd>Lspsaga finder def+tyd<cr>", "Goto type definition" },
            a = { "<cmd>Lspsaga code_action<CR>", "Code action", mode = { "n", "v" } },
            n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next diagnostic" },
            p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous diagnostic" },
            R = { "<cmd>Lspsaga rename<CR>", "Rename" },
            -- k = { ":lua vim.lsp.buf.hover()<cr>", "Hover" },
            k = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
            ]]
			end,
		})

		vim.diagnostic.config({
			signs = { active = signs },
			virtual_text = true,
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		-- language server
		local servers = {
			"gopls",
			"golangci_lint_ls",
			"lua_ls",
			"jsonls",
			"yamlls",
			"terraformls",
			"tflint",
			"ts_ls",
			"clangd",
			"tailwindcss",
			"bashls",
			"volar",
			"helm_ls",
			"templ",
			"sqlls",
		}

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"goimports",
				"stylua",
				"eslint_d",
				"stylelint",
				"tflint",
				"codespell",
				"delve",
				"sqlfluff",
			},
		})

		mason_lspconfig.setup({ ensure_installed = servers, automatic_installation = false })
		mason_lspconfig.setup_handlers({
			function(server_name)
				local opts = {
					capabilities = capabilities,
					handlers = handlers,
				}
				local require_ok, server = pcall(require, "monarch.plugins.lsp_settings." .. server_name)
				if require_ok then
					opts = vim.tbl_deep_extend("force", server, opts)
				end
				lspconfig[server_name].setup(opts)
			end,
		})
	end,
}
