local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("unable to load treesitter")
    return
end

treesitter.setup {
    ensure_installed = "all",
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    autopairs = {
        enable = true
    },
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "" }, -- list of language that will be disabled
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = true,
    }
}
