return {
    "mbbill/undotree",
    keys = {
        { "<C-b>", vim.cmd.UndotreeToggle, desc = "Toggle undo tree" },
    },
    config = function()
        vim.g.undotree_WindowLayout = 2
    end,
}
