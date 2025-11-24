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

    -- Custom Highlights
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1e1e2a" })
		vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1e1e2a" })
		vim.opt.cursorline = true
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111118" })

    -- NeoTree
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#09090d", fg = "#c8c3b9" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#09090d", fg = "#c8c3b9" })
		vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#1e1e2a" })
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#bd93f9" })
	end,
}
