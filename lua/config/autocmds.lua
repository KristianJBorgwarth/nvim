vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "typescript", "javascript", "typescriptreact", "javascriptreact" },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
    vim.cmd("vertical resize 100")
  end,
})
