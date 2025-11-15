return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "<leader>gb", gs.blame_line, { desc = "Git Blame Line" })
          map("n", "<leader>gR", gs.reset_buffer, { desc = "Git Reset Buffer" })
        end,
      })
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      local neogit = require("neogit")

      -- git add .
      vim.keymap.set(
        "n",
        "<leader>ga",
        "<cmd>!git add .<CR>",
        { silent = true, noremap = true, desc = "Git add all" }
      )

      vim.keymap.set(
        "n",
        "<leader>ng",
        function() neogit.open() end,
        { silent = true, noremap = true, desc = "Open Neogit" }
      )
    end,
  },
}

