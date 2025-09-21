return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    window = { position = "left", width = 30 },
    filesystem = { hijack_netrw_behavior = "open_default" },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set("n", "<A-1>", "<cmd>Neotree toggle right<cr>", { silent = true, desc = "Toggle file explorer (left)" })
  end,
}

