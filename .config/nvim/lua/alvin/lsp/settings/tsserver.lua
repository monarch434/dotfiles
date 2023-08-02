return {
    handlers = {
        -- usually gets called after a code action
        -- like in moving an anonymous function to outer scope
        ["_typescript.rename"] = function(_, result, params)
            local line = result.position.line
            local character = result.position.character
            -- see commit msg to find resources to learn about these fns
            local column = vim.str_byteindex(vim.fn.getline("."), character, true)
            vim.api.nvim_win_set_cursor(0, { line + 1, column })
            vim.lsp.buf.rename()
            return result
        end,
    },
}
