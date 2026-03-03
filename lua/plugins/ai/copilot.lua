return {
  {
    "github/copilot.vim",
    config = function()
      local atlas = vim.fn.expand("~/atlas")

      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(args)
          local file = vim.api.nvim_buf_get_name(args.buf)
          if file:find(atlas, 1, true) == 1 then
            vim.b.copilot_enabled = false
          end
        end,
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local chat = require("CopilotChat")
      chat.setup({})
      vim.keymap.set("n", "<leader>ai", chat.toggle, { desc = "Copilot Chat" })
    end,
  },
}
