local neotest = require('neotest')
local coverage = require('coverage')

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
      args = { '-coverprofile=coverage.out' },
    },
  },
  consumers = {
    always_open_output = function(client)
      client.listeners.results = function()
        neotest.summary.open()
        coverage.load()
        coverage.show()
      end
    end,
  },
}


local nmap = Lib.keymapper('n', { silent = true })
nmap('<Leader>tt', function() neotest.run.run(vim.fn.getcwd()) end, '[t]es[t]')
nmap('<Leader>tS', neotest.run.stop, '[t]est [S]top')
nmap('<Leader>to', neotest.output.open, '[t]est [o]pen')
nmap('<Leader>ts', neotest.summary.toggle, '[t]est [s]ummary')
nmap('<Leader>tc', coverage.summary, '[t]est [c]overage')
