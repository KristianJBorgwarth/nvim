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

		-- terminals --
		local Terminal = require("toggleterm.terminal").Terminal
		local map = vim.keymap.set

		local function make(cmd)
			return Terminal:new({
				cmd = cmd,
				direction = "float",
				close_on_exit = false,
				float_opts = { border = "rounded" },
			})
		end

		local dotnet_build = make("dotnet build --nologo")
		local dotnet_test = make("dotnet test")
		local dotnet_clean = make("dotnet clean")
		local dotnet_restore = make("dotnet restore")
    local lazygit = make("lazygit")

		map("n", "<leader>b", function()
			vim.cmd("update")
			dotnet_build:toggle()
		end, { desc = "dotnet build" })

		map("n", "<leader>t", function()
			vim.cmd("update")
			dotnet_test:toggle()
		end, { desc = "dotnet test" })

		map("n", "<leader>c", function()
			vim.cmd("update")
			dotnet_clean:toggle()
		end, { desc = "dotnet clean" })

		map("n", "<leader>r", function()
			vim.cmd("update")
			dotnet_restore:toggle()
		end, { desc = "dotnet restore" })

    map("n", "<leader>ll", function()
      vim.cmd("update")
      lazygit:toggle()
    end, { desc = "lazygit" })
	end,
}
