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
map('<Leader>mp', '<Plug>MarkdownPreviewToggle')

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
nmap('<Leader>a', mark.add_file)
nmap('<Leader>o', ui.toggle_quick_menu)
nmap('<Leader>1', function() ui.nav_file(1) end)
nmap('<Leader>2', function() ui.nav_file(2) end)
nmap('<Leader>3', function() ui.nav_file(3) end)
nmap('<Leader>4', function() ui.nav_file(4) end)
nmap('<Leader>5', function() ui.nav_file(5) end)
nmap('<Leader>6', function() ui.nav_file(6) end)

require('oil').setup {
  keymaps = {
    ['<BS>'] = 'actions.parent',
  }
}
nmap('<Leader>b', '<Cmd>Oil<CR>')

local noice = require('noice')
noice.setup {
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = false,      -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  routes = {
    { filter = { event = "msg_show", find = "written" } },
    { filter = { event = "msg_show", find = "yanked" } },
    { filter = { event = "msg_show", find = "%d+L, %d+B" } },
    { filter = { event = "msg_show", find = "; after #%d+" } },
    { filter = { event = "msg_show", find = "; before #%d+" } },
    { filter = { event = "msg_show", find = "%d fewer lines" } },
    { filter = { event = "msg_show", find = "%d more lines" } },
    { filter = { event = "msg_show", find = "<ed" } },
    { filter = { event = "msg_show", find = ">ed" } },
  },
}
nmap('<Leader>l', '<Cmd>Noice dismiss<CR>')
