vim.cmd [[
	" Dracula themes with transparent background
	packadd dracula-vim
	syntax on
	colorscheme dracula
	hi normal guibg=000000

	" Nerdcommenter
	packadd nerdcommenter
	let g:NERDSpaceDelims = 1
	let g:NERDCreateDefaultMappings = 0

	" Hexokinase
	packadd vim-hexokinase
	let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla'
]]

-- NvimTree file explorer
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

-- Lualine status line
require'lualine'.setup()

-- Indent blankline
require'indent_blankline'.setup()

-- Autopairs all kind of bracket
require'nvim-autopairs'.setup()

-- Plugins mappings
vim.keymap.set('', '<C-/>', '<plug>NERDCommenterToggle', {desc = 'Toggle NERDCommenter'})
vim.keymap.set('', '<C-F>', ':NvimTreeToggle<CR>', {desc = 'Toggle NvimTree'})
