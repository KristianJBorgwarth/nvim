return {
  "rcarriga/nvim-notify",
  opts = {
    top_down = false,
    background_colour = "#161616",
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify

    local function fix_notify()
      local groups = {
        "NotifyERRORBody", "NotifyWARNBody", "NotifyINFOBody", "NotifyDEBUGBody", "NotifyTRACEBody",
        "NotifyERRORBorder", "NotifyWARNBorder", "NotifyINFOBorder", "NotifyDEBUGBorder", "NotifyTRACEBorder",
        "NotifyERRORTitle", "NotifyWARNTitle", "NotifyINFOTitle", "NotifyDEBUGTitle", "NotifyTRACETitle",
      }

      for _, g in ipairs(groups) do
        vim.api.nvim_set_hl(0, g, { bg = "NONE" })
      end

      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    end

    fix_notify()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.schedule(fix_notify)
      end,
    })
  end,
}
