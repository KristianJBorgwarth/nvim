return {
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
				ui = {
					border = "single",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "bashls", "gopls", "clangd", "qmlls" },
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
			vim.lsp.enable({ "lua_ls", "ts_ls", "bashls", "gopls", "qmlls" })
			local border = "rounded"
			vim.diagnostic.config({
				float = { border = border },
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,

						analyses = {
							unusedparams = true,
							shadow = true,
						},

						usePlaceholders = true,
						completeUnimported = true,

						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local b = ev.buf
					local o = { buffer = b, silent = true }
					vim.keymap.set("n", "<leader>e", function()
						vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = true })
					end, o)
					vim.keymap.set("n", "<leader>E", function()
						vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = true })
					end, o)
					vim.keymap.set("n", "<leader>E", function()
						vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
					end, o)
					vim.keymap.set("n", "<leader>ds", function()
						vim.diagnostic.jump({
							count = 1,
							severity = { min = vim.diagnostic.severity.HINT },
							float = true,
						})
					end, o)
					vim.keymap.set("n", "<leader>dS", function()
						vim.diagnostic.jump({
							count = -1,
							severity = { min = vim.diagnostic.severity.HINT },
							float = true,
						})
					end, o)
					vim.keymap.set("n", "<leader>dS", function()
						vim.diagnostic.jump({ count = -1, severity = { min = vim.diagnostic.severity.WARN } })
					end, o)
					vim.keymap.set("n", "K", function()
						local diags = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
						if #diags > 0 then
							vim.diagnostic.open_float()
						else
							vim.lsp.buf.hover()
						end
					end, o)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, o)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
					vim.keymap.set({ "n", "v" }, "<A-enter>", vim.lsp.buf.code_action, o)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)
					vim.keymap.set({ "n", "v" }, "<leader>f", function()
						vim.lsp.buf.format({ async = false })
					end, o)
				end,
			})
		end,
	},
}
