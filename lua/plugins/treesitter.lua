return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "javascript", "typescript", "python", "c_sharp" },
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

