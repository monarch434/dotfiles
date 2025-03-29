return {
    "folke/todo-comments.nvim",
    config = true,
    opts = {
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--glob=!node_modules/**",
                "--glob=!dist/**",
                "--glob=!vendor/**",
            },
        },
    },
}
