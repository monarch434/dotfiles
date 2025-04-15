local ignorePattern = { ".git/", "node_modules/", "vendor/", ".idea", "dist/" }

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    lazygit = {
      enabled = true,
      theme = {
        -- NOTE: Added because of AlexvZyl/nordic.nvim theme, default couldn't be seen
        inactiveBorderColor = { fg = "WinBar" },
      },
    },
    statuscolumn = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    { "<leader>sf", function() Snacks.picker.smart { exclude = ignorePattern, hidden = true } end, desc = "Smart Find Files" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- { "<leader>sf", function() Snacks.picker.files { exclude = ignorePattern } end, desc = "Pick files" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols { layout = { preset = "sidebar", preview = false } } end, desc = "LSP Symbols" },
    -- stylua: ingore end
  },
}
