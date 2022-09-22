local options = {
	hlsearch = true, -- highlight all matches on previous search pattern
	cursorline = true, -- highlight the current line
	syntax = "on", -- syntax highlight according to the filetype
	number = true, -- turn on line numbers
	relativenumber = true, -- change the current line number relative to the cursor
	expandtab = true, -- use appropriate number of spaces to insert a <Tab>
	autoindent = true, -- new line inherit the indentation of previous lines
	smartindent = true, -- make indenting smarter again
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 4 spaces for a tab
	softtabstop = 4, -- add spaces that feels like tabs
	ignorecase = true, -- ignore case in search patterns
	smartcase = true, -- automatically switch search to case-sensitive when search query contains an uppercase letter
	incsearch = true, -- incremental search that shows partial matches
	fileencoding = "utf-8", -- the encoding written to a file
	linebreak = true, -- avoid wrapping a line in the middle of a word
	scrolloff = 20, -- the number of lines the screen columns to keep above and below the cursor
	sidescrolloff = 8, -- the number of lines the screen columns to keep left and right the cursor
	termguicolors = true, -- set term gui colors (most terminals support this)
	wrap = false, -- line wrap
	-- mouse = "a",                    			-- allow the mouse to be used in neovim
	splitright = true, -- force all vertical splits to go to the right of current window
	splitbelow = true, -- force all horizontal splits to go below current window
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	-- clipboard = "unnamedplus",      			-- allows neovim to access the system clipboard
	laststatus = 2, -- always display the status bar
	confirm = true, -- display confirmation dialog when closing an unsaved file
	history = 1000, -- increase the undo limit
	swapfile = false, -- disable swap files
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	pumheight = 10, -- pop up menu height
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	undofile = true, -- enble persistant undo
	guifont = "monospace:h17", -- set font for graphical nvim applications
	-- TODO find a nice way to display spell checking
	spell = false, -- enable spellcheking
	updatetime = 50, -- used for cursorhold autocommand event
}

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.shortmess:append("c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

for k, v in pairs(options) do
	vim.opt[k] = v
end
