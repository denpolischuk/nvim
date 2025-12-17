-- Set Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true })


-- tabs
vim.keymap.set({ "n", }, "[t", ":tabprevious<CR>")
vim.keymap.set({ "n", }, "]t", ":tabnext<CR>")

-- buffers
vim.keymap.set({ "n", }, "H", ":bprevious<CR>")
vim.keymap.set({ "n", }, "L", ":bnext<CR>")

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

