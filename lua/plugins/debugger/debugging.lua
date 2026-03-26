return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/neotest",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.40 },
						{ id = "stacks", size = 0.30 },
						{ id = "watches", size = 0.20 },
						{ id = "breakpoints", size = 0.10 },
					},
					size = 55,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 12,
					position = "bottom",
				},
			},
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>d", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step over" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step into" })
		vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "DAP: Step out" })
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
	end,
}
