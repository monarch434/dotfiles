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
    "dap-float",
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
  group = augroup "gitlab_yamlls",
  pattern = "*.gitlab-ci*.{yml,yaml}",
  callback = function()
    vim.bo.filetype = "yaml.gitlab"
  end,
})

require("monarch.plugins.lsp.settings.on_attach").attach(function(_, buffer)
  if vim.bo[buffer].filetype == "helm" then
    vim.schedule(function()
      vim.cmd "LspStop ++force yamlls"
    end)
  end
end, "yamlls")

autocmd("User", {
  group = augroup "file_rename",
  pattern = "OilActionsPost",
  callback = function(event)
    if event.data.actions.type == "move" then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})

autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = augroup "lint",
  callback = function()
    require("lint").try_lint()
    require("lint").try_lint "cspell"
  end,
})

-- Rename tmux window based on open file
if vim.env.TMUX ~= nil then
  -- Define an autocommand for BufEnter and FocusGained events
  autocmd({ "BufEnter", "FocusGained" }, {
    pattern = "*",
    group = augroup "tmux_window_rename",
    callback = function()
      local current_file = vim.fn.expand "%:t"
      local tmux_command = string.format("tmux rename-window '%s'", current_file)
      vim.fn.system(tmux_command)
    end,
  })

  -- Define an autocommand for the VimLeave event
  autocmd("VimLeave", {
    pattern = "*",
    group = augroup "tmux_window_rename_leave",
    callback = function()
      local shell = vim.env.SHELL or "sh"
      vim.fn.system "tmux set-window-option automatic-rename on"
    end,
  })
end

-- decrease yank timout an highlight yanked text
-- autocmd("TextYankPost", {
--   group = augroup "yank",
--   callback = function()
--     vim.hl.on_yank {
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
