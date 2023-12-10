local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
    print("unable to load lspsaga")
    return
end

lspsaga.setup({
    -- code_action = {
    --     extend_gitsigns = false,
    -- },
    -- disabled because it gives errors and doesn't even display
    lightbulb = {
        enable = true,
        virtual_text = false,
    },
    finder = {
        keys = {
            shuttle = "<C-n>",
            vsplit = 'v',
            split = 'h'
        }
    }
})
