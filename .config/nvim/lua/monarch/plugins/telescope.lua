return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                prompt_prefix = "󰭎  ",
                selection_caret = " ",
                path_display = { "smart" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    previewer = false,
                    theme = "dropdown",
                    file_ignore_patterns = { ".git/", "node_modules/", "vendor/", ".idea" },
                },
                live_grep = {
                    file_ignore_patterns = { ".git/", "node_modules/", "vendor/", ".idea" },
                },
            },
        })

        telescope.load_extension("fzf")

        local builtin = require("telescope.builtin")
        local keymap = vim.keymap.set

        keymap("n", "<leader>sf", builtin.find_files)
        keymap("n", "<leader>cw", builtin.grep_string)
        keymap("n", "<leader>sh", builtin.help_tags)
        keymap("n", "<leader>sw", builtin.live_grep)
        keymap("n", "<leader>/", builtin.current_buffer_fuzzy_find)
    end,
}
