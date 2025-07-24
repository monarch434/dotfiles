return {
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- TODO: Use main once it becomes the default branch
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" }, -- TODO: Use main once it becomes the default branch
    },
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    build = ":TSUpdate",
    config = function()
      local configs = require "nvim-treesitter.configs"
      ---@diagnostic disable-next-line: missing-fields
      configs.setup {
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = false,
        sync_install = false,
        ensure_installed = _G.monarch.treesitter_ensure_installed,
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          },
        },
      }
    end,
  },
}
