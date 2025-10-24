local vim = vim;

vim.cmd("syntax on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent off")

require("nvim-treesitter.configs").setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	ensure_installed = {"html",  "c", "rust"}
}

vim.diagnostic.config({
	virtual_lines = true
})
