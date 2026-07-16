return {
	"akinsho/toggleterm.nvim",
	version = "*",

	opts = {
		size = 20,
		open_mapping = [[<C-M-1>]],
		direction = "float",
		shade_terminals = false,
		float_opts = { border = "rounded" },
		close_on_exit = true,
	},

	config = function(_, opts)
		require("toggleterm").setup(opts)

		local Terminal = require("toggleterm.terminal").Terminal
		local map = vim.keymap.set

		local function run(cmd)
			Terminal:new({
				cmd = cmd,
				direction = "float",
				close_on_exit = false,
				float_opts = { border = "rounded" },
			}):open()
		end

		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			close_on_exit = true,
			float_opts = { border = "rounded" },
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
