local lib = require('mz.lib')
local neotest = require('neotest')

neotest.setup {
  adapters = {
    require('neotest-go'),
  },
  consumers = {
    always_open_output = function(client)
      local async = require('neotest.async')
      client.listeners.results = function(adapter_id, results)
        local file_path = async.fn.expand('%:p')
        local row = async.fn.getpos('.')[2] - 1
        local position = client:get_nearest(file_path, row, {})
        if not position then
          return
        end
        local pos_id = position:data().id
        if not results[pos_id] then
          return
        end
        neotest.output.open({ position_id = pos_id, adapter = adapter_id })
      end
    end,
  },
}

local nmap = lib.keymapper('n', { silent = true })
nmap('<Leader>tf', function()
  neotest.run.run(vim.fn.expand('%'))
end, '[t]est [f]ile')
nmap('<Leader>tn', neotest.run.run, '[t]est [n]earest')
nmap('<Leader>tl', neotest.run.run_last, '[t]est [l]ast')
nmap('<Leader>tS', neotest.run.stop, '[t]est [S]top')
nmap('<Leader>to', neotest.output.open, '[t]est [o]pen')
nmap('<Leader>ts', neotest.summary.toggle, '[t]est [s]ummary')
