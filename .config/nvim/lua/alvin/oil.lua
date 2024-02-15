local ok, oil = pcall(require, "oil")
if not ok then
    print("unable to load oil")
    return
end

oil.setup({
    float = {
        padding = 5,
        max_width = 70,
        max_height = 30,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    },
    delete_to_trash = true,
    cleanup_delay_ms = 500,
})

vim.keymap.set("n", "-", oil.open_float, { desc = "Open parent directory" })
