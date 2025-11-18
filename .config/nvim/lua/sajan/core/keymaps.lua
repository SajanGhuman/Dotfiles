-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

---------------------
-- Remap j to move down and center cursor
vim.api.nvim_set_keymap("n", "j", "jzz", { noremap = true, silent = true })

-- Remap k to move up and center cursor
vim.api.nvim_set_keymap("n", "k", "kzz", { noremap = true, silent = true })

-- Center everything
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", "<C-f>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<C-b>zz", { noremap = true, silent = true })

-- Move selected Text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor at start of line when using "J"
keymap.set("n", "J", "mzJ`z")

-- Keep search terms in center
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Keep the copy text in the registar.
keymap.set("x", "p", '"_dP')

-- y for yanking in vim and <leader>y for yanking in system clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank selected text or line to system clipboard
-- vim.keymap.set({ "n", "v" }, "d", "\"_d")          -- Delete selected text or line without yanking

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Toggle highlight search with Ctrl-e
vim.api.nvim_set_keymap("n", "<C-e>", ":set hlsearch!<CR>", { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- disable recording
keymap.set("n", "q", "<nop>")

-- Search the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.opt.winborder = 'rounded'
