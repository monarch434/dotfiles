local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print("unable to load nvim-tree")
    return
end

-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
--     print("unable to load nvim-tree.config")
--   return
-- end

-- TODO view.mappings is being deprecated, change to use on_attach
nvim_tree.setup {
    -- on_attatch = function (bufnr)
    --     vim.keymap.set('n', "u", ":vsplit<cr>", {buffer = bufnr, normap = true} )
    -- end
    view = {
        mappings = {
            list = {
                { key = "v", action = "vsplit" },
                { key = "u", action =  "dir_up"},
                { key = "l", action = "edit" },
                { key = "h", action = "close_node" },
            },
        },
    }
}
