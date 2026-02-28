local M = {}

--- Get the name of the current project directory
---@return string
function M.get_project_directory()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

--- Helper function to recursively scan directories
---@param path string
---@param acc string[]
local function scan(path, acc)
  for name, type in vim.fs.dir(path) do
    local full = path .. "/" .. name
    if type == "directory" then
      table.insert(acc, full)
      scan(full, acc)
    end
  end
end

--- Recursively get all directories under a given path
---@param base_path string
---@return string[]
function M.get_all_directories(base_path)
  local dirs = {}
  scan(base_path, dirs)
  return dirs
end

---create file title
---@param title string
---@return string | nil
function M.slugify(title)
  if(not title) then return nil end
  return title:lower():gsub("[^a-z0-9 ]", ""):gsub("%s+", "-")
end

---prompt for file title
---@return string|nil
function M.prompt_title()
  local title = vim.fn.input("Axiom Title: ")
  if title == "" then return nil end
  return title
end

return M
