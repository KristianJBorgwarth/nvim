vim.keymap.set("n", "<A-s>", ":vsplit<CR>", { desc = "Horizontal split" })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right split" })

vim.keymap.set("n", "<A-q>", "<C-w>q", { desc = "Close current split" })
