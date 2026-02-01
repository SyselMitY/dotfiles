local vim = vim;

vim.cmd("syntax on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent off")

require("nvim-treesitter").install{ "html","c","rust"}

vim.diagnostic.config({
	virtual_lines = true
})

