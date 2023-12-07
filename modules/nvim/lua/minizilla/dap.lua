local dap = require('dap')
require('nvim-dap-virtual-text').setup {}

local nmap = Lib.keymapper('n', { silent = true })
nmap('<Leader>db', dap.toggle_breakpoint)
nmap('<leader>dB', function()
  dap.set_breakpoint(vim.fn.input '[DAP] Condition  ')
end)
nmap('<Leader>dd', dap.continue)
nmap('<Leader>do', dap.repl.open)
nmap('<Leader>dj', dap.step_over)
nmap('<Leader>dl', dap.step_into)
nmap('<Leader>dh', dap.step_out)

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  },
}

dap.configurations.go = {
  {
    type = 'delve',
    name = 'Debug',
    request = 'launch',
    program = '${file}'
  },
  {
    type = 'delve',
    name = 'Debug test', -- configuration for debugging test files
    request = 'launch',
    mode = 'test',
    program = '${file}'
  },
  {
    type = 'delve',
    name = 'Debug test (go.mod)',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}'
  },
}
