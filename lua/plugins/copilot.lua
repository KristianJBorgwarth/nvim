return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
		config = function()
			require("copilot").setup({
				panel = { enabled = true },
				suggestion = { enabled = true },
				filetypes = {
					cs = true,
					fs = true,
					ts = true,
					tsx = true,
					js = true,
					jsx = true,
					yaml = true,
					yml = true,
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local chat = require("CopilotChat")
			chat.setup({})
			vim.keymap.set("n", "<leader>ai", function()
				chat.toggle()
			end, { desc = "Copilot Chat" })
		end,
	},
}
