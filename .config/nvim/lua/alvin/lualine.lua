local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("unable to load lualine")
    return
end

local diff = {
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },
}

local filename = {
    "filename",
    path = 1,
    newfile_status = true,
}

lualine.setup({
    options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
        globalstatus = true,
        theme = "everforest",
    },
    disabled_filetypes = {
        "lspinfo",
        "mason",
        "startuptime",
        "checkhealth",
        "help",
        "TelescopePrompt",
    },
    always_divide_middle = true,
    sections = {
        lualine_b = { "branch", diff, "diagnostics" },
        lualine_c = { { "%=", separator = "" }, filename },
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = { "progress", "location" },
    },
})
