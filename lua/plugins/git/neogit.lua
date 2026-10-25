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

					map("n", "<leader>gb", function()
						gs.blame_line({ full = true })
					end, "Git blame (float)")

					map("n", "<leader>gR", gs.reset_buffer, "Git reset buffer")

					map("n", "<leader>gd", function()
						local on = gs.toggle_linehl()
						gs.toggle_word_diff(on)
						gs.toggle_deleted(on)
					end, "Git toggle inline diff")

					map("n", "]h", function()
						gs.nav_hunk("next")
					end, "Next git hunk")
					map("n", "[h", function()
						gs.nav_hunk("prev")
					end, "Previous git hunk")
				end,
			})
		end,
	}
}
