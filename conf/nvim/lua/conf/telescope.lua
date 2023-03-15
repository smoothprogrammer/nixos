local telescope = require('telescope')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<Esc>'] = 'close',
        ['<Tab>'] = 'move_selection_next',
        ['<S-Tab>'] = 'move_selection_previous',
      },
      n = {
        ['<Tab>'] = 'move_selection_next',
        ['<S-Tab>'] = 'move_selection_previous',
      },
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      previewer = false,
      find_command = {
        'rg', '--files',
        '--smart-case', '--follow', '--hidden', '--no-ignore',
        '-g', '!**/.git/*',
        '-g', '!**/.direnv/*',
        '-g', '!**/node_modules/*',
      },
    },
    live_grep = {
      additional_args = {
        '--smart-case', '--follow', '--hidden', '--no-ignore',
        '-g', '!**/.git/*',
        '-g', '!**/.direnv/*',
        '-g', '!**/node_modules/*',
      },
    },
  },
}

telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('file_browser')
