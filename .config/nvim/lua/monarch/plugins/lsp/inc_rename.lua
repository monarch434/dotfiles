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
      "<leader>grn",
      function()
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      desc = "[R]e[n]ame",
      expr = true,
    },
  },
}
