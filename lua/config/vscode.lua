local map = vim.keymap.set
local vscode = require("vscode")

map("n", "gd", function()
	vscode.action("editor.action.revealDefinition")
end, { desc = "Go to definition" })

map("n", "<leader>f", function()
	vscode.action("editor.action.formatDocument")
end, { desc = "Format document" })
map("v", "<leader>f", function()
	vscode.action("editor.action.formatSelection")
end, { desc = "Format selection" })
