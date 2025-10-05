return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/neotest",
		"Issafalcon/neotest-dotnet",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
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
		vim.keymap.set("n", "<leader>d", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})

		local netcoredbg = vim.fn.exepath("netcoredbg")
		if netcoredbg == "" then
			netcoredbg = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
		end

		dap.adapters.coreclr = {
			type = "executable",
			command = netcoredbg,
			args = { "--interpreter=vscode" },
		}

		local dll_picker = require("csharp.dll_picker")
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return dll_picker.select_debug_dll({
						depth = 6,
					})
				end,
				cwd = function()
					return dll_picker.last_project_dir()
				end,
				env = {
					ASPNETCORE_ENVIRONMENT = "Development",
					DOTNET_ENVIRONMENT = "Development",
				},
			},
		}
	end,
}
