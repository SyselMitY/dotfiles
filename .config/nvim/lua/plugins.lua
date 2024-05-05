local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")
	Plug("SirVer/ultisnips")
	Plug("lervag/vimtex")
	Plug("majutsushi/tagbar")
	Plug("catppuccin/nvim", {["as"] = "catppuccin"})
	Plug("dag/vim-fish")
	Plug("nvim-tree/nvim-web-devicons")
	Plug("nvim-tree/nvim-tree.lua")
	Plug("akinsho/bufferline.nvim", {["tag"] = "*"})
	Plug("freddiehaddad/feline.nvim")

	Plug("hrsh7th/cmp-nvim-lsp")
	Plug("hrsh7th/cmp-buffer")
	Plug("hrsh7th/cmp-path")
	Plug("hrsh7th/cmp-cmdline")
	Plug("hrsh7th/nvim-cmp")
	Plug("neovim/nvim-lspconfig")

	Plug("quangnguyen30192/cmp-nvim-ultisnips")
	Plug("micangl/cmp-vimtex")

	Plug("HakonHarnes/img-clip.nvim")
vim.call("plug#end")

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


