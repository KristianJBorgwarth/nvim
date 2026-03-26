return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dap-go").setup({
			dap_configurations = {
				{
					type = "go",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "go",
					name = "Debug Package",
					request = "launch",
					program = "${fileDirname}",
				},
				{
					type = "go",
					name = "Attach (local)",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			},
			delve = {
				initialize_timeout_sec = 20,
				port = "${port}",
				args = {},
				build_flags = {},
				detached = vim.fn.has("win32") == 0,
				cwd = nil,
			},
		})

		local dap_go = require("dap-go")
		vim.keymap.set("n", "<leader>dgt", dap_go.debug_test, { desc = "DAP Go: Debug test" })
		vim.keymap.set("n", "<leader>dgl", dap_go.debug_last_test, { desc = "DAP Go: Debug last test" })
	end,
}
