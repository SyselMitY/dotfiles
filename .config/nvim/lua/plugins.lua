local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")
Plug("SirVer/ultisnips")
Plug("lervag/vimtex")
Plug("rust-lang/rust.vim")

Plug("chomosuke/typst-preview.nvim")
Plug("williamboman/mason.nvim")
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason-lspconfig.nvim")
Plug("lukas-reineke/lsp-format.nvim")

Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
Plug("majutsushi/tagbar")
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })
Plug("dag/vim-fish")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")
Plug("akinsho/bufferline.nvim", { ["tag"] = "*" })
Plug("freddiehaddad/feline.nvim")

Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
--	Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/nvim-cmp", { ["commit"] = "b356f2c" })
Plug("neovim/nvim-lspconfig")
Plug("windwp/nvim-ts-autotag")
Plug("folke/which-key.nvim")
Plug("JASONews/glow-hover")

Plug("quangnguyen30192/cmp-nvim-ultisnips")
Plug("micangl/cmp-vimtex")

Plug("HakonHarnes/img-clip.nvim")
vim.call("plug#end")

require("nvim-ts-autotag").setup({})

require("catppuccin").setup({
	flavour = "macchiato",
	integrations = {
		nvimtree = true,
		treesitter = true,
	}
})

vim.cmd.colorscheme "catppuccin"

require("nvim-tree").setup({})
require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get()
})

local ctp_feline = require("catppuccin.groups.integrations.feline")
require("feline").setup({
	components = ctp_feline.get(),
})

require("img-clip").setup({
	default = {
		relative_to_current_file = true
	}
})

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"tinymist",
		"lua_ls",
		"pyright",
		"html"
	}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig")["tinymist"].setup {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "enable"
	},
	capabilities = capabilities,
	on_attach = require("lsp-format").on_attach
}

require("lspconfig").dartls.setup {
	capabilities = capabilities
}
require("lspconfig").lua_ls.setup {
	capabilities = capabilities
}

require("lspconfig").pyright.setup {}

-- vim.lsp.config("html", {
	-- capabilities = capabilities
	-- })
-- vim.lsp.enable("html")

require("lspconfig").html.setup{
	capabilities = capabilities
	}

require("which-key").setup {}

require("glow-hover").setup {}

local _border = "rounded"

local function bordered_hover(_opts)
	_opts = _opts or {}
	return vim.lsp.buf.hover(vim.tbl_deep_extend("force", _opts, {
		border = _border
	}))
end

local function bordered_signature_help(_opts)
	_opts = _opts or {}
	return vim.lsp.buf.signature_help(vim.tbl_deep_extend("force", _opts, {
		border = _border
	}))
end

-- opts and _opts aren't the same
vim.keymap.set("n", "K", bordered_hover, opts)
vim.keymap.set("i", "<C-s>", bordered_signature_help, opts)

--vim.api.nvim_create_autocmd("LspAttach", {
--	group = vim.api.nvim_create_augroup("my.lsp", {}),
--	callback = function(args)
--		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--		if client:supports_method("textDocument/formatting")
--		--and not client:supports_method("textDocument/willSaveWaitUntil")
--		then
--			vim.api.nvim_create_autocmd("BufWritePre", {
--				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
--				buffer = args.buf,
--				callback = function()
--					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
--				end
--			})
--		end
--	end,
--})
