-- Easy escaping insert mode
vim.keymap.set('i', 'jj', '<Esc>', {noremap = true, desc = 'Escape with jj in the insert mode'})

-- Enter newline without going into insert mode
vim.keymap.set('n', '<CR>', 'o<Esc>', {noremap = true, desc = 'Enter newline below the cursor'})
vim.keymap.set('n', '<S-CR>', 'O<Esc>', {noremap = true, desc = 'Enter newline above the cursor'})

-- Switching window
vim.keymap.set('n', '<M-h>', '<C-w>h', {noremap = true, desc = 'Mapping switch with Alt key'})
vim.keymap.set('n', '<M-j>', '<C-w>j', {noremap = true, desc = 'Mapping switch with Alt key'})
vim.keymap.set('n', '<M-k>', '<C-w>k', {noremap = true, desc = 'Mapping switch with Alt key'})
vim.keymap.set('n', '<M-l>', '<C-w>l', {noremap = true, desc = 'Mapping switch with Alt key'})

-- Moving window
vim.keymap.set('n', '<M-H>', '<C-w>H', {noremap = true, desc = 'Mapping move with Alt key'})
vim.keymap.set('n', '<M-J>', '<C-w>J', {noremap = true, desc = 'Mapping move with Alt key'})
vim.keymap.set('n', '<M-K>', '<C-w>K', {noremap = true, desc = 'Mapping move with Alt key'})
vim.keymap.set('n', '<M-L>', '<C-w>L', {noremap = true, desc = 'Mapping move with Alt key'})

-- Nop Arrow key with PageUp and PageDown
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<nop>', {noremap = true, desc = 'Disable Arrow key'})
vim.keymap.set({'n', 'v', 'i'}, '<DOWN>', '<nop>', {noremap = true, desc = 'Disable Arrow key'})
vim.keymap.set({'n', 'v', 'i'}, '<LEFT>', '<nop>', {noremap = true, desc = 'Disable Arrow key'})
vim.keymap.set({'n', 'v', 'i'}, '<RIGHT>', '<nop>', {noremap = true, desc = 'Disable Arrow key'})
vim.keymap.set({'n', 'v', 'i'}, '<PageUp>', '<nop>', {noremap = true, desc = 'Disable PageUp'})
vim.keymap.set({'n', 'v', 'i'}, '<PageDown>', '<nop>', {noremap = true, desc = 'Disable PageDown'})

-- Plugins mappings
vim.keymap.set('', '<C-/>', '<plug>NERDCommenterToggle', {desc = 'Toggle NERDCommenter'})
vim.keymap.set('', '<C-F>', ':NvimTreeToggle<CR>', {desc = 'Toggle NvimTree'})
