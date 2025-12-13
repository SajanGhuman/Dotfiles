local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.guicursor = "" -- shows thick cursor all the time

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
-- opt.wrap = false -- disable line wrapping
opt.wrap = true -- enable visual line wrapping
opt.linebreak = true -- wrap at word boundaries
opt.breakindent = true -- keep indentation on wrapped lines

-- move j/k by visual ones and not logical lines.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = false -- highlight the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shiftop

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
opt.updatetime = 50

-- scrolloff
opt.scrolloff = 8

-- Enable incremental search
opt.incsearch = true

-- Disable highlight search by default
opt.hlsearch = false

-- Show hints for Hardtime Plugin
opt.showmode = false

-- Define custom highlight group
vim.api.nvim_set_hl(0, "MyHighlight", { fg = "NONE", bg = "NONE" }) -- Your main highlight

-- Set popup menu and selected item hints to have no background or foreground
vim.api.nvim_set_hl(0, "Pmenu", { fg = "NONE", bg = "NONE" }) -- Popup menu background and foreground
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "NONE", bg = "NONE" }) -- Selected item in popup
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" }) -- Scrollbar background
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" }) -- Scrollbar thumb
