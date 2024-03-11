require("opts")
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

Auto_mason_lsp = { "clangd", "lua_ls", "pylsp", "cmake" }
Auto_mason_lint = { "cpplint", "pylint" }
Auto_mason_format = { "clang-format", "stylua" }

require("lazy").setup("plugins")
local registry = require("mason-registry")

local packages = registry.get_all_package_names()

local function contains(list, value)
	for _, v in ipairs(list) do
		if v == value then
			return true
		end
	end
	return false
end

local function Masonloop(list)
	for _, i in pairs(list) do
		if not contains(packages, i) then
			vim.cmd("MasonInstall " .. i .. "<CR>")
		end
	end
end

Masonloop(Auto_mason_lint)
Masonloop(Auto_mason_format)
