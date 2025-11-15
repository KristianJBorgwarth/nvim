local map = vim.keymap.set
map("n", "<leader>b", "<cmd>update<bar>!dotnet build<CR>", { desc = "dotnet build" })
map("n", "<leader>T", "<cmd>update<bar>!dotnet test<CR>", { desc = "dotnet test" })
map("n", "<leader>c", "<cmd>update<bar>!dotnet clean<CR>", { desc = "dotnet clean" })
map("n", "<leader>r", "<cmd>update<bar>!dotnet restore<CR>", { desc = "dotnet restore" })
