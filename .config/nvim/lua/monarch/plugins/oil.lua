return {
  "stevearc/oil.nvim",
  tag = "v2.15.0",
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
  },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open paren directory" },
  },
}
