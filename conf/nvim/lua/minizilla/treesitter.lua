require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('treesitter-context').setup()

local nmap = Lib.keymapper('n', { silent = true })
nmap('TP', vim.cmd.TSPlaygroundToggle)
nmap('TK', vim.cmd.TSHighlightCapturesUnderCursor)
nmap('TN', vim.cmd.TSNodeUnderCursor)
