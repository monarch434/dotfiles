local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    print("unable to load gitsigns")
    return
end

gitsigns.setup({
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = " " },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
    },
})
