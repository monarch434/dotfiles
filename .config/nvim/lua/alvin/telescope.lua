local ok, telescope = pcall(require, "telescope")
if not ok then
    print(" unable to load telescope")
    return
end

-- local actions = require "telescope.actions"

telescope.setup {
    defualts = {
        prompt_prefix = "helllllll ",
        selection_caret = " ",
        path_display = { "smart" },
        -- mappings = {
        --     i = {
        --         ["<C-n>"] = actions.cycle_history_next,
        --         ["<C-p>"] = actions.cycle_history_prev,
        --
        --         ["<C-j>"] = actions.move_selection_next,
        --         ["<C-k>"] = actions.move_selection_previous
        --     }
        -- }
    }
}

telescope.load_extension("fzf")
