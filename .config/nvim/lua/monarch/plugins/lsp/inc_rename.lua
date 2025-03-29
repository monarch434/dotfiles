return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  init = function()
    vim.opt.inccommand = "split"
    vim.opt.cmdwinheight = 20
  end,
  opts = {},
  keys = {
    {
      "<leader>rn",
      function()
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      desc = "[R]e[n]ame",
      expr = true,
    },
    -- map("<leader>rn", function()
    --   local inc_rename = require "inc_rename"
    --   return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand "<cword>"
    -- end, "[R]e[n]ame")
  },
}
