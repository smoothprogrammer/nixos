-- Use an on_attach function to only map the following keys
-- after the LSP attaches to the current buffer
local on_attach = function(_, bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = {noremap=true, silent=true, buffer=bufnr}
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<C-p>', vim.lsp.diagnostic.goto_prev, bufopts)
	vim.keymap.set('n', '<C-n>', vim.lsp.diagnostic.goto_next, bufopts)

	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- Attach autocompletion capabilities to LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Autocompletion configuration
local luasnip = require'luasnip'
local cmp = require'cmp'
cmp.setup{
	sources = {
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm{select = true},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
}

-- LSP config
local lspconfig = require('lspconfig')
local servers = {'rnix', 'sumneko_lua', 'gopls'}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

lspconfig.sumneko_lua.setup{
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
