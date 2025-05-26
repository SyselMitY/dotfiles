require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"tinymist",
		"lua_ls",
		"pyright",
		"html",
	}
})

require("lsp-format").setup()

-- Rust is enabled by rustaceanvim plugin automatically
vim.lsp.enable({
	"tinymist",
	"dartls",
	"pyright",
	"html",
})
