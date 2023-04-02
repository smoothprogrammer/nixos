local lib = require('mz.lib')
local cmp = require('cmp')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local telescope_builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local nmap = lib.keymapper('n', { silent = true, buffer = ev.buf })
    nmap('[d', vim.diagnostic.goto_prev)
    nmap(']d', vim.diagnostic.goto_next)
    nmap('gd', telescope_builtin.lsp_definitions, '[g]oto [d]efinitions')
    nmap('gT', telescope_builtin.lsp_type_definitions, '[g]oto [T]ype definitions')
    nmap('gi', telescope_builtin.lsp_implementations, '[g]oto [i]mplementations')
    nmap('gr', telescope_builtin.lsp_references, '[g]oto [r]eferences')
    nmap('K', vim.lsp.buf.hover)
    nmap('<leader>ds', telescope_builtin.lsp_document_symbols)
    nmap('<leader>ws', telescope_builtin.lsp_workspace_symbols)
    nmap('<leader>rn', vim.lsp.buf.rename)
    nmap('<leader>ca', vim.lsp.buf.code_action)

    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end,
})

cmp.setup {
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
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

lspconfig.lua_ls.setup {
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
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.rnix.setup {
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  capabilities = capabilities,
}
