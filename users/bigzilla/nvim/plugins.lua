vim.cmd [[
	" Dracula themes with transparent background
	packadd dracula-vim
	syntax on
	colorscheme dracula
	hi normal guibg=000000

	" Nerdcommenter
	packadd nerdcommenter
	let g:NERDSpaceDelims = 1
]]

-- NvimTree file explorer
vim.opt.termguicolors = true
require'nvim-tree'.setup{
	disable_netrw = true,
	hijack_cursor = true,
	open_on_setup = true,
	view = {
		hide_root_folder = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	filters = {
		custom = {"^\\.git"},
	},
}

-- Treesitter syntax highlighter
require'nvim-treesitter.configs'.setup{
	highlight = {
		enable = true,
	},
}

-- Colorizer color highlighter
require'colorizer'.setup{}

-- Lualine status line
require'lualine'.setup{}

-- Indent blankline
require'indent_blankline'.setup{}

-- Autopairs all kind of bracket
require'nvim-autopairs'.setup{}

-- LSP
require'lspconfig'.gopls.setup{}
require'lspconfig'.rnix.setup{}

-- Autocompletion
require'cmp'.setup{}
