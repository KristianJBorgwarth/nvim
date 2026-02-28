return {
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
        ui = {
          border = "single",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "bashls" },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      local border = "rounded"
      vim.diagnostic.config({
        float = { border = border },
      })

      -- lua_ls setup
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Global LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local b = ev.buf
          local o = { buffer = b, silent = true }

          vim.keymap.set("n", "<leader>e", function()
            vim.diagnostic.goto_next({
              severity = vim.diagnostic.severity.ERROR,
            })
          end, o)
          vim.keymap.set("n", "<leader>ds", function()
            vim.diagnostic.goto_next({
              severity = {
                vim.diagnostic.severity.WARN,
                vim.diagnostic.severity.INFO,
                vim.diagnostic.severity.HINT,
              },
            })
          end, o)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, o)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
          vim.keymap.set({ "n", "v" }, "<A-enter>", vim.lsp.buf.code_action, o)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)
          vim.keymap.set({ "n", "v" }, "<leader>f", function()
            vim.lsp.buf.format({ async = false })
          end, o)
        end,
      })
    end,
  },
}
