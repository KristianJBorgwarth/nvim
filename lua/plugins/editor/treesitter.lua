return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = function(bufnr)
            local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
            if not ok or not parser then return nil end
            return require("rainbow-delimiters").strategy["global"]
          end,
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "python",
        "c_sharp",
        "markdown",
        "markdown_inline",
        "go",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
