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
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Document symbols",
		},
		{
			"<leader>xr",
			"<cmd>Trouble lsp_references toggle focus=false<cr>",
			desc = "LSP references/defs/etc",
		},
	},
	opts = {
		win = {
			position = "bottom",
			height = 10,
		},
		modes = {
			workspace_errors = {
				mode = "diagnostics",
				filter = { severity = vim.diagnostic.severity.ERROR },
				title = "Workspace Errors",
			},
			symbols = {
				win = {
					position = "bottom",
				},
			},
			lsp = {
				win = {
					position = "bottom",
				},
			},
		},
	},
}
