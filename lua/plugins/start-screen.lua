return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local db = require("dashboard")

		local function get_dir_name()
			local dir = vim.loop.cwd() or vim.fn.getcwd()
			return vim.fn.fnamemodify(dir, ":t")
		end

    local dir_name = get_dir_name()

		db.setup({
			theme = "doom",
			config = {
				header = {
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
          "".. dir_name, 
					"",
				},

				center = {
					{
						icon = "  ",
						desc = "Find file",
						key = "f",
						action = "Telescope find_files",
					},
					{
						icon = "  ",
						desc = "Recent files",
						key = "r",
						action = "lua require('telescope.builtin').oldfiles({only_cwd = true})",
					},
					{
						icon = "  ",
						desc = "Quit",
						key = "q",
						action = "qa",
					},
				},

				footer = {
					"",
					"Simplcity is the soul of efficiency.",
					"",
					"-Austin Freeman",
				},
				vertical_center = true,
			},
		})

		-- make footer “cursive” (italic). your terminal + font must support italics.
		vim.api.nvim_set_hl(0, "DashboardFooter", { italic = true })
	end,
}
