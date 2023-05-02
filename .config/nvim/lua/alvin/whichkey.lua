local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    print("unable to load which-key")
    return
end

wk.setup({
    presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
    },
    key_labels = {
        ["<tab>"] = "TAB",
        ["<leader>"] = "SPC",
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
})

local n_opts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

-- TODO:Move this to telescopde-config.lua
local function project_files()
  local opts = {} -- define here if you want to define something

  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require"telescope.builtin".git_files(opts)
  else
    require"telescope.builtin".find_files(opts)
  end
end


local n_mappings = {
    f = {
        name = "Telescope",
        f = { project_files, "Find files" },
        g = { "<cmd> Telescope live_grep<CR>", "Live grep" },
        b = { "<cmd> Telescope buffers<CR>", "List buffers" },
        h = { "<cmd> Telescope help_tags<CR>", "Help" },
    },

    h = {
        name = "Gitsigns",
        s = { "<cmd> Gitsigns preview_hunk<CR>", "Preview Hunk" },
        n = { "<cmd> Gitsigns next_hunk<CR>", "Next Hunk" },
        p = { "<cmd> Gitsigns prev_hunk<CR>", "Previous Hunk" },
        b = { "<cmd> Gitsigns toggle_current_line_blame<CR>", "Current line blame" },
        S = { "<cmd> Gitsigns stage_buffer<CR>", "Stage current file" },
        U = { "<cmd> Gitsigns reset_buffer_index<CR>", "Unstage current file" },
    },
}

wk.register(n_mappings, n_opts)
