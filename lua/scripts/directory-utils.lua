local M = {}

function M.get_project_directory()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

return M
