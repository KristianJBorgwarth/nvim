return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,   -- load early
  lazy = false,      -- load at startup (so colorscheme is ready)
  config = function()
    require("catppuccin").setup()      -- optional: put your options here
    vim.cmd.colorscheme("catppuccin")
  end,
}

