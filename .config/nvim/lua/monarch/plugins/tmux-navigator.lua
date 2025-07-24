return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-leader><c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-leader><c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-leader><c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-leader><c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-leader><c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
