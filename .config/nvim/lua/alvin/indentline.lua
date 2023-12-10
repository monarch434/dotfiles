local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
    print("unable to load indent_blankline")
    return
end

-- TODO: fix underline thickness to be flush with the context_char
ibl.setup({
    scope = {
        show_start = false
    },
    -- use_treesitter_scope = true,
    -- opts = {
    --   char = '┊',
    --   show_trailing_blankline_indent = false,
    -- },
})
