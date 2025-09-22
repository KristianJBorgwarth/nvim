
return {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "omnisharp"},
      handlers = {
        function(server)
          local cfg = vim.lsp.config(server)
          vim.lsp.enable(cfg)
        end,
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      vim.api.nvim_create_autocmd("LspAttach", { callback = function(ev)
        local b = ev.buf
        local o = { buffer = b, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, o)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, o)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)
        vim.keymap.set({ "n", "v" }, "<leader>f", function() vim.lsp.buf.format({ async = false }) end, o)
      end })
    end,
  },
}


