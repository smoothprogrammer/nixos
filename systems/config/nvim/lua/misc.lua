-- Plugins mappings
vim.keymap.set('', '<C-/>', '<plug>NERDCommenterToggle', { desc = 'Toggle NERDCommenter' })
vim.keymap.set('', '<C-_>', '<plug>NERDCommenterToggle', { desc = 'Toggle NERDCommenter' })
vim.keymap.set('', '<leader>mp', '<plug>MarkdownPreviewToggle', { desc = 'Toggle MarkdownPreview' })

vim.cmd [[
	" Nerdcommenter
	packadd nerdcommenter
	let g:NERDSpaceDelims = 1
	let g:NERDCreateDefaultMappings = 0

	" Clever f
	let g:clever_f_across_no_line = 1

	" Markdown Preview
	packadd markdown-preview.nvim
	function! g:OpenBrowser(url)
		silent exec "!brave --new-window " . a:url
	endfunction
	let g:mkdp_browserfunc = 'g:OpenBrowser'
]]

-- Treesitter syntax highlighter
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
	},
}

require('colorizer').setup({ '*' }, {
	names = false,
})

-- Lualine status line
require('lualine').setup()

-- Indent blankline
require('indent_blankline').setup()

-- Surround (auto and manual)
require('mini.surround').setup()
require('mini.pairs').setup()

-- Git decorations
require('gitsigns').setup()

local nvimtree = require('nvim-tree')
nvimtree.setup {
	disable_netrw = true,
	hijack_cursor = true,
	open_on_setup = false,
	view = {
		hide_root_folder = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	filters = {
		custom = { '^\\.git$' },
	},
}
vim.keymap.set('n', '<C-f>', nvimtree.toggle, { desc = 'Toggle NvimTree' })
