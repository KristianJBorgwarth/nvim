return {
  {
    dir = "~/projects/dendrite.nvim",
    config = function()
      require("dendrite").setup({
        vault = "~/atlas",
        daily_notes = {
          dir = "/logs",
        },
        templates_dir = "~/atlas/.templates",
      })

      vim.keymap.set("n", "<leader>da", function()
        require("dendrite").new_note("axiom", "axioms")
      end, { desc = "Create new note" })

      vim.keymap.set("n", "<leader>dd", function()
        require("dendrite").daly_note()
      end, { desc = "Create new daily note" })


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
