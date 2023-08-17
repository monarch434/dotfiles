-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    print("Installing Lazy close and reopen Neovim...")
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

--  TODO: properly sort out plugins with keybindings, config, etc.
lazy.setup({
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

    "ThePrimeagen/vim-be-good", -- for practise
    "nvim-tree/nvim-web-devicons",

    -- THEMES --
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    "sainnhe/everforest",

    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- cmp plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lua", -- lua completions
    "hrsh7th/cmp-nvim-lsp", -- cmp for LSP

    -- snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP --
    "williamboman/mason.nvim", -- intergrates nvim-lspconfig & mason-lspconfig LSP plugin
    "williamboman/mason-lspconfig.nvim", -- LSP
    "neovim/nvim-lspconfig", -- LSP
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
    },
    "RRethy/vim-illuminate",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",

    "sebdah/vim-delve",
    "b0o/schemastore.nvim",
    "kevinhwang91/nvim-bqf",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "windwp/nvim-autopairs" },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    },

    { "lewis6991/gitsigns.nvim" },

    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",

    {
        "lewis6991/impatient.nvim",
        build = function()
            require("impatient").enable_profile()
        end,
    },
    -- debugger

    "mfussenegger/nvim-jdtls",
    "norcalli/nvim-colorizer.lua",
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    --NOTE possible git tools
    --- https://github.com/sindrets/diffview.nvim
    --- https://github.com/TimUntersberger/neogit
    --- https://github.com/kdheepak/lazygit.nvim
    --- https://github.com/tpope/vim-fugitive
    "tpope/vim-fugitive",

    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    "folke/which-key.nvim",

    { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    "christoomey/vim-tmux-navigator",

    -- TODO: fix terraform and hcl formatting
    "hashivim/vim-terraform",

    -- TODO: find a reason to use this instead of a normal LSP???
    -- use({ "fatih/vim-go" })

    "mbbill/undotree",

    "tpope/vim-surround",

    -- used for tmux-resurrect to restore saved sessions
    "tpope/vim-obsession",

    "lukas-reineke/indent-blankline.nvim",
})

-- TODO: Create annotations with one keybind
-- use({ "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" }) -- multilanguage annotations

-- SmiteshP/nvim-navic
-- https://github.com/arkav/lualine-lsp-progress
-- kevinhwang91/nvim-bqf
-- https://github.com/ggandor/leap.nvim

-- use ({"akinsho/bufferline.nvim", config = function ()
--     require("bufferline").setup()
-- end})
