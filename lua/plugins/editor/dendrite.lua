return {
  {
    dir = "~/projects/dendrite.nvim",
    config = function()
      require("dendrite").setup({
        vault = "~/atlas",
        templates_dir = "~/atlas/.templates",
      })

      vim.keymap.set("n", "<leader>da", function()
        require("dendrite").new_note("axiom", "axioms")
      end, { desc = "Create new note" })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({
      })
      vim.keymap.set("n", "zm", function()
        require("render-markdown").toggle()
      end)
      vim.keymap.set("n", "zv", function()
        require("render-markdown").preview()
      end)
    end,
  }
}
