return {
    "RRethy/vim-illuminate",
    config = function()
        local ill = require("illuminate")
        vim.keymap.set("n", "]r", function()
            ill.goto_next_reference()
        end, { desc = "GoTo next lsp reference" })
        vim.keymap.set("n", "[r", function()
            ill.goto_prev_reference()
        end, { desc = "GoTo prev lsp reference" })
    end,
}
