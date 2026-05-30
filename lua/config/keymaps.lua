local map = vim.keymap.set

-- clipboard
map({ "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard", silent = true })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard", silent = true })
map({ "n" }, "<leader>yy", '"+yy', { desc = "Copy line → clipboard", silent = true })
map("n", "<leader>a", "<cmd>%y+<CR>", { desc = "Copy entire buffer → clipboard", silent = true })

-- splits
map("n", "<A-s>", "<cmd>vsplit<CR>", { desc = "Vertical split", silent = true })
map("n", "<A-d>", "<cmd>split<CR>", { desc = "Horizontal split", silent = true })

-- navigate splits
map({ "n", "v" }, "<A-h>", "<C-w>h", { desc = "Move to left split" })
map({ "n", "v" }, "<A-l>", "<C-w>l", { desc = "Move to right split" })
map({ "n", "v" }, "<A-j>", "<C-w>j", { desc = "Move to lower split" })
map({ "n", "v" }, "<A-k>", "<C-w>k", { desc = "Move to upper split" })
map("i", "<A-h>", "<C-o><C-w>h", { desc = "Move to left split" })
map("i", "<A-l>", "<C-o><C-w>l", { desc = "Move to right split" })
map("i", "<A-j>", "<C-o><C-w>j", { desc = "Move to lower split" })
map("i", "<A-k>", "<C-o><C-w>k", { desc = "Move to upper split" })

-- close window
map({ "n", "v" }, "<A-q>", "<C-w>q", { desc = "Close current split" })
map("i", "<A-q>", "<C-o><C-w>q", { desc = "Close current split" })

-- save all
map({ "n", "i", "v" }, "<C-s>", function()
	vim.cmd("silent! wa")
end, { silent = true, desc = "Save all" })

-- escape
map({ "i", "v", "s", "o" }, "<C-j>", "<Esc>", { noremap = true, silent = true })
