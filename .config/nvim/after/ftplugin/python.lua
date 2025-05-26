local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("pyright", {
	capabilities = cmp_capabilities
})
