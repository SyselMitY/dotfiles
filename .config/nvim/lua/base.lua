local vim = vim;

vim.opt.runtimepath:prepend("~/.local/share/nvim/treesitter-parsers/")

require("nvim-treesitter.configs").setup {
    parser_install_dir = "~/.local/share/nvim/treesitter-parsers/",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	ensure_installed = {"html",  "c",}
}

vim.diagnostic.config({
	virtual_lines = true
})
