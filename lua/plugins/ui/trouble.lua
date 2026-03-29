return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "All diagnostics (workspace)",
    },
    {
      "<leader>xe",
      "<cmd>Trouble workspace_errors toggle<cr>",
      desc = "Errors only (workspace)",
    },
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Diagnostics (buffer)",
    },
    {
      "<leader>xq",
      "<cmd>Trouble quickfix toggle<cr>",
      desc = "Quickfix",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Loclist",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Document symbols",
    },
    {
      "<leader>xr",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP references/defs/etc",
    },
  },
  opts = {
    modes = {
      workspace_errors = {
        mode = "diagnostics",
        filter = { severity = vim.diagnostic.severity.ERROR },
        title = "Workspace Errors",
      },
    },
  },
}
