-- Default tabs: 2 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- C# tabs: 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern ={ "cs", "typescript", "javascript", "typescriptreact", "javascriptreact" }, 
  callback = function()
    vim.bo.expandtab = true
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true

