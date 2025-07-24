return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "folke/lazydev.nvim",
    "kristijanhusak/vim-dadbod-completion",
    {
      "echasnovski/mini.icons",
      version = "*",
      config = function()
        require("mini.icons").setup()
      end,
    },
  },
  version = "1.*",
  opts = {
    signature = {
      enabled = true,
      trigger = {
        show_on_insert = false,
      },
      window = { show_documentation = true, border = "rounded" },
    },
    keymap = { preset = "default" },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        draw = {
          padding = { 5, 5 }, -- padding only on right side
          components = {
            kind_icon = {
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
      kind_icons = _G.monarch.kinds,
    },
    sources = {
      default = { "lazydev", "lsp", "dadbod", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- show at a higher priority than lsp
        },
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
