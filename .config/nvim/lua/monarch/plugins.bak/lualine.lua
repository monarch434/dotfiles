return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    {
                        "filename",
                        path = 1,
                        newfile_status = true,
                    },
                },
                lualine_c = {},
                lualine_x = { "" },
                lualine_y = { "filetype" },
                lualine_z = {},
            },
        })
    end,
}
