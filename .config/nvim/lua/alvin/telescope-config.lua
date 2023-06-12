local ok, telescope = pcall(require, "telescope")
if not ok then
    print(" unable to load telescope")
    return
end

local actions = require("telescope.actions")

local M = {}

M.project_files = function()
    local opts = {} -- define here if you want to define something
    vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
        require("telescope.builtin").git_files(opts)
    else
        require("telescope.builtin").find_files(opts)
    end
end

telescope.setup({
    defaults = {
        prompt_prefix = "ﰲ ",
        selection_caret = " ",
        path_display = { "smart" },
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-v>"] = actions.file_vsplit,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            file_ignore_patterns = { ".git/", "node_modules/", "vendor/", ".idea" },
        },
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                n = {
                    ["d"] = actions.delete_buffer,
                },
                i = {
                    ["<C-d>"] = actions.delete_buffer,
                },
            },
        },
    },
})

telescope.load_extension("fzf")
return M
