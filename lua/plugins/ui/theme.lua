return {
  "Mofiqul/dracula.nvim",
  name = "dracula",
  priority = 1000,
  config = function()
    require("dracula").setup({
      colors = {
        bg = "#09090d",
        fg = "#d2cdc3",
        selection = "#3a3d4f",
        comment = "#707aa8",
        purple = "#c3a0ff",
        cyan = "#9adcf7",
        pink = "#ff86cf",
        green = "#6ee38f",
        red = "#ff86cf",
        orange = "#c3a0ff",
        bright_red = "#ff9bdc",
        bright_green = "#86f0a6",
        bright_yellow = "#cdb8ff",
        bright_blue = "#cdb8ff",
        bright_magenta = "#ff9bdc",
        bright_cyan = "#b6f0ff",
        bright_white = "#f4f4f4",
        border = "#1e1e2a",
      },
      highlight_overrides = {
        all = function(C)
          return require("scripts.neotest-color").get(C)
        end,
      },
    })

    vim.opt.termguicolors = true
    vim.cmd.colorscheme("dracula")

    -- Custom highlights
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1e1e2a" })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1e1e2a" })

    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "number"
    vim.opt.fillchars = { eob = " " }
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111118" })


    -- Make Neovim background transparent (terminal decides color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

    -- Floats (Telescope/LSP/etc.)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

    -- NeoTree
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })

    -- Telescope
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })

    vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE" })
  end,
}
