-- Then find the Volar plugin path manually:
local vue_language_server_path = vim.fn.expand "$MASON/packages" .. "/vue-language-server" .. "/node_modules/@vue/language-server"

return {
  init_options = {
    plugins = {
      {
        -- Name of the TypeScript plugin for Vue
        name = "@vue/typescript-plugin",

        -- Location of the Vue language server module (path defined in step 1)
        location = vue_language_server_path,

        -- Specify the languages the plugin applies to (in this case, Vue files)

        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
