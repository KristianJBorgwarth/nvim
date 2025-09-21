return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {'nvim-lua/plenary.nvim'}
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      close_if_last_window = true,
      filesystem = {
        hijack_netrw_behavior = "open_default"
      },
    },
  }
}
