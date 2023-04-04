local lib = require('mz.lib')

local map = lib.keymapper('', { silent = true })
local nmap = lib.keymapper('n', { silent = true })
local imap = lib.keymapper('i', { silent = true })
local xmap = lib.keymapper('x', { silent = true })

vim.g.mapleader = ' '

imap('jj', '<Esc>')
map('.', ';')
map('<Leader>.', '.')
xmap('<Leader>p', '"_dP')
nmap('<Leader>cd', function() vim.api.nvim_set_current_dir(vim.fn.expand('%:h')) end)
nmap(';w', ':w<CR>')
nmap(';q', ':q<CR>')
nmap('<CR>', 'o<Esc>')
nmap('<S-CR>', 'O<Esc>')
nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')

map('<Left>', '<Nop>')
map('<Down>', '<Nop>')
map('<Up>', '<Nop>')
map('<Right>', '<Nop>')
map('<PageUp>', '<Nop>')
map('<PageDown>', '<Nop>')
