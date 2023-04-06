local lualine = require('lualine')

local sections = lualine.get_config().sections
sections.lualine_c = {
  {
    'filename',
    path = 1,
    symbols = {
      unnamed = '',
      newfile = '',
    },
  },
}

local inactive_sessions = sections
inactive_sessions.lualine_c = {
  {
    'filename',
    path = 1,
    symbols = {
      unnamed = '',
      newfile = '',
      modified = '',
      readonly = '',
    },
  },
}

lualine.setup {
  options = {
    globalstatus = true,
  },
  sections = sections,
  inactive_sections = inactive_sessions,
}

require('indent_blankline').setup()

require('nvim-web-devicons').setup()

require('colorizer').setup {
  user_default_options = {
    names = false,
  },
}
