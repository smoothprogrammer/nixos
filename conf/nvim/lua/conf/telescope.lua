local telescope = require('telescope')
local actions = require('telescope.actions')
local fb_actions = require('telescope._extensions.file_browser.actions')

telescope.setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.95,
      height = 0.85,
    },
    prompt_prefix = '  ',
    selection_caret = ' ',
    mappings = {
      i = {
        ['<Esc>'] = actions.close,
        ['jj'] = actions.close,
        ['<Tab>'] = actions.toggle_selection,
        ['<S-Tab>'] = actions.drop_all,
        ['<S-Down>'] = actions.add_selection + actions.move_selection_next + actions.add_selection,
        ['<S-Up>'] = actions.add_selection + actions.move_selection_previous + actions.add_selection,
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
  extensions = {
    file_browser = {
      theme = 'dropdown',
      previewer = false,
      hijack_netrw = true,
      grouped = true,
      hidden = true,
      quiet = true,
      mappings = {
        ['i'] = {
          ['<S-CR>'] = fb_actions.create_from_prompt,
          ['<C-D>'] = fb_actions.remove,
          ['<C-R>'] = fb_actions.rename,
          ['<C-Y>'] = fb_actions.copy,
        },
      },
    },
  },
}

telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('file_browser')
telescope.load_extension('manix')
telescope.load_extension('gh')
