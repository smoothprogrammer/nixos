require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = '+',
      node_decremental = '-',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['a='] = '@assignment.outer',
        ['i='] = '@assignment.inner',
        ['l='] = '@assignment.lhs',
        ['r='] = '@assignment.rhs',

        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',

        ['ai'] = '@conditional.outer',
        ['ii'] = '@conditional.inner',

        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',

        ['af'] = '@call.outer',
        ['if'] = '@call.inner',

        ['am'] = '@function.outer',
        ['im'] = '@function.inner',

        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<Leader>na'] = '@parameter.inner',
      },
      swap_previous = {
        ['<Leader>pa'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
      },
    },
  },
}

-- NVIM v0.10.2 contains annoying warning when the buffer have no treesitter parser
-- Re-enable the fold after the fixes get merged
-- https://github.com/neovim/neovim/pull/30382
--
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.opt.foldlevel = 4
-- vim.opt.foldlevelstart = 99

require('treesitter-context').setup {
  enable = true,
  max_lines = 1,
  min_window_height = 1,
  separator = '─',
}

local nmap = Lib.keymapper('n', { silent = true })
nmap('TP', vim.cmd.TSPlaygroundToggle)
nmap('TK', vim.cmd.TSHighlightCapturesUnderCursor)
nmap('TN', vim.cmd.TSNodeUnderCursor)
