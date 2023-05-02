local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print("unable to load nvim-tree")
    return
end

local on_attach = function(bufnr)
    local keymap = vim.keymap.set
    local api = require("nvim-tree.api")
      local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

    api.config.mappings.default_on_attach(bufnr)


    keymap("n", "v", api.node.open.vertical, opts("Vsplit"))
    keymap("n", "l", api.node.open.edit, opts("Open"))
end

nvim_tree.setup({
    on_attach = on_attach,
    disable_netrw = true,
      modified = {
        enable = true,
    }
})
