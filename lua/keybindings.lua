-- Set Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Optional: prevent Space from doing anything in normal mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })


-- tabs
vim.keymap.set({ "n", }, "[t", ":tabprevious<CR>")
vim.keymap.set({ "n", }, "]t", ":tabnext<CR>")

-- windows
vim.keymap.set({ "n", }, "|", ":vsplit<CR>")
vim.keymap.set({ "n", }, "_", ":split<CR>")
vim.keymap.set({ "n", }, "<C-j>", ":wincmd j<CR>")
vim.keymap.set({ "n", }, "<C-k>", ":wincmd k<CR>")
vim.keymap.set({ "n", }, "<C-h>", ":wincmd h<CR>")
vim.keymap.set({ "n", }, "<C-l>", ":wincmd l<CR>")

vim.keymap.set({ "n", }, "<C-left>", ":wincmd <<CR>")
vim.keymap.set({ "n", }, "<C-right>", ":wincmd ><CR>")
vim.keymap.set({ "n", }, "<C-up>", ":wincmd +<CR>")
vim.keymap.set({ "n", }, "<C-down>", ":wincmd -<CR>")

