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

		local function get_git_branch()
			-- systemlist returns a table of lines; empty if command fails
			local head = vim.fn.systemlist("git branch --show-current 2>/dev/null")[1]
			if head and head ~= "" then
				return head
			end

			-- fallback for detached HEAD or older git
			local ref = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1]
			if ref and ref ~= "" and ref ~= "HEAD" then
				return ref
			end

			return nil
		end

		local branch = get_git_branch()
		local dir_name = get_dir_name()

		db.setup({
			theme = "doom",
			config = {
				header = {
					"" .. dir_name,
					"",
					"                                   ",
					"                                   ",
					"                                   ",
					"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
					"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
					"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
					"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
					"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
					"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
					"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
					" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
					" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
					"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
					"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
					"                                   ",
					"",
					"" .. (branch and (" " .. branch) or ""),
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
						icon = "✍︎  ",
						desc = "Recent files",
						key = "r",
						action = "lua require('telescope.builtin').oldfiles({only_cwd = true})",
					},
					{
						icon = "✘  ",
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
