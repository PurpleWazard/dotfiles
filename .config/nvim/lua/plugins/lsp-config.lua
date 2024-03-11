return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      Auto_mason_lsp = { "clangd", "lua_ls", "pylsp", "cmake" }
      local Auto_mason_lint = { "cpplint", "pylint" }
      local Auto_mason_format = { "clang-format", "stylua" }

      local registry = require("mason-registry")
      local packages = registry.get_all_package_names()
      local function contains(list, value)
        for _, v in ipairs(list) do
          if v == value then
            return true
          end
        end
        return false
      end

      local function Masonloop(list)
        for _, i in pairs(list) do
          if not contains(packages, i) then
            vim.cmd(":MasonInstall " .. i)
          end
        end
      end

      Masonloop(Auto_mason_lint)
      Masonloop(Auto_mason_format)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = Auto_mason_lsp,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --local lspconfig = require("lspconfig")

      --lspconfig.lua_ls.setup {
      --  capabilities = capabilities
      --}
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
