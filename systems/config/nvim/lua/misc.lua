-- Plugins mappings
vim.keymap.set('', '<C-/>', '<plug>NERDCommenterToggle', { desc = 'Toggle NERDCommenter' })

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

-- Treesitter syntax highlighter
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
	},
}

-- Lualine status line
require('lualine').setup()

-- Indent blankline
require('indent_blankline').setup()

-- Surround (auto and manual)
require('mini.surround').setup()
require('mini.pairs').setup()

-- Git decorations
require('gitsigns').setup()
