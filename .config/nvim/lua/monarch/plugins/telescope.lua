local ignorePattern = { ".git/", "node_modules/", "vendor/", ".idea", "dist/" }

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "fzf"
    require("telescope").load_extension "ui-select"
  end,
  opts = function()
    return {
      defaults = {
        prompt_prefix = "󰭎  ",
        selection_caret = " ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-s>"] = "select_vertical",
            ["<C-h>"] = "select_horizontal",
            ["<C-k>"] = "which_key",
          },
          n = {
            ["q"] = "close",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          previewer = false,
          theme = "dropdown",
          find_command = { "fd", "--hidden", "--no-ignore", "--type", "f", "--strip-cwd-prefix" },
          file_ignore_patterns = ignorePattern,
        },
        live_grep = {
          file_ignore_patterns = ignorePattern,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    }
  end,
  keys = {
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "find files" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "grep string" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "live grep" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "search keymaps" },
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "[S]earch [R]esume" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "search buffer" },
  },
}
