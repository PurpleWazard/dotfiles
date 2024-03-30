vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.o.termguicolors = true
