return {
	{
		dir = "~/projects/dendrite.nvim",
		config = function()
			require("dendrite").setup({
				vault = "~/atlas",
				daily_notes = {
					dir = "/logs",
				},
				scratch_notes = {
					dir = "/scratches",
				},
				templates_dir = "~/atlas/.templates",
			})

			vim.keymap.set("n", "<leader>da", function()
				require("dendrite").new_note("axiom", "axioms")
			end, { desc = "Create new note" })

			vim.keymap.set("n", "<leader>dd", function()
				require("dendrite").daily_note()
			end, { desc = "Create new daily note" })

			vim.keymap.set("n", "<leader>dt", function()
				require("dendrite").scratch_note()
			end, { desc = "Find notes" })

			vim.keymap.set("n", "<leader>dl", function()
				require("dendrite").new_note("literature", "literature")
			end, { desc = "Create new literature note" })

			vim.keymap.set("n", "<leader>di", function()
				require("dendrite").new_note("issue", "issues")
			end, { desc = "Create new issue note" })

			vim.keymap.set("n", "<leader>df", function()
				require("dendrite").search_frontmatter({ "Tags", "Authors", "Created", "Updated", "Source", "Title" })
			end, { desc = "Create new project note" })
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
			vim.keymap.set("n", "zm", function()
				require("render-markdown").toggle()
			end)
			vim.keymap.set("n", "zv", function()
				require("render-markdown").preview()
			end)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.textwidth = 80
					vim.opt_local.formatoptions:append("t")
				end,
			})
		end,
	},
}
