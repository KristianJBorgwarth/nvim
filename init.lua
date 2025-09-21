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

vim.keymap.set({ "n", "i", "v" }, "<C-s>", function()
  vim.cmd("wa")
end, { silent = true, desc = "Savel all" })

vim.keymap.set({ "n", "i", "v" }, "<C-q>", function()
  vim.cmd("wqa")
end, { silent = true, desc = "Write all & quit" })

vim.opt.number = true

require("vim-settings")
require("lazy").setup("plugins")
