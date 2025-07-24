local ignorePattern = { ".git/", "node_modules/", "vendor/", ".idea", "dist/" }
local verticalLayout = { preset = "vertical" }

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    rename = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = true },
    notify = { enabled = true },
    notifier = { enabled = true, style = "fancy" },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<C-s>"] = { "edit_vsplit", mode = { "i", "n" } },
            ["<C-h>"] = { "edit_split", mode = { "i", "n" } },
          },
        },
      },
    },
    lazygit = {
      enabled = true,
      theme = {
        -- NOTE: Added because of AlexvZyl/nordic.nvim theme, default couldn't be seen
        -- inactiveBorderColor = { fg = "WinBar" },
      },
    },
    statuscolumn = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    -- SEARCH --
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>sf", function() Snacks.picker.files { exclude = ignorePattern, hidden = true } end, desc = "Pick files" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    -- GREP --
    { "<leader>sg", function() Snacks.picker.grep({ exclude = ignorePattern, hidden = true, layout = verticalLayout }) end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Search Current Buffer" },
    ------------
    -- LSP --
    { "gr", function() Snacks.picker.lsp_references({ layout = verticalLayout }) end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gd", function() Snacks.picker.lsp_definitions({ exclude = ignorePattern }) end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols { layout = { preset = "sidebar", preview = false } } end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols({ exclude = ignorePattern }) end, desc = "LSP Workspace Symbols" },
    { "<leader>wd", function () Snacks.picker.diagnostics() end, desc = "LSP Workspace diagnostics" },
    { "<leader>bd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    -- TODO --
    { "<leader>st", function () Snacks.picker.todo_comments { exclude = ignorePattern } end, desc = "Search TODO" },
    -- stylua: ingore end
  },
}
