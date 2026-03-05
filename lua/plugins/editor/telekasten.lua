return {
  {
    "nvim-telekasten/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local tk = require("telekasten")
      tk.setup({
        home = vim.fn.expand("~/atlas"),
        dailies = "logs",
        templates = "templates",
        extension = ".md",
        template_new_daily = vim.fn.expand("~/atlas/templates/daily.md"),
      })

      -- keymaps
      vim.keymap.set("n", "zd", tk.goto_today)
      vim.keymap.set("n", "zf", tk.find_notes)
      vim.keymap.set("n", "zp", tk.search_notes)
      vim.keymap.set("n", "zn", tk.new_note)
      vim.keymap.set("n", "zl", tk.follow_link)
      vim.keymap.set("n", "zb", tk.show_backlinks)
      vim.keymap.set("n", "zy", tk.toggle_todo)

      -- telekasten -> md view behavior
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "telekasten",
        callback = function()
          vim.bo.filetype = "markdown"
        end,
      })

      -- line wrapping for .md
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.opt_local.textwidth = 88
          vim.opt_local.wrap = false
          vim.opt_local.linebreak = true
          vim.opt_local.spell = true
          vim.opt_local.formatoptions:append("t")
          vim.opt_local.conceallevel = 2
        end,
      })
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
