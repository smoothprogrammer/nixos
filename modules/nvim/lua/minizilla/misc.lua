local map = Lib.keymapper('', { silent = true })
local nmap = Lib.keymapper('n', { silent = true })

require('leap').add_default_mappings()

require('nvim-autopairs').setup()

-- TODO: find out why gleam commentstring is not properly set
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gleam",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

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
  use_default_keymaps = false,
  keymaps = {
    ['g?'] = { 'actions.show_help', mode = 'n', desc = 'Show default keymaps' },
    ['g.'] = { 'actions.toggle_hidden', mode = 'n', desc = 'Toggle hidden files and directories' },
    ['gp'] = { 'actions.preview', mode = 'n', desc = 'Open the entry under the cursor in a preview window, or close the preview window if already open' },
    ['<C-l>'] = { 'actions.refresh', mode = 'n', desc = 'Refresh current directory list' },
    ['<BS>'] = { 'actions.parent', mode = 'n', desc = 'Navigate to the parent path' },
    ['<CR>'] = { 'actions.select', mode = 'n', desc = 'Open the entry under the cursor' },
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name)
      return name == ".."
    end,
  },
}
nmap('<BS>', '<Cmd>Oil<CR>')

require('noice').setup {
  presets = {
    bottom_search = true,          -- use a classic bottom cmdline for search
    command_palette = false,       -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false,            -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,        -- add a border to hover docs and signature help
  },
  cmdline = { format = { filter = { title = 'Shell' } } },
  messages = { enabled = false },
  popupmenu = { enabled = false },
  notify = { enabled = false },
  lsp = {
    signature = { enabled = false },
    hover = { enabled = false },
    progress = { enabled = false },
    message = { enabled = false },
  }
}

require('dressing').setup {
  input = {
    mappings = {
      i = {
        ['<Esc>'] = 'Close'
      }
    }
  },
  -- this might be enable/disable due to elm-language-server annoyingly spawn vim.ui.select
  -- see: https://github.com/elm-tooling/elm-language-server/issues/1298
  select = { enabled = true },
}
