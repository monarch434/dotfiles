return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      format = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          "vim",
          "require",
        },
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
      doc = {
        privateName = { "^_" },
      },
      workspace = {
        checkThirdParty = false,
      },
      codeLens = {
        enable = true,
      },
    },
  },
}
