local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Initialise packer plugin manager
packer.init({
	-- opt_default = true, -- Default to using opt (as opposed to start) plugins
	display = {
		working_sym = "⚙️", -- The symbol for a plugin being installed/updated
		error_sym = "💥", -- The symbol for a plugin with an error in installation/updating
		done_sym = "🎉", -- The symbol for a plugin which has completed installation/updating
		removed_sym = "🔥", -- The symbol for an unused plugin which was removed
		moved_sym = "🛸", -- The symbol for a plugin which was moved (e.g. from opt to start)
		open_fn = function()
			return require("packer.util").float({ border = "rounded" }) -- An optional function to open a window for packer's display
		end,
	},
})

--  TODO: properly sort out plugins with keybindings, config, etc.
packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- packer can manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	use("ThePrimeagen/vim-be-good") -- for practise
	use("kyazdani42/nvim-web-devicons")

	-- THEMES --
	use({ "folke/tokyonight.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lua") -- lua completions
	use("hrsh7th/cmp-nvim-lsp") -- cmp for LSP

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP --
	use("williamboman/mason.nvim") -- intergrates nvim-lspconfig & mason-lspconfig LSP plugin
	use("williamboman/mason-lspconfig.nvim") -- LSP
	use("neovim/nvim-lspconfig") -- LSP
	use("RRethy/vim-illuminate")
	use("jose-elias-alvarez/null-ls.nvim")
	-- use("jayp0521/mason-null-ls.nvim")

	use("b0o/schemastore.nvim")

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "windwp/nvim-autopairs" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})

	use({ "lewis6991/gitsigns.nvim" })

	use({
		"lewis6991/impatient.nvim",
		run = function()
			require("impatient").enable_profile()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" }) -- multilanguage annotations
	use("folke/todo-comments.nvim") -- todo comments

	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	-- folke/trouble.nvim
	-- SmiteshP/nvim-navic
	-- folke/which-key.nvim
	-- https://github.com/arkav/lualine-lsp-progress

    -- use ({"akinsho/bufferline.nvim", config = function ()
    --     require("bufferline").setup()
    -- end})
	-- mbbill/undotree
	-- glepnir/lspsaga.nvim
    -- lukas-reineke/indent-blankline.nvim

	-- TODO: temporary solution
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	-- Automatically setup packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
