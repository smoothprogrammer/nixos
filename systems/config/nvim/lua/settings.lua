--
-- Options
--

-- Leader key
vim.g.mapleader = ' '

-- Behaviour
vim.opt.hidden = true -- always set this on
vim.opt.wrap = false -- don't wrap line
vim.opt.tabstop = 4 -- tab is 4 spaces
vim.opt.shiftwidth = 4 -- autoindenting is 4 spaces
vim.opt.autoindent = true -- always set this on
vim.opt.number = true -- show line number
vim.opt.relativenumber = true -- show relative number
vim.opt.showmatch = true -- show matching parenthesis
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise
vim.opt.smarttab = true -- insert tabs on the start of a line according to shiftwidth, not tabstop
vim.opt.hlsearch = true -- highlight search terms
vim.opt.incsearch = true -- show search matches as you type
vim.opt.scrolloff = 5 -- maintain 5 lines when scrolling
vim.opt.cursorline = true -- easily spot current cursor
vim.opt.termguicolors = true -- enable some themes
vim.opt.title = true -- change the terminal title
vim.opt.backup = false -- no backup
vim.opt.swapfile = false -- no swapfile

--
-- Key bindings
--

local bufopts = { noremap = true, silent = true }

-- Behaviour
vim.keymap.set('n', ';', ':', bufopts) -- easy command
vim.keymap.set('i', 'jj', '<Esc>', bufopts) -- easy escaping insert mode
vim.keymap.set('n', '<CR>', 'o<Esc>', bufopts) -- easy newline below the cursor in normal mode
vim.keymap.set('n', '<S-CR>', 'O<Esc>', bufopts) -- easy newline above the cursor in normal mode

-- Window
vim.keymap.set('n', '<M-h>', '<C-w>h', bufopts)
vim.keymap.set('n', '<M-j>', '<C-w>j', bufopts)
vim.keymap.set('n', '<M-k>', '<C-w>k', bufopts)
vim.keymap.set('n', '<M-l>', '<C-w>l', bufopts)
vim.keymap.set('n', '<M-H>', '<C-w>H', bufopts)
vim.keymap.set('n', '<M-J>', '<C-w>J', bufopts)
vim.keymap.set('n', '<M-K>', '<C-w>K', bufopts)
vim.keymap.set('n', '<M-L>', '<C-w>L', bufopts)

-- Full time vim don't need arrow key
vim.keymap.set({ 'n', 'v', 'i' }, '<Up>', '<nop>', bufopts)
vim.keymap.set({ 'n', 'v', 'i' }, '<DOWN>', '<nop>', bufopts)
vim.keymap.set({ 'n', 'v', 'i' }, '<LEFT>', '<nop>', bufopts)
vim.keymap.set({ 'n', 'v', 'i' }, '<RIGHT>', '<nop>', bufopts)
vim.keymap.set({ 'n', 'v', 'i' }, '<PageUp>', '<nop>', bufopts)
vim.keymap.set({ 'n', 'v', 'i' }, '<PageDown>', '<nop>', bufopts)
