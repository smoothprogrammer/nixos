local map = Lib.keymapper('', { silent = true })
local nmap = Lib.keymapper('n', { silent = true })

require('leap').add_default_mappings()

require('nvim-autopairs').setup()

vim.cmd [[
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
]]
map('<C-/>', '<Plug>NERDCommenterToggle')

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
nmap('<Leader>a', mark.add_file)
nmap('<Leader>o', ui.toggle_quick_menu)
nmap('<Leader>1', function() ui.nav_file(1) end)
nmap('<Leader>2', function() ui.nav_file(2) end)
nmap('<Leader>3', function() ui.nav_file(3) end)
nmap('<Leader>4', function() ui.nav_file(4) end)
nmap('<Leader>5', function() ui.nav_file(5) end)
