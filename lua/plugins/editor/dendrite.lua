return {
	{
		"KristianJBorgwarth/dendrite.nvim",
		version = "*",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("dendrite").setup({
				vault_name = "atlas",
				vault_path = "~/atlas",
				daily_notes = {
					dir = "/logs",
				},
				scratch_notes = {
					dir = "/scratches",
				},
				templates_dir = "/.templates",
			})

			vim.keymap.set("n", "<leader>da", function()
				require("dendrite").new_note("axiom", "axioms")
			end, { desc = "Create new note" })

			vim.keymap.set("n", "<leader>dd", function()
				require("dendrite").daily_note()
			end, { desc = "Create new daily note" })

			vim.keymap.set("n", "<leader>dr", function()
				require("dendrite").scratch_note()
			end, { desc = "Find notes" })

			vim.keymap.set("n", "<leader>dl", function()
				require("dendrite").new_note("literature", "literature")
			end, { desc = "Create new literature note" })

			vim.keymap.set("n", "<leader>di", function()
				require("dendrite").new_note("issue", "issues")
			end, { desc = "Create new issue note" })

			vim.keymap.set("n", "<leader>gl", function()
				require("dendrite").goto_link()
			end, { desc = "Go to link" })
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({
				injections = { enabled = false },
			})
			vim.keymap.set("n", "zm", function()
				require("render-markdown").toggle()
			end)
			vim.keymap.set("n", "zv", function()
				require("render-markdown").preview()
			end)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.textwidth = 90
					vim.opt_local.formatoptions:append("t")
				end,
			})
		end,
	},
}
