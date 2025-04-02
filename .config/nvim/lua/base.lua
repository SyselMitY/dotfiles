require("nvim-treesitter.configs").setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}

vim.diagnostic.config({
	virtual_lines = true
})
