local bufopts = { noremap = true, silent = true }

local dap = require("dap")
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, bufopts)
vim.keymap.set("n", "<F5>", dap.continue, bufopts)

local dapui = require("dapui")
dapui.setup()
vim.keymap.set("n", "<leader>o", dapui.toggle, bufopts)

require("nvim-dap-virtual-text").setup()
require("dap-go").setup()
