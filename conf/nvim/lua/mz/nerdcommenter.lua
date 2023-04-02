local lib = require('mz.lib')

local map = lib.keymapper('', { silent = true })
map('<C-_>', '<Plug>NERDCommenterToggle')

vim.cmd [[
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
]]
