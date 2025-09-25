return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		local neogit = require("neogit")

		vim.keymap.set("n", "<leader>ga<CR>", function()
			vim.cmd("!git add .")
		end, { silent = true, noremap = true })

		vim.keymap.set("n", "<leader>ng", function()
			neogit.open()
		end, { silent = true, noremap = true, desc = "Open Neogit" })
	end,
}
