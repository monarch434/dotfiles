-- return {
--     "sainnhe/everforest",
--     priority = 1000,
--     config = function()
--         local status_ok, _ = pcall(vim.cmd, "colorscheme everforest")
--         if not status_ok then
--             vim.notify("everforest not found")
--             return
--         end
--
--         vim.g.everforest_background = "medium"
--         vim.g.everforest_dim_inactive_windows = 0
--         vim.g.everforest_ui_contrast = "high"
--         vim.g.everforest_current_word = "bold" -- default "grey background"
--     end,
-- }

-- return {
--     "shaunsingh/nord.nvim",
--     priority = 1000,
--     config = function()
--         local status_ok, nord = pcall(require, "nord")
--         if not status_ok then
--             vim.notify("nord not found")
--             return
--         end
--
--         vim.g.nord_contrast = true
--         vim.g.nord_borders = true
--         vim.g.nord_disable_background = false
--         vim.g.nord_italic = false
--         vim.g.nord_uniform_diff_background = true
--         vim.g.nord_bold = false
--         nord.set()
--     end,
-- }
--
return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("nord")
        vim.api.nvim_set_hl(0, "Visual", { bg = "#556077"})
    end,
}
