return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function project_dir()
      local ok, utils = pcall(require, "scripts.directory-utils")
      if ok and utils.get_project_directory then
        return utils.get_project_directory()
      end
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end

    require("lualine").setup({
      options = {
        theme = "dracula",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { project_dir },
        lualine_c = { "branch", { "filename", path = 0 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}

