return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = function(_, opts)
        local nls = require "null-ls"
        opts.sources = vim.list_extend(opts.sources or {}, {
            -- Golang
            nls.builtins.code_actions.gomodifytags,
            nls.builtins.code_actions.impl,
            nls.builtins.formatting.goimports,
            nls.builtins.formatting.gofumpt,
            -- Lua
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.shfmt,
            --
        })
    end,
}
