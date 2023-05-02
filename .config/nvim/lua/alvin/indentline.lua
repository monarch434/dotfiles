local status_ok, indent_ln = pcall(require, "indent_blankline")
if not status_ok then
    print("unable to load indent_blankline")
    return
end

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

-- TODO: fix underline thickness to be flush with the context_char
indent_ln.setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    context_char ='┃',
}
