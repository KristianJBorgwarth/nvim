return {
  "rcarriga/nvim-notify",
  opts = {
    top_down = false,
    background_colour = "#000000",
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
    vim.api.nvim_create_autocmd("User", {
      pattern = "NotifyRender",
      callback = function()
        local groups = {
          "NotifyBackground",
          "NotifyERRORBody",
          "NotifyWARNBody",
          "NotifyINFOBody",
          "NotifyDEBUGBody",
          "NotifyTRACEBody",
        }

        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
      end,
    })
  end,
}
