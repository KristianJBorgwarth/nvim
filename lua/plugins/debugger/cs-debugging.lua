return {
	"Issafalcon/neotest-dotnet",
	ft = { "cs", "fsharp", "vb" },
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		local dap = require("dap")

		local netcoredbg = vim.fn.exepath("netcoredbg")
		if netcoredbg == "" then
			netcoredbg = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
		end

		dap.adapters.coreclr = {
			type = "executable",
			command = netcoredbg,
			args = { "--interpreter=vscode" },
		}

		local dll_picker = require("utils.dll_picker")
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "Launch - netcoredbg",
				request = "launch",
				program = function()
					return dll_picker.select_debug_dll({ depth = 6 })
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
