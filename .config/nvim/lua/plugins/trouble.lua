return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- Lua

		auto_open = false,
		auto_close = true,
		use_diagnostic_signs = true,
		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle()
		end),
		vim.keymap.set("n", "<leader>xw", function()
			require("trouble").toggle("works,pace_diagnostics")
		end),
		vim.keymap.set("n", "<leader>xd", function()
			require("trouble").toggle("docum,ent_diagnostics")
		end),
		vim.keymap.set("n", "<leader>xq", function()
			require("trouble").toggle("quick,fix")
		end),
		vim.keymap.set("n", "<leader>xl", function()
			require("trouble").toggle("locli,st")
		end),
		vim.keymap.set("n", "gR", function()
			require("trouble").toggle("lsp_reference,s")
		end),
	},
}
