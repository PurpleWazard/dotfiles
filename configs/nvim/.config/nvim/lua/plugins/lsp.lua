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
    vim.lsp.config("arduino_language_server", {
      cmd = {
        "arduino-language-server",
        "-cli-config", "/home/wazard/.arduino15/arduino-cli.yaml",
      },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })

    vim.lsp.enable("arduino_language_server")


    vim.lsp.enable('clangd')
    vim.lsp.enable('arduino_language_server')
    -- vim.lsp.enable('cssls')
    -- vim.lsp.enable('html')
    vim.lsp.enable('pyright')
    vim.lsp.enable('lua_ls')
    -- vim.lsp.enable('csharp_ls')

    vim.lsp.enable("gdscript")
    -- vim.lsp.enable("gdshader_lsp")
  end
}
