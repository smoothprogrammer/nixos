local lib = require('mz.lib')
local git_worktree = require('git-worktree')
local extensions = require('telescope').extensions

require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 100,
    ignore_whitespace = false,
  },
}

local nmap = lib.keymapper('n', { silent = true })
nmap('<Leader>gs', vim.cmd.Git)
nmap('<Leader>gwt', extensions.git_worktree.git_worktrees)
nmap('<Leader>gwc', function()
  local input = vim.fn.input('Git worktree name: ')
  if input == '' then
    return
  end
  git_worktree.create_worktree(input, input, 'origin')
end)

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = 'fugitive:///*',
  callback = function()
    local buf_nmap = lib.keymapper('n', { buffer = vim.api.nvim_get_current_buf(), silent = true })
    buf_nmap('<Leader>ps', function() vim.cmd.Git('push') end)
    buf_nmap('<Leader>pl', function() vim.cmd.Git('pull') end)
  end,
})
