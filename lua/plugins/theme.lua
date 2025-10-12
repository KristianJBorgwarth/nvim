return {
	"Mofiqul/dracula.nvim",
	name = "dracula",
	priority = 1000,
	config = function()
		require("dracula").setup({
      colors = {
        bg = "#09090d",
        fg = "#c8c3b9",
        selection = "#44475a",
        comment = "#6272a4",
        red = "#ff6ac1",
        orange = "#ffb86c",
        yellow = "#f1fa8c",
        green = "#50fa7b",
        purple = "#bd93f9",
        cyan = "#8be9fd",
        pink = "#ff79c6",
        bright_red = "#ff6ac1",
        bright_green = "#69ff94",
        bright_yellow = "#ffffa5",
        bright_blue = "#d6acff",
        bright_magenta = "#ff92df",
        bright_cyan = "#a4ffff",
        bright_white = "#ffffff",
     },
			highlight_overrides = {
				all = function(C)
					return require("scripts.neotest-color").get(C)
				end,
			},
		})

		vim.opt.termguicolors = true
		vim.cmd.colorscheme("dracula")

		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1e1e2a" })
		vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1e1e2a" })
		vim.opt.cursorline = true
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111118" })
	end,
}
