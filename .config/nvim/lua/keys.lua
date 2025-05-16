local vim = vim
local map = vim.keymap
map.set("n","<C-Tab>","<cmd>bn<cr>")
map.set("n","<C-S-Tab>","<cmd>bp<cr>")
map.set("n","<space>e",vim.diagnostic.open_float,
	{silent = true, desc="Show diagnostic messages"})

map.set("n","<C-l>","<cmd>bn<cr>")
map.set("n","<C-h>","<cmd>bp<cr>")
