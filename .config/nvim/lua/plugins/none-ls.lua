return {
	"nvimtools/none-ls.nvim",

	dependencies = {
		"jay-babu/mason-null-ls.nvim",
    "nvim-lua/plenary.nvim",

		config = function()
			local mason_null_ls = require("mason-null-ls")
			local null_ls = require("null-ls")
			local null_ls_utils = require("null-ls.utils")

			mason_null_ls.setup({

				ensure_installed = {
					"pylint",
				},
			})

			null_ls.setup({

				root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
				sources = {

					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.diagnostics.cpplint,
					null_ls.builtins.diagnostics.pylint,
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
