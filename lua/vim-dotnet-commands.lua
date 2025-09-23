vim.keymap.set("n", "<leader>b", ":update | !dotnet build<CR>", { desc = "dotnet build", silent = true })
vim.keymap.set("n", "<leader>t", ":update | !dotnet test<CR>", { desc = "dotnet test", silent = true })
vim.keymap.set("n", "<leader>c", ":update | !dotnet clean<CR>", { desc = "dotnet clean", silent = true })
vim.keymap.set("n", "<leader>r", ":update | !dotnet restore<CR>", { desc = "dotnet restore", silent = true })
