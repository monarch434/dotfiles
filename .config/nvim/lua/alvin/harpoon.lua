local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
    print("unable to load harpoon")
    return
end

harpoon.setup({
    -- TODO: fix not exluding oil buffers
    excluded_filetypes = { "harpoon", "oil" },
})

