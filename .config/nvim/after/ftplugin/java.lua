local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("jdtls", {
	capabilities = cmp_capabilities
})
