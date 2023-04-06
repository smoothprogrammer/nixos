local map = Lib.keymapper('', { silent = true })
local nmap = Lib.keymapper('n', { silent = true })
local imap = Lib.keymapper('i', { silent = true })
local vmap = Lib.keymapper('v', { silent = true })

vim.g.mapleader = ' '

imap('jj', '<Esc>')
map('.', ';')

map('<Leader>.', '.')
vmap('<Leader>p', '"_dP')
nmap('<Leader>cd', function() vim.api.nvim_set_current_dir(vim.fn.expand('%:h')) end)

nmap(';w', ':w<CR>')
nmap(';q', ':q<CR>')

nmap('<CR>', 'o<Esc>')
nmap('<S-CR>', 'O<Esc>')

nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')

vmap('J', [[:m '>+1<CR>gv=gv]])
vmap('K', [[:m '<-2<CR>gv=gv]])

nmap('J', 'mzJ`z')

map('<Left>', '<Nop>')
map('<Down>', '<Nop>')
map('<Up>', '<Nop>')
map('<Right>', '<Nop>')
map('<PageUp>', '<Nop>')
map('<PageDown>', '<Nop>')
