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
        },
    },
}
