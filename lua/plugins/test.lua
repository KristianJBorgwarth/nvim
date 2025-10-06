return {
	"nvim-neotest/neotest",
	dependencies = {
		"Issafalcon/neotest-dotnet",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("neotest").setup({
			quickfix = {
				open = false,
			},
			status = {
				virtual_text = true,
				signs = true,
			},
			output = {
				open_on_run = true,
			},
			adapters = {
				require("neotest-dotnet")({
					dap = {
						adapter_name = "coreclr",
						justMyCode = false,
					},
					dotnet_additional_args = {
						"--verbosity detailed",
            "--configuration", "Debug",
					},
					discovery_root = "solution",
				}),
			},
		})

		local nt = require("neotest")

		vim.keymap.set("n", "<A-8>", function()
			nt.summary.toggle()
		end, { desc = "Neotest: Toggle summary" })

		vim.keymap.set("n", "<A-7>", function()
			nt.output_panel.toggle()
		end, { desc = "Neotest: Toggle output panel" })

		vim.keymap.set("n", "<leader>tA", function()
			nt.run.run({ suite = true })
		end, { desc = "Neotest: Run ALL tests" })

		vim.keymap.set("n", "<leader>td", function()
			nt.run.run({ strategy = "dap" })
		end, { desc = "Neotest: Debug nearest test" })

		end,
}
