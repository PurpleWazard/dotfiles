--  qsmash esc insert
vim.keymap.set("i", "jk", "<Esc>", { desc = "Insert mode smash esc" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Insert mode smash esc" })

-- visual
vim.keymap.set("v", "vv", "<Esc>", { desc = "Visual mode esc" })

vim.keymap.set("c", "jk", "<Esc>", { desc = "Visual mode esc" })
vim.keymap.set("c", "kj", "<Esc>", { desc = "Visual mode esc" })
-- write and quits
vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "write buffer" })
vim.keymap.set("n", "<leader>wq", ":wqa<CR>", { desc = "write all and quit" })
vim.keymap.set("n", "<leader>wa", ":wa<CR>", { desc = "write all" })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "quit all" })
vim.keymap.set("n", "<leader>qq", [[<Cmd>q<CR>]], { desc = "quit" })
vim.keymap.set("n", "qb", [[<Cmd>bd<CR>]], { desc = "delete current buffer"})

-- lsp / formating
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format current buffer"})

-- Windows
-- moving windows
vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Window switch left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Window switch bellow" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Window switch above" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Window switch right" })

vim.keymap.set("n", "L", [[<Cmd>bnext<CR>]], { desc = "switch between buffers" })
vim.keymap.set("n", "H", [[<Cmd>bprev<CR>]], { desc = "switch between buffers" })

vim.keymap.set("n", "<leader>H", [[<Cmd>BufferLineMovePrev<CR>]], { desc = "switch between buffers" })
vim.keymap.set("n", "<leader>L", [[<Cmd>BufferLineMoveNext<CR>]], { desc = "switch between buffers" })


--vim.keymap.set("n", "H", [[<Cmd>wincmd H<CR>]], { desc = "Window move left" })
--vim.keymap.set("n", "J", [[<Cmd>wincmd J<CR>]], { desc = "Window move botton" })
--vim.keymap.set("n", "K", [[<Cmd>wincmd K<CR>]], { desc = "Window move top" })
--vim.keymap.set("n", "L", [[<Cmd>wincmd L<CR>]], { desc = "Window move right" })

-- make windows biger and smaller its easyier to use mouse.
--vim.keymap.set("n", "<leader>k", [[<Cmd>horizontal resize -10<CR>]], { desc = "make window bigger"})
--vim.keymap.set("n", "<leader>j", [[<Cmd>horizontal resize +10<CR>]], { desc = "make window bigger"})
--vim.keymap.set("n", "<leader>h", [[<Cmd>vertical resize +10<CR>]], { desc = "make window bigger"})
--vim.keymap.set("n", "<leader>l", [[<Cmd>vertical resize -10<CR>]], { desc = "make window bigger"})

--vim.keymap.set("n", "<leader>ev", [[<Cmd>vsplit<CR>]], { desc = "Window vsplit" })
--vim.keymap.set("n", "<leader>eh", [[<Cmd>split<CR>]], { desc = "Window split" })

--vim.keymap.set("n", "<leader>ex", [[<Cmd>only<CR>]], { desc = "Window focas current, remove others" })

-- tab keymaps
--vim.keymap.set("n", "<leader>tn", [[<Cmd>tabnew<CR>]], { desc = "Tab new" })
--vim.keymap.set("n", "<leader>tx", [[<Cmd>tabclose<CR>]], { desc = "Tab close" })
--vim.keymap.set("n", "<leader>tH", [[<Cmd>tabmove -<CR>]], { desc = "Tab move left" })
--vim.keymap.set("n", "<leader>tL", [[<Cmd>tabmove +<CR>]], { desc = "Tab move right" })
--vim.keymap.set("n", "<leader>tf", [[<Cmd>tabonly<CR>]], { desc = "Tab focas remove all others" })
--vim.keymap.set("n", "<leader>th", [[<Cmd>-tabnext<CR>]], { desc = "Tab switch left" })
--vim.keymap.set("n", "<leader>tl", [[<Cmd>+tabnext<CR>]], { desc = "Tab switch right" })
--vim.keymap.set("n", "<leader>tT", [[<Cmd>wincmd T<CR>]], { desc = "Tab open current buffer in new tab" })

-- terminal key maps

--vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
--vim.keymap.set("t", "jk", [[<C-\><C-n>]])
--vim.keymap.set("t", "kj", [[<C-\><C-n>]])
--vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
--vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
--vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
--vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
--vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
--
----toggleterm keymaps
--vim.keymap.set("n", "<leader>sh", function()
--	vim.cmd("ToggleTerm direction=horizontal")
--end, { desc = "toggle horizontal terminal" })
--
--vim.keymap.set("n", "<leader>sv", function()
--	vim.cmd("ToggleTerm direction=vertical")
--end, { desc = "Toggle vertical Terminal" })
--
--vim.keymap.set("n", "<leader>sf", function()
--	vim.cmd("ToggleTerm direction=float")
--end, { desc = "Toggle floating Terminal" })
