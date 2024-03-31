vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 6
vim.bo.softtabstop = 2
vim.opt.termguicolors = true
vim.o.cmdheight=1
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- spliting windows

vim.keymap.set("n", "<leader>\\", function()
  vim.cmd("vsplit")
end, { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>_", function()
  vim.cmd("split")
end, { desc = "Split vertically" })

vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })
-- C-b cmp scroll_docs
-- C-f cmp scroll_docs
-- C-space cmp complete 
-- C-e cmp abort 
-- CR cmp confirm 
--
--
--
