local map = function(lhs, rhs)
  vim.keymap.set('', lhs, rhs, { silent = true })
end

local nmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, { silent = true })
end

local imap = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { silent = true })
end

vim.g.mapleader = ' '

map('.', ';')
map('<Leader>.', '.')
imap('jj', '<Esc>')
nmap(';w', ':w<CR>')
nmap(';q', ':q<CR>')
nmap('<CR>', 'o<Esc>')
nmap('<S-CR>', 'O<Esc>')
map('<Left>', '<Nop>')
map('<Down>', '<Nop>')
map('<Up>', '<Nop>')
map('<Right>', '<Nop>')
map('<PageUp>', '<Nop>')
map('<PageDown>', '<Nop>')

local telescope_builtin = require('telescope.builtin')
local telescope_extensions = require('telescope').extensions
nmap('<C-p>', telescope_builtin.find_files)
nmap('<C-f>', telescope_builtin.live_grep)
nmap('<C-b>', telescope_extensions.file_browser.file_browser)
nmap('<C-x>', telescope_extensions.manix.manix)

-- lsp
nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufopts = { silent = true, buffer = ev.buf }
    vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, bufopts)
    vim.keymap.set('n', 'gD', telescope_builtin.lsp_type_definitions, bufopts)
    vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>ds', telescope_builtin.lsp_document_symbols, bufopts)
    vim.keymap.set('n', '<leader>ws', telescope_builtin.lsp_workspace_symbols, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.formatting_sync()
      end,
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
        vim.lsp.buf.code_action({
          context = {
            only = { 'source.organizeImports' }
          },
          apply = true,
        })
      end,
    })
  end,
})

map('<C-_>', '<Plug>NERDCommenterToggle')
