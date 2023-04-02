local lib = require('mz.lib')
local dap = require('dap')
require('dap-go').setup()
require('nvim-dap-virtual-text').setup {}

local nmap = lib.keymapper('n', { silent = true })
nmap('<Leader>b', dap.toggle_breakpoint)
nmap('<Leader>dd', dap.continue)
nmap('<Leader>do', dap.step_over)
nmap('<Leader>di', dap.step_into)
