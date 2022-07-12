local telescope = require('telescope')
telescope.setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	}
}
telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
local theme = require('telescope.themes')

local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>p', function() builtin.find_files(theme.get_dropdown({ previewer = false })) end, bufopts)
vim.keymap.set('n', '<leader>f', builtin.live_grep, bufopts)
