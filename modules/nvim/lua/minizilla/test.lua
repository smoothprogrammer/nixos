local neotest = require('neotest')
local coverage = require('coverage')
local hurl = require('hurl')

coverage.setup {
  commands = false,
}

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Add nvim-coverage highlight',
  callback = function()
    vim.cmd([[
        hi CoverageCovered guifg=#859900
        hi CoverageUncovered guifg=#dc322f
        hi CoveragePartial guifg=#b58900
        hi CoverageSummaryHeader gui=bold,underline guisp=fg
        hi! link CoverageSummaryBorder FloatBorder
        hi! link CoverageSummaryNormal NormalFloat
        hi! link CoverageSummaryCursorLine CursorLine
        hi! link CoverageSummaryPass CoverageCovered
        hi! link CoverageSummaryFail CoverageUncovered
      ]])
  end,
})

neotest.setup {
  adapters = {
    require('neotest-go') {
      args = { '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out' },
    },
  },
  consumers = {
    always_open_output = function(client)
      client.listeners.results = function()
        coverage.load()
        coverage.show()
      end
    end,
  },
}

hurl.setup {
  env_file = { '.env' },
}

local nmap = Lib.keymapper('n', { silent = true })
nmap('<Leader>tt', function() neotest.run.run(vim.fn.expand('%:h')) end, '[t]es[t]')
nmap('<Leader>tS', neotest.run.stop, '[t]est [S]top')
nmap('<Leader>to', neotest.output.open, '[t]est [o]pen')
nmap('<Leader>ts', neotest.summary.toggle, '[t]est [s]ummary')
nmap('<Leader>tc', coverage.summary, '[t]est [c]overage')
nmap('<Leader>re', '<Cmd>HurlRunnerAt<CR>', 'run http [re]quest')
nmap('<Leader>rl', '<Cmd>HurlShowLastResponse<CR>', 'show http [r]equest [l]ast response')
