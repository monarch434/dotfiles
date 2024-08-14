local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move between tmux and neovim panes
keymap("n", "<C-h>", ":TmuxNavigateLeft<cr>")
keymap("n", "<C-j>", ":TmuxNavigateDown<cr>")
keymap("n", "<C-k>", ":TmuxNavigateUp<cr>")
keymap("n", "<C-l>", ":TmuxNavigateRight<cr>")

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
keymap("v", "K", ":m '<-3<CR>gv-gv")

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
vim.keymap.set('n', '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)')
