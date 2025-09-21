vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

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
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 4
vim.opt.hlsearch = true


-- makes the line you yank with "yy" flash
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Normal mode keymaps

-- disables arrow keys for movement
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- window nav with ctrl + (h,j,k,l)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- easy save with leader + w
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "[WW]orkspace save buffer" })

-- ctrl + n,p for moving between buffers on the current window
vim.keymap.set("n", "<C-n>", [[<Cmd>bnext<CR>]], { desc = "switch between buffers" })
vim.keymap.set("n", "<C-p>", [[<Cmd>bprev<CR>]], { desc = "switch between buffers" })

-- Insert move keymaps

vim.keymap.set("i", "jk", "<Esc>", { desc = "Insert mode smash esc" })

vim.diagnostic.config({
  virtual_text = true, -- enables inline errors/warnings
  signs = true,
  underline = true,
  update_in_insert = false, -- set to true if you want diagnostics while typing
  severity_sort = true,
})


vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "toggle vim dignostics", silent = true, noremap = true })

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
end )
