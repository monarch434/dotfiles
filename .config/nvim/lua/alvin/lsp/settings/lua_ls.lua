return {
    settings = {
        Lua = {
            format = {
                enable = false,
            },
            telemetry = {
                enable = false,
            },
            completion = {
                callSnippet = "Replace",
            },
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
                "vim",
                "require",
            },
        },
    },
}
