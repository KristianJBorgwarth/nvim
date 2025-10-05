return {
	"nvim-neotest/neotest",
	dependencies = {
		"Issafalcon/neotest-dotnet",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			quickfix = {
				open = false,
			},
			status = {
				virtual_text = true,
			},
			output = {
				open_on_run = true,
			},
			adapters = {
				require("neotest-dotnet")({
					args = { "--no-restore" },
					solution = "solution",
				}),
			},
		})

		local nt = require("neotest")

		vim.keymap.set("n", "<A-8>", function()
			nt.summary.toggle()
		end, { desc = "Neotest: Toggle summary" })

		vim.keymap.set("n", "<leader>tA", function()
			nt.run.run({ suite = true })
		end, { desc = "Neotest: Run ALL tests" })

		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run({ strategy = "dap" })
		end, { desc = "Neotest: Debug nearest test" })

		vim.api.nvim_create_user_command("TestExplorer", function()
			nt.summary.toggle()
		end, {})

		vim.api.nvim_create_user_command("TestRunAll", function()
			nt.run.run({ suite = true })
		end, {})

		vim.api.nvim_create_user_command("TestDebugAll", function()
			nt.run.run({ suite = true, strategy = "dap" })
		end, {})
	end,
}
