local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("monarch_" .. name, { clear = true })
end

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "Diffview*",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        if string.match(vim.bo.filetype, "Diffview*") then
          vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>DiffviewClose<cr>", { noremap = true, silent = true })
        else
          vim.cmd "close"
          pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
        end
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup "gitl_yamlls",
  pattern = "*.gitlab-ci*.{yml,yaml}",
  callback = function()
    vim.bo.filetype = "yaml.gitlab"
  end,
})

-- autocmd({ "FileType" }, {
--   group = augroup "close_diffview_",
--   pattern = "Diffview*",
--   callback = function()
--     vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>DiffviewClose<cr>", { noremap = true, silent = true })
--   end,
-- })

-- decrease yank timout an highlight yanked text
-- autocmd("TextYankPost", {
--   group = augroup "yank",
--   callback = function()
--     (vim.hl or vim.highlight).on_yank {
--       timeout = 40,
--     }
--   end,
-- })

-- json file indent
-- autocmd("FileType", {
--     group = augroup("jsonIndent"),
--     pattern = { "json" },
--     callback = function()
--         vim.opt.tabstop = 2
--         vim.opt.shiftwidth = 2
--     end,
-- })
