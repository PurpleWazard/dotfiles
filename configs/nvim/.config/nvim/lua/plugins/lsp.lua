return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = { "clangd" },
    automatic_enable = true
  },
  config = function()
    vim.lsp.enable('gdscript')
    vim.lsp.enable('clangd')
    vim.lsp.enable('pyright')
    vim.lsp.enable('lua_ls')
  end
}
