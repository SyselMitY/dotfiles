local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("html", {
	capablilties = cmp_capabilities
})
