return {
	"seblyng/roslyn.nvim",
	ft = { "cs" },
	opts = {},
	lazy = false,
	config = function()
		local mason_registry = require("mason-registry")

		-- roslyn.nvim (PR #372) calls the private vim.lsp.diagnostic._refresh on
		-- workspace/projectInitializationComplete, but that function was removed
		-- in newer Neovim, so the handler throws. Restore a shim if it's missing.
		if not vim.lsp.diagnostic._refresh then
			function vim.lsp.diagnostic._refresh(bufnr, client_id)
				local clients = vim.lsp.get_clients({
					bufnr = bufnr,
					id = client_id,
					method = "textDocument/diagnostic",
				})
				for _, client in ipairs(clients) do
					client:request("textDocument/diagnostic", {
						textDocument = vim.lsp.util.make_text_document_params(bufnr),
					}, nil, bufnr)
				end
			end
		end

		local cmd = {
			"roslyn",
			"--stdio",
			"--logLevel=Information",
			"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
		}

		vim.lsp.config("roslyn", {
			cmd = cmd,
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
					csharp_enable_inlay_hints_for_lambda_parameter_types = true,
					csharp_enable_inlay_hints_for_types = true,
					dotnet_enable_inlay_hints_for_indexer_parameters = true,
					dotnet_enable_inlay_hints_for_literal_parameters = true,
					dotnet_enable_inlay_hints_for_object_creation_parameters = true,
					dotnet_enable_inlay_hints_for_other_parameters = true,
					dotnet_enable_inlay_hints_for_parameters = true,
					dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
				},
			},
		})
		vim.lsp.enable("roslyn")
	end,
}
