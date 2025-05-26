local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("dartls", {
	capabilities = cmp_capabilities
})
