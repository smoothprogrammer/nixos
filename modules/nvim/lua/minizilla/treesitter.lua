require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "+",
      node_decremental = "-",
    },
  },
}

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
