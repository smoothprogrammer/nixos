local telescope = require('telescope')
telescope.setup {
	defaults = {
		file_ignore_patterns = { ".git", "node_modules" },
		mappings = {
			i = {
				["<Esc>"] = "close",
				["<Tab>"] = "move_selection_next",
				["<S-Tab>"] = "move_selection_previous",
			},
			n = {
				["<Tab>"] = "move_selection_next",
				["<S-Tab>"] = "move_selection_previous",
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--no-ignore", -- show .gitignore
			"--hidden", -- show hidden file
			"-L", -- follow symlink
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			follow = true,
			hidden = true,
			no_ignore = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	},
}
telescope.load_extension('fzf')

local builtin = require('telescope.builtin')

local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>p', builtin.find_files, bufopts)
vim.keymap.set('n', '<leader>f', builtin.live_grep, bufopts)
