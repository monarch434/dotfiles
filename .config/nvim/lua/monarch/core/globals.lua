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
  -- docs
  "json",
  "json5",
  "jsonc",
  "toml",
  "xml",
  "yaml",
  --
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
  "sql",
}

M.tools_ensure_installed = {
  -- Golang
  "goimports",
  "gofumpt",
  "gomodifytags",
  "impl",
  "gofumpt",
  -- Lua
  "stylua",
  "shfmt",
  -- yaml
  "gitlab_ci_ls",
  "yamlls",
  -- web dev
  "prettier",
  "prettierd",
  -- python
  "black",
  "ruff",
}

M.lsp_ensure_installed = {
  "gopls",
  "golangci_lint_ls",
  "lua_ls",
  "ts_ls",
  "vtsls",
  "volar",
  "pyright",
  "jsonls",
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
