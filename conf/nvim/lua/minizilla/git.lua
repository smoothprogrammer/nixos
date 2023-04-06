require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 100,
    ignore_whitespace = false,
  },
}

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = 'fugitive:///*',
  callback = function()
    local nmap = Lib.keymapper('n', { buffer = vim.api.nvim_get_current_buf(), silent = true })
    nmap('<Leader>ps', function() vim.cmd.Git('push') end)
    nmap('<Leader>pl', function() vim.cmd.Git('pull') end)
  end,
})

local nmap = Lib.keymapper('n', { silent = true })
nmap('<Leader>gs', vim.cmd.Git)
nmap('<Leader>gwt', require('telescope').extensions.git_worktree.git_worktrees)
nmap('<Leader>gwc', function()
  local input = vim.fn.input('Create git worktree: ')
  if input == '' then
    return
  end
  require('git-worktree').create_worktree(input, input, 'origin')
end)
