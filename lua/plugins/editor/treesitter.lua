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
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "lua",
        "javascript",
        "typescript",
        "python",
        "c_sharp",
        "markdown",
        "markdown_inline",
        "go",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "javascript", "typescript", "python", "cs", "markdown", "go" },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
