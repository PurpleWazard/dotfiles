return {
	{
		lazy = false,
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd("colorscheme gruvbox")
		end,
	},
	-- gives TODO: look at this lol
	-- NOTE: burh aslkdfjasdfasl
	--
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

    { "jannis-baum/vivify.vim" }

}
