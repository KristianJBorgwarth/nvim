local map = vim.keymap.set
vim.opt.clipboard = "unnamedplus"

-- copy to system clipboard
map({ "v" }, "<leader>y", '"*y', { desc = "Copy to linux system clipboard", silent = true })

-- paste from linux system clipboard
map({ "n", "v" }, "<leader>p", '"*p', { desc = "Paste from linux system clipboard", silent = true })

-- copy line to system clipboard
map({ "n" }, "<leader>yy", '"+yy', { desc = "Copy line → clipboard", silent = true })
