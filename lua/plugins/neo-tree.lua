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
		window = { position = "right", width = 50 },
		filesystem = {
			hijack_netrw_behavior = "open_default",
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			use_libuv_file_watcher = true,
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.keymap.set(
			"n",
			"<A-1>",
			"<cmd>Neotree toggle right<cr>",
			{ silent = true, desc = "Neo-tree: toggle (right)" }
		)
	end,
}
