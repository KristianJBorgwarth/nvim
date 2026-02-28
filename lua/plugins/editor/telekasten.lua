return {
  {
    "nvim-telekasten/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local tk = require("telekasten")
      tk.setup({
        home = vim.fn.expand("~/atlas"),
        dailies = "logs",
        templates = "templates",
        extension = ".md",
        template_new_daily = vim.fn.expand("~/atlas/templates/daily.md"),
      })

      -- keymaps
      vim.keymap.set("n", "zd", tk.goto_today)
      vim.keymap.set("n", "zf", tk.find_notes)
      vim.keymap.set("n", "zg", tk.search_notes)
      vim.keymap.set("n", "zn", tk.new_note)
      vim.keymap.set("n", "zl", tk.follow_link)
      vim.keymap.set("n", "zb", tk.show_backlinks)


      -- commands
      vim.api.nvim_create_user_command("Axiom", function()
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        local home = vim.fn.expand("~/atlas")

        local template_path = home .. "/templates/axiom.md"
        local utils = require("scripts.utils")

        local title, slug = utils.prompt_title()
        if not title or not slug then return end

        local dirs = utils.get_all_directories(home, { "scratches", ".git", "logs", "templates" })

        pickers.new({}, {
          prompt_title = "Select directory",
          finder = finders.new_table({ results = dirs }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)

              local selection = action_state.get_selected_entry()[1]
              local full_dir = selection
              vim.fn.mkdir(full_dir, "p")

              local filepath = full_dir .. "/" .. slug .. ".md"

              if vim.fn.filereadable(filepath) == 1 then
                vim.cmd("edit " .. filepath)
                return
              end

              local lines = vim.fn.readfile(template_path)

              for i, line in ipairs(lines) do
                lines[i] = line
                    :gsub("{{title}}", title)
                    :gsub("{{date}}", os.date("%Y-%m-%d"))
              end

              vim.fn.writefile(lines, filepath)
              vim.cmd("edit " .. filepath)
            end)
            return true
          end,
        }):find()
      end, {})


      -- telekasten -> md view behavior
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "telekasten",
        callback = function()
          vim.bo.filetype = "markdown"
        end,
      })

      -- line wrapping for .md
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.opt_local.textwidth = 88
          vim.opt_local.wrap = false
          vim.opt_local.linebreak = true
          vim.opt_local.spell = true
          vim.opt_local.formatoptions:append("t")
          vim.opt_local.conceallevel = 2
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({
      })
      vim.keymap.set("n", "zm", function()
        require("render-markdown").toggle()
      end)
      vim.keymap.set("n", "zv", function()
        require("render-markdown").preview()
      end)
    end,
  }
}
