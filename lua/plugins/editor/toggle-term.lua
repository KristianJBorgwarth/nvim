return {
	"akinsho/toggleterm.nvim",
	version = "*",

	opts = {
		size = 20,
		open_mapping = [[<C-M-1>]],
		direction = "horizontal",
		shade_terminals = false,
		close_on_exit = true,
	},

	config = function(_, opts)
		require("toggleterm").setup(opts)

		local Terminal = require("toggleterm.terminal").Terminal
		local map = vim.keymap.set

		local function run(cmd)
			Terminal:new({
				cmd = cmd,
				direction = "horizontal",
				close_on_exit = false,
			}):open()
		end

		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			close_on_exit = true,
		})

		map("n", "<leader>b", function()
			vim.cmd("silent! wa")
			run("make build")
		end, { desc = "make build" })

		map("n", "<leader>t", function()
			vim.cmd("silent! wa")
			run("make test")
		end, { desc = "make test" })

		map("n", "<leader>c", function()
			vim.cmd("silent! wa")
			run("make clean")
		end, { desc = "make clean" })

		map("n", "<leader>r", function()
			vim.cmd("silent! wa")
			run("make run")
		end, { desc = "make run" })

		map("n", "<leader>ll", function()
			lazygit:toggle()
		end, { desc = "lazygit" })
	end,
}
