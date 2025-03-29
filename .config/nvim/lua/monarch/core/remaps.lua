local keymap = vim.keymap.set

-- move between tmux and neovim panes
-- keymap("n", "<C-h>", ":TmuxNavigateLeft<cr>")
-- keymap("n", "<C-j>", ":TmuxNavigateDown<cr>")
-- keymap("n", "<C-k>", ":TmuxNavigateUp<cr>")
-- keymap("n", "<C-l>", ":TmuxNavigateRight<cr>")
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", { silent = true })
keymap("n", "<Down>", ":resize -2<CR>", { silent = true })
keymap("n", "<Left>", ":vertical resize +4<CR>", { silent = true })
keymap("n", "<Right>", ":vertical resize -4<CR>", { silent = true })

-- move based on physical line. Helps with wrapped text
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Stay in Indent mode when indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move selected lines up/down
keymap("v", "J", ":m '>+1<CR>gv-gv")
keymap("v", "K", ":m '<-2<CR>gv-gv")

-- Move half screen up/down
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- when deleting in visual mode,
-- text is thrown away and not placed in paste registry
keymap("v", "p", [["_dP]])

-- yank to system clipboard
keymap({ "n", "v" }, "<C-y>", '"+y')
keymap({ "n", "v" }, "<C-y>y", '"+yy')

-- paste from system clipboard
keymap({ "n", "v" }, "<C-p>", '"+p')

-- Toggle Code Suggestions on/off with CTRL-g in normal mode:
keymap("n", "<C-g>", "<cmd> GitLabToggleCodeSuggestions <cr>")
