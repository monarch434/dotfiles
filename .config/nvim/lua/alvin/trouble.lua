local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

-- FIX: these mappings don't work
telescope.setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
        auto_preview = false, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = true,
    },
})
