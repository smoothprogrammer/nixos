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

-- treesitter based folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 4
vim.opt.foldlevelstart = 99

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
