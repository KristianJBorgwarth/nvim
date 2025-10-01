local map = vim.keymap.set

-- split windows
map("n", "<A-s>", "<cmd>vsplit<CR>", { desc = "Vertical split", silent = true })
map("n", "<A-S-s>", "<cmd>split<CR>", { desc = "Horizontal split", silent = true }) -- optional

-- move between split windows
map({ "n", "v" }, "<A-h>", "<C-w>h", { desc = "Move to left split" })
map({ "n", "v" }, "<A-l>", "<C-w>l", { desc = "Move to right split" })
map("i", "<A-h>", "<C-o><C-w>h", { desc = "Move to left split" })
map("i", "<A-l>", "<C-o><C-w>l", { desc = "Move to right split" })

-- close current window
map({ "n", "v" }, "<A-q>", "<C-w>q", { desc = "Close current split" })
map("i", "<A-q>", "<C-o><C-w>q", { desc = "Close current split" })

