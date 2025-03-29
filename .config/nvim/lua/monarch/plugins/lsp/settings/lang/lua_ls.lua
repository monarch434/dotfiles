return {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },

      runtime = {
        version = "LuaJIT",
      },
      doc = {
        privateName = { "^_" },
      },
      format = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          "vim",
          "require",
        },
      },
    },
  },
}
