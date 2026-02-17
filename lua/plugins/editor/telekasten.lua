return {
  "nvim-telekasten/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/notes"),
      dailies = "daily",
      weeklies = "weekly",
      templates = "templates",
      image_subdir = "img",
      extension = ".md",
      new_note_filename = "${slug}",
      uuid_type = "%Y-%m-%d-%H-%M-%S",
      follow_creates_nonexisting = true,
      dailies_create_nonexisting = true,
      weeklies_create_nonexisting = true,
    })
  end,
}
