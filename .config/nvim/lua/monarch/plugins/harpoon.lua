return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
  config = function(_, opts)
    require("harpoon"):setup(opts)
  end,
  keys = {
    -- stylua: ignore start
    { "<leader>ha", function () require("harpoon"):list():add() end, desc = "Harpoon Add"},
    { "<leader>he", function () require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Add" },
    { "<leader>j", function () require("harpoon"):list():select(1) end, desc = "Harpoon Select 1" },
    { "<leader>k", function () require("harpoon"):list():select(2) end, desc = "Harpoon Select 2" },
    { "<leader>l", function () require("harpoon"):list():select(3) end, desc = "Harpoon Select 3" },
    { "<leader>;", function () require("harpoon"):list():select(4) end, desc = "Harpoon Select 4" },
    { "<C-S-P>", function () require("harpoon"):list():next() end, desc = "Harpoon Next" },
    { "<C-S-N>", function () require("harpoon"):list():prev() end, desc = "Harpoon Prev" },
    -- stylua: ignore end
  },
}
