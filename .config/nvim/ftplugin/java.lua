local jdtls_status_ok, jdtls = pcall(require, "jdtls")
if not jdtls_status_ok then
    print("not working" .. jdtls)
    return
end

-- Setup Workspace
local workspace_path = vim.fn.stdpath("data") .. "/workspaces/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
-- local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
-- local equinox_verion = "1.6.400.v20210924-0641"
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }

-- Determine OS
if vim.fn.has("mac") == 1 then
    OS_NAME = "mac"
elseif vim.fn.has("unix") == 1 then
    OS_NAME = "linux"
elseif vim.fn.has("win32") == 1 then
    OS_NAME = "win"
else
    vim.notify("Unsupported OS", vim.log.levels.WARN, { title = "Jdtls" })
end

-- setup capabilities
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

-- Setup Testing and debugging
local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
    bundles,
    vim.split(
        vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
        "\n"
    )
)

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. jdtls_path .. "lombok.jar",
        "-jar",
        jdtls_path .. "plugins/org.eclipse.equinox.launcher_*.jar",
        "-configuration",
        jdtls_path .. "config_" .. OS_NAME,
        "-data",
        workspace_dir,
    },
    root_dir = jdtls.setup.find_root(root_markers),
    capabilities = require("alvin/lsp/handlers").capabilities,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "~/.sdkman/candidates/java/17.0.5-zulu",
                    },
                    {
                        name = "JavaSE-1.8",
                        path = "~/.sdkman/candidates/java/8.0.372-zulu",
                    },
                    {
                        name = "JavaSE-1.7",
                        path = "~/.sdkman/candidates/java/7.0.352-zulu",
                    },
                },
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all", -- literals, all, none
                },
            },
            format = {
                enable = false,
            },
        },
        signatureHelp = { enabled = true },
        extendedClientCapabilities = extendedClientCapabilities,
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
            },
            importOrder = {
                "java",
                "javax",
                "com",
                "org",
            },
        },
        contentProvider = { preferred = "fernflower" },
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
        },
    },

    flags = {
        allow_incremental_sync = true,
    },
    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = bundles,
    },
}

config["on_attach"] = function(client, bufnr)
    require("alvin/lsp/handlers").on_attach(client, bufnr)
    jdtls.setup.add_commands()
    require("lsp_signature").on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        floating_window_above_cur_line = false,
        padding = "",
        handler_opts = {
            border = "rounded",
        },
    }, bufnr)
    jdtls.dap.setup_dap_main_class_configs()
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.java" },
    callback = function()
        local _, _ = pcall(vim.lsp.codelens.refresh)
    end,
})

jdtls.start_or_attach(config)
