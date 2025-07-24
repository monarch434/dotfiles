return {
  "MagicDuck/grug-far.nvim",
  opts = { headerMaxWidth = 80 },
  -- opts = {},
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sre",
      function()
        local grug = require "grug-far"
        local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
        grug.open {
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        }
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
    {
      "<leader>sr",
      function()
        require("grug-far").open { prefills = { paths = vim.fn.expand "%" } }
      end,
      mode = { "n", "v" },
      desc = "Search and Replace current buffer",
    },
    -- {
    --   "<leader>srs",
    --   function()
    --     require("grug-far").with_visual_selection { prefills = { paths = vim.fn.expand "%" } }
    --   end,
    --   mode = { "n", "v" },
    --   desc = "[S]earch and [R]eplace with [S]election in current buffer",
    -- },
  },
}
