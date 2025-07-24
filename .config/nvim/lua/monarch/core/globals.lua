local M = {}

M.treesitter_ensure_installed = {
  -- lua
  "lua",
  "luadoc",
  "luap",
  "vim",
  "vimdoc",
  -- golang
  "go",
  "gomod",
  "gowork",
  "gosum",
  -- git
  "git_config",
  "gitcommit",
  "git_rebase",
  "gitignore",
  "gitattributes",
  -- web dev
  "html",
  "javascript",
  "typescript",
  "css",
  "vue",
  "jsdoc",
  -- python
  "rst",
  "ninja",
  "python",
  "jinja",
  "jinja_inline",
  -- docs
  "json",
  "json5",
  "jsonc",
  "toml",
  "xml",
  "yaml",
  "helm",
  -- SQL (Database)
  "sql",
  -- Other
  "bash",
  "c",
  "diff",
  "markdown",
  "markdown_inline",
  "query",
  "regex",
  "hcl",
  "terraform",
  "bash",
}

M.tools_ensure_installed = {
  -- Golang
  "goimports",
  "gofumpt",
  "gomodifytags",
  "impl",
  "gofumpt",
  "delve",
  -- Lua
  "stylua",
  "shfmt",
  -- yaml
  "gitlab_ci_ls",
  "yamlls",
  -- web dev
  "prettier",
  "prettierd",
  "eslint_d",
  "eslint-lsp",
  "vue_ls", -- 'volar' -> 'vue_ls'
  -- python
  "ruff", -- formatting
  "pylint", -- linting
  "jinja_lsp",
  -- sql
  "sqlfluff",
  -- spelling
  "cspell",
  -- terraform
  "tflint",
}

M.lsp_ensure_installed = {
  "gopls",
  "golangci_lint_ls",
  "lua_ls",
  "ts_ls",
  "pyright",
  "jsonls",
  "helm_ls",
}

M.icons = {
  diagnostics = {
    Error = "󰅚 ",
    Warn = "󰀪 ",
    Info = "󰋽 ",
    Hint = "󰌶 ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
  },
  dap = {
    Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = ".>",
  },
}

M.kinds = {
  Array = " ",
  Boolean = "󰨙 ",
  Class = " ",
  Codeium = "󰘦 ",
  Color = " ",
  Control = " ",
  Collapsed = " ",
  Constant = "󰏿 ",
  Constructor = " ",
  Copilot = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕 ",
  Interface = " ",
  Key = " ",
  Keyword = " ",
  Method = "󰊕 ",
  Module = " ",
  Namespace = "󰦮 ",
  Null = " ",
  Number = "󰎠 ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = "󱄽 ",
  String = " ",
  Struct = "󰆼 ",
  Supermaven = " ",
  TabNine = "󰏚 ",
  Text = " ",
  TypeParameter = " ",
  Unit = " ",
  Value = " ",
  Variable = "󰀫 ",
}

return M
