-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable <Space> default behavior (used as leader)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Common options
local opts = { noremap = true, silent = true }

-- Cursor movement (keep centered) 
vim.keymap.set("n", "j", "jzz", opts) 
vim.keymap.set("n", "k", "kzz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-f>", "<C-f>zz", opts)
vim.keymap.set("n", "<C-b>", "<C-b>zz", opts)

-- Move selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor position
vim.keymap.set("n", "J", "mzJ`z", opts)

-- Search behavior
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Toggle search highlight
vim.keymap.set("n", "<C-e>", ":set hlsearch!<CR>", opts)

-- Clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", {
  desc = "Clear search highlights",
  silent = true,
})

-- Registers & clipboard behavior
-- Paste without overwriting yank register
vim.keymap.set("x", "p", '"_dP', opts)

-- Delete without yanking
vim.keymap.set("n", "x", '"_x', opts)

-- Disable macro recording
vim.keymap.set("n", "q", "<Nop>", opts)

-- Search & replace word under cursor
-- vim.keymap.set(
--   "n",
--   "<leader>s",
--   [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--   { silent = true }
-- )

-- Make current file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
-- vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
-- vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
-- vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
-- vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
