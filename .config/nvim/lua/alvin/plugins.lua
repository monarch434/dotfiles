-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
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
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
    "tpope/vim-fugitive", -- Git in neovim

    "ThePrimeagen/vim-be-good", -- for practise

    -- THEMES --
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    "sainnhe/everforest",
    "nvim-tree/nvim-web-devicons", -- Fancy icons

    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp", -- The completion plugin
        dependencies = {
            { "L3MON4D3/LuaSnip", version = "v2.*"}, --snippet engine
            "saadparwaiz1/cmp_luasnip", -- snippet completions
            "rafamadriz/friendly-snippets", -- a bunch of snippets to use
            "hrsh7th/cmp-nvim-lsp", -- cmp for LSP
            "hrsh7th/cmp-path", -- path completions
        },
    },

    -- LSP --
    {
        "neovim/nvim-lspconfig", -- LSP
        dependencies = {
            "williamboman/mason.nvim", -- intergrates nvim-lspconfig & mason-lspconfig LSP plugin
            "williamboman/mason-lspconfig.nvim", -- LSP
            { "j-hui/fidget.nvim", tag = "v1.4.0", opts = {} }, -- Useful status updates for LSP
            "folke/neodev.nvim", -- signature help for development
        },
    },
    "nvimdev/lspsaga.nvim", -- better LSP

    "b0o/schemastore.nvim", -- json & yaml schemastores for LSP
    "kevinhwang91/nvim-bqf", -- better quickfix list

    "RRethy/vim-illuminate",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",

    "lewis6991/gitsigns.nvim",

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

    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "norcalli/nvim-colorizer.lua", -- CSS colors

    -- debugger
    "mfussenegger/nvim-jdtls",
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

    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    "folke/which-key.nvim",

    { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    "christoomey/vim-tmux-navigator",

    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-surround",
    "tpope/vim-obsession", -- used for tmux-resurrect to restore saved sessions
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
})

-- https://github.com/stevearc/conform.nvim # possible replacemnet for null-ls
-- https://github.com/danymat/neogen    # used to generate annotations
-- https://github.com/nvim-neotest/neotest  # used to interact with tests within neovim
-- SmiteshP/nvim-navic
-- https://github.com/arkav/lualine-lsp-progress
-- kevinhwang91/nvim-bqf
-- https://github.com/ggandor/leap.nvim

-- use ({"akinsho/bufferline.nvim", config = function ()
--     require("bufferline").setup()
-- end})
