local lib = require('mz.lib')
local dap = require('dap')
require('dap-go').setup()
require('nvim-dap-virtual-text').setup {}

local nmap = lib.keymapper('n', { silent = true })
nmap('<Leader>db', dap.toggle_breakpoint)
nmap("<leader>dB", function()
  dap.set_breakpoint(vim.fn.input "[DAP] Condition  ")
end)
nmap('<Leader>dd', dap.continue)
nmap('<Leader>dj', dap.step_over)
nmap('<Leader>dl', dap.step_into)
nmap('<Leader>dh', dap.step_out)
