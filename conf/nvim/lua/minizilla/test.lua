local neotest = require('neotest')

neotest.setup {
  adapters = {
    require('neotest-go') {
      args = { '-cover' },
    },
  },
  consumers = {
    always_open_output = function(client)
      client.listeners.results = function()
        neotest.summary.open()
      end
    end,
  },
}

local nmap = Lib.keymapper('n', { silent = true })
nmap('<Leader>tt', function() neotest.run.run(vim.fn.getcwd()) end, '[t]es[t]')
nmap('<Leader>tS', neotest.run.stop, '[t]est [S]top')
nmap('<Leader>to', neotest.output.open, '[t]est [o]pen')
nmap('<Leader>ts', neotest.summary.toggle, '[t]est [s]ummary')
