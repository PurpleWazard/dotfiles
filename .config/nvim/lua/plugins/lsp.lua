return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pylsp",
				"cmake",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"cmakelang",
				"clang-format",
				"pylint",
				"gdtoolkit",
				"pylint",
				"cmakelint",
			},
		})

		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

		vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, {})

		require("lspconfig").gdscript.setup(capabilities)
		require("lspconfig").cmake.setup(capabilities)
		require("lspconfig").pylsp.setup(capabilities)
		require("lspconfig").clangd.setup(capabilities)
		require("lspconfig").mesonlsp.setup(capabilities)

		require("lspconfig").lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

	end,
}
