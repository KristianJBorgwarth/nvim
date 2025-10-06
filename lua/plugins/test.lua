return {
	"nvim-neotest/neotest",
	dependencies = {
		"nsidorenco/neotest-vstest",
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
			discovery = {
				filter_dir = function(name, rel_path, root)
					local ignore = { "bin", "obj", "Helpers", ".git", "Setup", "Fixtures", "Authentication" }
					for _, n in ipairs(ignore) do
						if name == n then
							return false
						end
					end
					return true
				end,
				is_test_file = function(file_path)
					if file_path:match("[/\\]Setup[/\\]") then
						return false
					end
					local ends_with = function(pat)
						return file_path:lower():match(pat) ~= nil
					end
					return ends_with("[Tt]ests?%.cs$")
						or ends_with("[%.%-][Tt]est[s]?%.cs$")
						or ends_with("[Ii]ntegration[Tt]ests?%.cs$")
				end,
			},
			adapters = {
				require("neotest-vstest")({
					args = { "-l:console;verbosity=minimal", "--nologo" },
					dap_settings = {
						type = "netcoredbg",
					},
				}),
			},
		})

		local nt = require("neotest")

		vim.keymap.set("n", "<A-8>", function()
			nt.summary.toggle()
		end, { desc = "Neotest: Toggle summary" })

		vim.keymap.set("n", "<leader>tp", function()
			nt.output.open({ last_run = true, enter = true, short = false })
		end, { desc = "Neotest: Toggle output panel" })

		vim.keymap.set("n", "<leader>tt", function()
			nt.run.run()
		end, { desc = "Test: run nearest" })

		vim.keymap.set("n", "<leader>tf", function()
			nt.run.run(vim.fn.expand("%"))
		end, { desc = "Test: run file" })

		vim.keymap.set("n", "<leader>ts", function()
			nt.run.run({ suite = true })
		end, { desc = "Test: run suite" })

		vim.keymap.set("n", "<leader>td", function()
			nt.run.run({ strategy = "dap" })
		end, { desc = "Neotest: Debug nearest test" })
	end,
}
