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
        ensure_installed = { "clangd", "pyright" },
        automatic_installation = true,
      }
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        -- ["rust_analyzer"] = function ()
        --  require("rust-tools").setup {}
        -- end
      }
      vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)
    end
  }
}
