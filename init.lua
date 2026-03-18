local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.breakat = [[ ^I!@*-+;:,./?([{)]}]]
vim.o.winborder = "rounded"

require("vim-settings")
require("keymaps.vim-clipboard")
require("keymaps.vim-editor")

require("lazy").setup({
  ui = {
    border = "rounded"
  },
  spec = {
    { import = "plugins.lsp" },
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    { import = "plugins.debugger" },
    { import = "plugins.git" },
    { import = "plugins.ai" },
  },
})
