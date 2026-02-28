local M = {}

--- Render a template file by replacing placeholders with actual values and writing the result to a new file.
--- @param template_path string The path to the template file
--- @param filepath string The path where the rendered file should be written
--- @param title string The title to replace the {{title}} placeholder in the template
local function render_template(template_path, filepath, title)
  local lines = vim.fn.readfile(template_path)

  for i, line in ipairs(lines) do
    lines[i] = line
        :gsub("{{title}}", title)
        :gsub("{{date}}", os.date("%Y-%m-%d"))
  end

  vim.fn.writefile(lines, filepath)
end


--- Open an existing file or create a new one from a template if it doesn't exist, then open it in the editor.
---@param filepath any
---@param template_path any
---@param title any
local function open_or_create(filepath, template_path, title)
  if vim.fn.filereadable(filepath) == 1 then
    vim.cmd.edit(filepath)
    return
  end

  render_template(template_path, filepath, title)
  vim.cmd.edit(filepath)
end

--- Display a Telescope picker to select a directory from the provided list and execute a callback with the selected directory.
--- @param dirs any
--- @param on_select any
local function select_directory(dirs, on_select)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers.new({}, {
    prompt_title = "Select directory",
    finder = finders.new_table({ results = dirs }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()[1]
        on_select(selection)
      end)
      return true
    end,
  }):find()
end

function M.setup()
  vim.api.nvim_create_user_command("Axiom", function()
    local home = vim.fn.expand("~/atlas")
    local template_path = home .. "/templates/axiom.md"

    local utils = require("scripts.utils")

    local title, slug = utils.prompt_title()
    if not title or not slug then return end

    local dirs = utils.get_all_directories(home, {"scratches", ".git", "logs", "templates" })

    select_directory(dirs, function(full_dir)
      vim.fn.mkdir(full_dir, "p")

      local filepath = string.format("%s/%s.md", full_dir, slug)
      open_or_create(filepath, template_path, title)
    end)
  end, {})
end

return M
