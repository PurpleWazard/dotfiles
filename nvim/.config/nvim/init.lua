vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250

vim.opt.splitright = true
vim.opt.splitbelow = true

--  and `:help 'listchars'`
vim.opt.list = true
--[[ tab  = "» ",]]
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣", extends = ">", precedes = "<" }
vim.opt.termguicolors = true
vim.opt.inccommand = "split"
vim.opt.wrap = false

vim.opt.cursorline = true

vim.opt.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.keymap.set("i", "jk", "<Esc>", { desc = "Insert mode smash esc" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Insert mode smash esc" })

vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "[WW]orkspace save buffer" })
vim.keymap.set("n", "<leader>x", ":q<CR>", { desc = "[x]quit" })

vim.keymap.set("n", "<C-n>", [[<Cmd>bnext<CR>]], { desc = "switch between buffers" })
vim.keymap.set("n", "<C-p>", [[<Cmd>bprev<CR>]], { desc = "switch between buffers" })

-- local set = vim.opt_local

-- Set local settings for terminal buffers
-- vim.api.nvim_create_autocmd("TermOpen", {
-- 	group = vim.api.nvim_create_augroup("custom-term-open", {}),
-- 	callback = function()
-- 		set.number = false
-- 		set.relativenumber = false
-- 		set.scrolloff = 0
-- 	end,
-- })

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("t", "JK", "<c-\\><c-n>")
vim.keymap.set("t", "KJ", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>t", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)

-- boot strap lazy nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Enable neovim to be the external editor for Godot, if the cwd has a project.godot file
-- if vim.fn.getcwd() .. "/project.godot" then
vim.keymap.set("n", "<leader>dG", function()
	if "tmp/godot.pipe" then
		print("attaching to godot server")
		vim.fn.serverstart("/tmp/godot.pipe")
	end
end)
--
