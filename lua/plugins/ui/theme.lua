return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        disable_italics = false,
      })

      vim.cmd("colorscheme poimandres")
    end,
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        variant = "default",
        integrations = {
          telescope = true,
          gitsigns = true,
          cmp = true,
          treesitter = true,
        },
      })
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("transparent").setup({
        enable = true,

        extra_groups = {
          "NormalFloat",
          "FloatBorder",
          "SignColumn",
          "EndOfBuffer",
          "MsgArea",

          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptNormal",
          "TelescopeResultsNormal",
          "TelescopePreviewNormal",

          "Pmenu",
          "PmenuSel",
        },
      })
      vim.opt.fillchars:append({ eob = " " })
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.cmd("TransparentEnable")
        end,
      })
    end,
  },
  {
    "zaldih/themery.nvim",
    config = function()
      require("themery").setup({
        livePreview = true,
        themes = {
          {
            name = "poimandres",
            colorscheme = "poimandres",
          },
          {
            name = "catppuccin-mocha",
            colorscheme = "catppuccin",
            before = [[
              require("catppuccin").setup({
                flavour = "mocha",
                term_colors = true,
                integrations = {
                  treesitter = true,
                  telescope = true,
                },
              })
            ]]
          },
          {
            name = "catppuccin-macchiato",
            colorscheme = "catppuccin",
            before = [[
              require("catppuccin").setup({
                flavour = "macchiato",
              })
            ]]
          },
          {
            name = "catppuccin-frappe",
            colorscheme = "catppuccin",
            before = [[
              require("catppuccin").setup({
                flavour = "frappe",
              })
            ]]
          },
          {
            name = "tokyonight-night",
            colorscheme = "tokyonight",
            before = [[
              require("tokyonight").setup({
                style = "night",
              })
            ]]
          },
          {
            name = "tokyonight-storm",
            colorscheme = "tokyonight",
            before = [[
              require("tokyonight").setup({
                style = "storm",
              })
            ]]
          },
          {
            name = "tokyonight-moon",
            colorscheme = "tokyonight",
            before = [[
              require("tokyonight").setup({
                style = "moon",
              })
            ]]
          },
          {
            name = "kanagawa-wave",
            colorscheme = "kanagawa",
            before = [[
              require("kanagawa").setup({
                theme = "wave",
              })
            ]]
          },
          {
            name = "kanagawa-dragon",
            colorscheme = "kanagawa",
            before = [[
              require("kanagawa").setup({
                theme = "dragon",
              })
            ]]
          },
          {
            name = "gruvbox-dark",
            colorscheme = "gruvbox",
            before = [[
              require("gruvbox").setup({
                contrast = "hard",
              })
              transparent_mode = true
            ]]
          },
          {
            name = "rose-pine",
            colorscheme = "rose-pine",
            before = [[
              require("rose-pine").setup({
                variant = "main",
                styles = {
                  italic = false,
                },
              })
            ]]
          },
          {
            name = "rose-pine-moon",
            colorscheme = "rose-pine",
            before = [[
              require("rose-pine").setup({
                variant = "moon",
                styles = {
                  italic = false,
                  bold = false,
                }
              })
            ]]
          },
          {
            name = "nord",
            colorscheme = "nord",
          },
          {
            name = "oxocarbon",
            colorscheme = "oxocarbon"
          }
        },
      })
    end,
  },
}
