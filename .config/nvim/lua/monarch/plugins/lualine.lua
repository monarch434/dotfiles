return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local icons = require("monarch.core.globals").icons
    require("mini.icons").mock_nvim_web_devicons()

    local opts = {
      options = {
        -- theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      winbar = {
        lualine_c = {
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return require("nvim-navic").is_available()
            end,
          },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
            draw_empty = true,
            separator = "",
          },
          { "filetype", icon_only = true, padding = { right = 0.5 } },
          { "filename", path = 1, newfile_status = true, padding = { left = 0 }, separator = "" }, -- TODO: Add better way to show filename or just go back to tmux
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "%=" },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date "%R"
          end,
        },
      },
    }

    return opts
  end,
}
