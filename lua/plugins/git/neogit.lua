return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 800,
				},
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				on_attach = function(bufnr)
					local gs = require("gitsigns")

					local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end

					map("n", "<leader>g", function()
						gs.blame_line({ full = true })
					end, "Git blame (float)")

					map("n", "<leader>gR", gs.reset_buffer, "Git reset buffer")
				end,
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			local neogit = require("neogit")

			vim.keymap.set(
				"n",
				"<leader>ga",
				"<cmd>!git add .<CR>",
				{ silent = true, noremap = true, desc = "Git add all" }
			)

			vim.keymap.set("n", "<leader>ng", function()
				neogit.open()
			end, { silent = true, noremap = true, desc = "Open Neogit" })
		end,
	},
}
