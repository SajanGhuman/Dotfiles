-- Neovim Options
local opt = vim.opt -- shorthand for setting options

-- Line Numbers & Cursor
opt.number = true -- show absolute line number on cursor line
opt.relativenumber = true -- show relative line numbers
opt.cursorline = false -- highlight the current line
-- opt.guicursor = ""            -- always use block cursor

-- Wrap
vim.o.wrap = false -- Display lines as one long line (default: true)
vim.o.linebreak = false

-- Input & Clipboard
opt.mouse = "a" -- enable mouse support
opt.clipboard = "unnamedplus" -- use system clipboard

-- Indentation & Tabs
opt.autoindent = true -- copy indent from current line
opt.smartindent = true -- smarter auto-indenting
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- number of spaces for indentation
opt.tabstop = 4 -- number of spaces a tab counts for
opt.softtabstop = 4 -- spaces inserted for <Tab>

-- Searching
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- override ignorecase if search has capitals
opt.incsearch = true -- show matches while typing
opt.hlsearch = false -- do not highlight all search results

-- Appearance
opt.termguicolors = true -- enable true colors
opt.background = "dark" -- force dark background
opt.signcolumn = "yes" -- always show sign column
vim.o.showmode = false -- hide mode indicator (e.g. -- INSERT --)

-- Window Splitting
opt.splitright = true -- vertical splits open to the right
opt.splitbelow = true -- horizontal splits open below

-- Scrolling
opt.scrolloff = 4 -- keep 8 lines visible above/below cursor

-- Files & Undo
vim.o.swapfile = false -- disable swap files
vim.o.undofile = true -- enable persistent undo
vim.o.fileencoding = "utf-8" -- set file encoding
vim.o.cmdheight = 1 -- command line height
