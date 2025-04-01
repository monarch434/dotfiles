local M = {}

M.treesitter_ensure_installed = {
  -- lua
  "lua",
  "luadoc",
  "luap",
  -- Golang
  "go",
  "gomod",
  "gowork",
  "gosum",
  -- Git
  "git_config",
  "gitcommit",
  "git_rebase",
  "gitignore",
  "gitattributes",
  --
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "toml",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
  "hcl",
  "css",
  "vue",
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
  --
  "gitlab_ci_ls",
  "yamlls",
}

M.lsp_ensure_installed = {
  "gopls",
  "golangci_lint_ls",
  "lua_ls",
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
