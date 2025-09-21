return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  build = ":TSUpdate",
  config = function()
    configs.setup({
      ensure_installed = {"lua", "javascript", "typescript", "python", "c_sharp" },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
