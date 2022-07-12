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
		custom = { '^\\.git' },
	},
}

vim.keymap.set('n', '<C-f>', nvimtree.toggle, { desc = 'Toggle NvimTree' })
