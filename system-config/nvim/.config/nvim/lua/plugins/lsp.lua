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
      require("mason-lspconfig").setup {
        automatic_enable = true
      }
      vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)
    end
  }
}
