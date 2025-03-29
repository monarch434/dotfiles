return {
    "stevearc/conform.nvim",
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            vue = { "prettierd" },
            css = { "prettierd" },
            hcl = { "terragrunt_hclfmt" },
            go = { "goimports", "gofumpt", "cspell" },
            sql = { "sqlfluff" },
            -- css = { "stylelint" },
            ["*"] = { "codespell" },
        },
        formatters = {
            stylua = { prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" } },
        },
    },
    -- TODO: why do I need this??
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
