-- Then find the Volar plugin path manually:
local vue_ls_share = vim.fn.expand "$MASON/share/vue-language-server"
local vue_plugin_path = vue_ls_share .. "/node_modules/@vue/language-server"

return {
  init_options = {
    plugins = {
      {
        -- Name of the TypeScript plugin for Vue
        name = "@vue/typescript-plugin",

        -- Location of the Vue language server module (path defined in step 1)
        location = vue_plugin_path,

        -- Specify the languages the plugin applies to (in this case, Vue files)
        languages = { "vue" },
      },
    },
  },
}
