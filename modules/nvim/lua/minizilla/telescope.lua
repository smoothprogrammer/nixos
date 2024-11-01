local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local extensions = telescope.extensions
local fb_actions = require('telescope._extensions.file_browser.actions')

telescope.setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.95,
      height = 0.85,
    },
    sorting_strategy = 'ascending',
    prompt_prefix = '  ',
    selection_caret = ' ',
    mappings = {
      i = {
        ['<Esc>'] = actions.close,
        ['jj'] = actions.close,
        ['<Tab>'] = actions.move_selection_next,
        ['<S-Tab>'] = actions.move_selection_previous,
        ['<S-Down>'] = function(prompt_bufnr)
          actions.add_selection(prompt_bufnr)
          actions.move_selection_next(prompt_bufnr)
          actions.add_selection(prompt_bufnr)
        end,
        ['<S-Up>'] = function(prompt_bufnr)
          actions.add_selection(prompt_bufnr)
          actions.move_selection_previous(prompt_bufnr)
          actions.add_selection(prompt_bufnr)
        end,
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
        '-g', '!**/.worktree/*',
        '-g', '!**/node_modules/*',
        '-g', '!**/target/*',
        '-g', '!*.out',
      },
      mappings = {
        i = {
          ['<S-CR>'] = function(prompt_bufnr)
            actions.select_default(prompt_bufnr)
            vim.api.nvim_set_current_dir(vim.fn.expand('%:h'))
          end,
        },
      },
    },
    live_grep = {
      additional_args = {
        '--smart-case', '--follow', '--hidden', '--no-ignore',
        '-g', '!**/.git/*',
        '-g', '!**/.direnv/*',
        '-g', '!**/.worktree/*',
        '-g', '!**/node_modules/*',
        '-g', '!**/target/*',
        '-g', '!*.out',
      },
    },
    help_tags = {
      theme = 'dropdown',
      previewer = false,
    },
    vim_options = {
      theme = 'dropdown',
      previewer = false,
    },
    keymaps = {
      theme = 'dropdown',
      previewer = false,
    },
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      previewer = false,
      path = '%:p:h',
      cwd_to_path = true,
      hijack_netrw = true,
      grouped = true,
      hidden = true,
      follow_symlinks = true,
      quiet = true,
      mappings = {
        ['i'] = {
          ['<S-CR>'] = fb_actions.create_from_prompt,
          ['<C-D>'] = fb_actions.remove,
          ['<C-R>'] = fb_actions.rename,
          ['<C-Y>'] = fb_actions.copy,
          ['<C-P>'] = fb_actions.move,
        },
      },
    },
    cmdline = {
      mappings = {
        complete = '<C-Tab>',
        run_selection = '<CR>',
        run_input = '<C-CR>',
      },
    },
  },
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('manix')
telescope.load_extension('dap')
telescope.load_extension('git_worktree')
telescope.load_extension('rest')
telescope.load_extension('cmdline')

local nmap = Lib.keymapper('n', { silent = true })
nmap('<C-p>', builtin.find_files)
nmap('<C-f>', builtin.current_buffer_fuzzy_find)
nmap('<Leader>ff', builtin.treesitter)
nmap('<Leader>fh', builtin.help_tags)
nmap('<Leader>fo', builtin.vim_options)
nmap('<Leader>fk', builtin.keymaps)
-- nmap('<Leader>fb', extensions.file_browser.file_browser)
nmap('<Leader>fg', extensions.live_grep_args.live_grep_args)
nmap('<Leader>fn', extensions.manix.manix)
nmap('<Leader>en', extensions.rest.select_env)
nmap('<Leader>;', '<Cmd>Telescope cmdline<CR>')
