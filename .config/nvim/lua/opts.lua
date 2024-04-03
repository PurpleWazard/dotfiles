vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 6
vim.bo.softtabstop = 2
vim.opt.termguicolors = true
vim.o.cmdheight = 1
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>Q", ":q<CR>")
vim.keymap.set("n", "<leader>gf", ":lua vim.lsp.buf.format()<CR>")
