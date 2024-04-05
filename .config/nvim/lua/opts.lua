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
-- smash esc insert
vim.keymap.set("i", "jk", "<Esc>", { desc = "Insert mode smash esc" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Insert move smash esc" })
-- visual
vim.keymap.set("v", "jk", "<Esc>", { desc = "Visual mode smash esc" })
vim.keymap.set("v", "kj", "<Esc>", { desc = "Visual mode smash esc" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "write buffer" })
vim.keymap.set("n", "<leader>Q", ":q<CR>", { desc = "quit neovim" })

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Window switch into left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Window switch into bellow" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Window switch into above" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Window switch into right" })
vim.keymap.set("n", "H", [[<Cmd>wincmd H<CR>]], { desc = "Window move left" })
vim.keymap.set("n", "J", [[<Cmd>wincmd J<CR>]], { desc = "Window move botton" })
vim.keymap.set("n", "K", [[<Cmd>wincmd K<CR>]], { desc = "Window move top" })
vim.keymap.set("n", "L", [[<Cmd>wincmd L<CR>]], { desc = "Window move right" })
vim.keymap.set("n", "<leader>q", [[<Cmd>close<CR>]], { desc = "Windows close leaving buffer open" })
vim.keymap.set("n", "<leader>ev", [[<Cmd>vsplit<CR>]], { desc = "Window vsplit" })
vim.keymap.set("n", "<leader>eh", [[<Cmd>split<CR>]], { desc = "Window split" })
vim.keymap.set("n", "<leader>ex", [[<Cmd>only<CR>]], { desc = "Window focas current, remove others" })
vim.keymap.set("n", "<leader>+", [[<Cmd>wincmd +<CR>]], { desc = "Window resize +" })
vim.keymap.set("n", "<leader>-", [[<Cmd>wincmd -<CR>]], { desc = "Window resize -" })

-- tab keymaps
vim.keymap.set("n", "<leader>tn", [[<Cmd>tabnew<CR>]], { desc = "Tab new" })
vim.keymap.set("n", "<leader>tx", [[<Cmd>tabclose<CR>]], { desc = "Tab close" })
vim.keymap.set("n", "<leader>tH", [[<Cmd>tabmove -<CR>]], { desc = "Tab move left" })
vim.keymap.set("n", "<leader>tL", [[<Cmd>tabmove +<CR>]], { desc = "Tab move right" })
vim.keymap.set("n", "<leader>tf", [[<Cmd>tabonly<CR>]], { desc = "Tab focas remove all others" })
vim.keymap.set("n", "<leader>th", [[<Cmd>-tabnext<CR>]], { desc = "Tab switch left" })
vim.keymap.set("n", "<leader>tl", [[<Cmd>+tabnext<CR>]], { desc = "Tab switch right" })
vim.keymap.set("n", "<leader>tT", [[<Cmd>wincmd T<CR>]], { desc = "Tab open current buffer in new tab" })
