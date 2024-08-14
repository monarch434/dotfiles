return {
    "ThePrimeagen/harpoon",
    config = true,
    opts = {
        excluded_filetypes = { "harpoon", "oil" },
    },
    keys = {
        {
            "<leader>ht",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            desc = "Harpoon Toggle",
        },
        {
            "<leader>ha",
            function()
                require("harpoon.mark").add_file()
            end,
            desc = "Harpoon Add",
        },
        {
            "<leader>u",
            function()
                require("harpoon.ui").nav_file(1)
            end,
            desc = "Harpoon nav 1",
        },
        {
            "<leader>i",
            function()
                require("harpoon.ui").nav_file(2)
            end,
            desc = "Harpoon nav 2",
        },
        {
            "<leader>o",
            function()
                require("harpoon.ui").nav_file(3)
            end,
            desc = "Harpoon nav 3",
        },
        {
            "<leader>p",
            function()
                require("harpoon.ui").nav_file(4)
            end,
            desc = "Harpoon nav 4",
        },
    },
}
