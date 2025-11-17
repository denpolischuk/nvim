-- Set Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Optional: prevent Space from doing anything in normal mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })


-- tabs
vim.keymap.set({ "n", }, "[t", ":tabprevious<CR>")
vim.keymap.set({ "n", }, "]t", ":tabnext<CR>")
