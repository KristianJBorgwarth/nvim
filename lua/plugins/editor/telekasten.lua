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
      })

      -- Core Atlas navigation
      vim.keymap.set("n", "zf", tk.find_notes)
      vim.keymap.set("n", "zg", tk.search_notes)
      vim.keymap.set("n", "zn", tk.new_note)
      vim.keymap.set("n", "zl", tk.follow_link)
      vim.keymap.set("n", "zb", tk.show_backlinks)

      -- Auto-apply writing defaults only inside ~/atlas
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(args)
          local filepath = vim.api.nvim_buf_get_name(args.buf)
          if filepath:match(vim.fn.expand("~/atlas")) and filepath:match("%.md$") then
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
            vim.opt_local.spell = true
          end
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
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
