return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    dependencies = {
        "windwp/nvim-ts-autotag",
        { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = "nvim-treesitter/nvim-treesitter" },
    },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "go",
                "javascript",
                "typescript",
                "html",
                "vue",
                "css",
                "terraform",
                "hcl",
                "markdown_inline",
                "tmux",
                "yaml",
                "json",
                "markdown",
                "jsdoc",
                "bash",
                "templ",
                "sql",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            textobjects = {
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
            },
        })
    end,
}
