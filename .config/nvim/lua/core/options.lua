local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menu", "menuone", "noselect" },
	cursorline = true, -- highlight the current line
	conceallevel = 0, -- so that `` is visible in markdown files
	expandtab = true, -- convert tabs to spaces
	fileencoding = "utf-8", -- the encoding written to a file
	foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
	foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	hidden = true, -- required to keep multiple buffers and open multiple buffers
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	laststatus = 0,
	mouse = "a", -- allow the mouse to be used in neovim
	number = true, -- set numbered lines
	numberwidth = 2, -- set number column width to 2 {default 4}
	pumheight = 10, -- pop up menu height
	ruler = false,
	relativenumber = false,
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.
	showcmd = false,
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	smartcase = true, -- smart case
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	title = true, -- set the title of window to the value of the titlestring
	undofile = true, -- enable persistent undo
	updatetime = 100, -- faster completion
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	tabstop = 2, -- insert 2 spaces for a tab
	wrap = false, -- display lines as one long line
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
