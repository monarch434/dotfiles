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
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local n_mappings = {
    ["<leader>"] = {
        s = {
            name = "Telescope",
            ["f"] = { "<cmd> Telescope find_files<CR>", "[S]earch [F]iles" },
            ["cw"] = { "<cmd> Telescope grep_string<CR>", "[S]earch [C]urrent [W]ord" },
            ["r"] = { "<cmd> Telescope resume<CR>", "[S]earch [R]resume" },
            ["h"] = { "<cmd> Telescope help_tags<CR>", "[S]earch [H]elp" },
            ["b"] = { "<cmd> Telescope buffers<CR>", "[S]earch [B]uffers" },
            ["w"] = { "<cmd> Telescope live_grep<CR>", "[S]earch [W]ord" },
        },
        ["/"] = { "<cmd> Telescope current_buffer_fuzzy_find<CR>", "[/] Fuzzily search in current buffer" },
        g = {
            name = "Git",
            s = { "<cmd> Gitsigns preview_hunk<CR>", "Preview Hunk" },
            n = {
                function()
                    vim.schedule(function()
                        require("gitsigns").next_hunk()
                    end)
                    return "<Ignore>"
                end,
                "Next Hunk",
            },

            p = {
                function()
                    vim.schedule(function()
                        require("gitsigns").prev_hunk()
                    end)
                    return "<Ignore>"
                end,
                "Previous Hunk",
            },
            b = { "<cmd> Gitsigns toggle_current_line_blame<CR>", "Current line blame" },
            S = { "<cmd> Gitsigns stage_buffer<CR>", "Stage current file" },
            U = { "<cmd> Gitsigns reset_buffer_index<CR>", "Unstage current file" },
            r = { "<cmd> Gitsigns reset_hunk<CR>", "Reset Hunk" },
            g = { vim.cmd.Git, "Git" },
            d = { "<cmd> Gvdiffsplit!<CR>", "Git diff" },
        },
        t = {
            name = "Trouble",
            t = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
            w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Trouble Workespace" },
            d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Trouble Workespace" },
            r = { "<cmd>TroubleToggle lsp_references<CR>", "Trouble Lsp_references" },
        },
        h = {
            name = "Harpoon",
            a = { "<cmd> lua require('harpoon.mark').add_file()<CR>", "Harpoon Add" },
            t = { "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon Toggle" },
        },
        u = { "<cmd> lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon nav 1" },
        i = { "<cmd> lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon nav 2" },
        o = { "<cmd> lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon nav 3" },
        p = { "<cmd> lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon nav 4" },
    },
    g = {
        u = { "<cmd>diffget //2<CR>", "Get //2" },
        h = { "<cmd>diffget //3<CR>", "Get //3" },
    },
}

wk.register(n_mappings, n_opts)
