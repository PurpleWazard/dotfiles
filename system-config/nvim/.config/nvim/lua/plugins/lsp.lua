return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'saghen/blink.cmp',
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "clangd", "pyright", "lua_ls" },
        automatic_installation = true,
      }
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
        ["clangd"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
              "clangd"
               -- "--background-index",
               -- "-j=12",
               -- "--query-driver=**",
               -- "--clang-tidy",
               -- "--all-scopes-completion",
               -- "--cross-file-rename",
               -- "--completion-style=detailed",
               -- "--header-insertion-decorators",
               -- "--header-insertion=iwyu",
               -- "--pch-storage=memory",
               -- "--suggest-missing-includes",
            }
          })
        end
      }
      vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)
    end
  }
}
