local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- Utils
Plug("SirVer/ultisnips")
Plug("mfussenegger/nvim-dap")
Plug("dag/vim-fish")
Plug("folke/which-key.nvim")
Plug("lambdalisue/vim-suda")

-- Looks
Plug("majutsushi/tagbar")
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")
Plug("akinsho/bufferline.nvim", { ["tag"] = "*" })
--Plug("freddiehaddad/feline.nvim")
Plug("nvim-lualine/lualine.nvim")
Plug("JASONews/glow-hover")
Plug("rcarriga/nvim-notify")
Plug("stevearc/dressing.nvim")

-- Autocomplete
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("quangnguyen30192/cmp-nvim-ultisnips")
Plug("micangl/cmp-vimtex")
Plug("hrsh7th/nvim-cmp")
-- Plug("hrsh7th/nvim-cmp", { ["commit"] = "b356f2c" })

-- Language Utils
Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
Plug("windwp/nvim-ts-autotag")
Plug("HakonHarnes/img-clip.nvim")

-- LSP
Plug("mason-org/mason.nvim")
Plug("neovim/nvim-lspconfig")
Plug("mason-org/mason-lspconfig.nvim")
Plug("lukas-reineke/lsp-format.nvim")

-- Languages
Plug("mrcjkb/rustaceanvim")
Plug("isobit/vim-caddyfile")

Plug("chomosuke/typst-preview.nvim")
Plug("kaarmu/typst.vim")

Plug("kiyoon/jupynium.nvim", {["do"] = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python"})

Plug("lervag/vimtex")

vim.call("plug#end")

require("nvim-ts-autotag").setup({})

require("catppuccin").setup({
	flavour = "macchiato",
	integrations = {
		nvimtree = true,
		treesitter = true,
		mason = true
	}
})

vim.cmd.colorscheme "catppuccin"

require("nvim-tree").setup({})
require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get()
})

require("lualine").setup({
	options = {
		theme = "catppuccin"
	}
})

-- local ctp_feline = require("catppuccin.groups.integrations.feline")
-- require("feline").setup({
--	components = ctp_feline.get(),
--})

require("img-clip").setup({
	default = {
		relative_to_current_file = true
	}
})

require("jupynium").setup({
	auto_start_sync = {
		enable = true
	}
})

require("which-key").setup {}

require("glow-hover").setup {}

vim.o.winborder = "rounded"

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
--vim.keymap.set("n", "K", bordered_hover, opts)
--vim.keymap.set("i", "<C-s>", bordered_signature_help, opts)
