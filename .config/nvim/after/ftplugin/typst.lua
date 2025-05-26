local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("tinymist", {
	capabilities = cmp_capabilities,
	on_attach = require("lsp-format").on_attach,
	settings = {
		Typst = {
			formatterMode = "typstyle",
			exportPdf = "onType",
			semanticTokens = "enable"
		}
	}
})

vim.g.typst_conceal = 1
