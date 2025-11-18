return {
	{
    "github/copilot.vim",
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
