local lib = require('mz.lib')

local map = lib.keymapper('', { silent = true })
local nmap = lib.keymapper('n', { silent = true })
local imap = lib.keymapper('i', { silent = true })

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
