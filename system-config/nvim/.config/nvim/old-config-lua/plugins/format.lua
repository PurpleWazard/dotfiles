return { -- Autoformat
 	"stevearc/conform.nvim",
 	event = { "bufReadPre", "BufNewFile" },
 	keys = {
 			"<leader>f",
 			function()
 				require("conform").format({ async = true, lsp_fallback = true })
 			end,
 			mode = "",
 			desc = "[F]ormat buffer",
 	},
 	opts = {
 		notify_on_error = true,
 		 format_on_save = {
 			 lsp_fallback = true,
 			 async = true,
        },
 		formatters_by_ft = {
 			lua = { "stylua" },
 			cpp = { "clang-format" },
 			c = { "clang-format" },
 			python = { "black" },
 			markdown = { "markdownlint" },
 		},
 	}
}
