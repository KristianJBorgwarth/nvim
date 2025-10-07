return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      color_overrides = {
        frappe = {
          base   = "#09090d",
          mantle = "#0c0c12",
          crust  = "#111119",
        },
      },
      auto_integrations = true,
      highlight_overrides = {
        all = function(C)
          return require("scripts.neotest-color").get(C)
        end,
      },
    })

    vim.opt.termguicolors = true
    vim.cmd.colorscheme("catppuccin")

    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1e1e2a" })
    vim.api.nvim_set_hl(0, "VertSplit",    { fg = "#1e1e2a" })
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111118" })
  end,
}

