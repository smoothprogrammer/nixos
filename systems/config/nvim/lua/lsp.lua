local keymap = function(bufnr)
	local telescope = require('telescope.builtin')

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- goto
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gi', telescope.lsp_implementations, bufopts)
	-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'gr', telescope.lsp_references, bufopts)
	vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

	-- diagnostic
	vim.keymap.set('n', '<C-p>', vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set('n', '<C-n>', vim.diagnostic.goto_next, bufopts)

	-- modify
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

local autosave = function(bufnr)
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.formatting_sync()
		end,
	})
end


local go_autosave = function(bufnr)
	local function go_org_imports(wait_ms)
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
	end

	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.formatting_sync()
			go_org_imports()
		end,
	})
end

-- Autocompletion configuration
local capabilities = require('cmp_nvim_lsp').default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)
local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup {
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm { select = true },
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

-- nix
lspconfig.rnix.setup {
	on_attach = function(_, bufnr)
		keymap(bufnr)
		autosave(bufnr)
	end,
	capabilities = capabilities,
}

-- lua
lspconfig.sumneko_lua.setup {
	on_attach = function(_, bufnr)
		keymap(bufnr)
		autosave(bufnr)
	end,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

-- go
lspconfig.gopls.setup {
	on_attach = function(_, bufnr)
		keymap(bufnr)
		go_autosave(bufnr)
	end,
	capabilities = capabilities,
}

lspconfig.golangci_lint_ls.setup {
	init_options = {
		command = { "golangci-lint", "run", "--out-format", "json", "--fast" },
	},
}
