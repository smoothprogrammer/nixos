require('neodev').setup {
  library = { plugins = 'neotest' },
}

local cmp = require('cmp')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local telescope_builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local nmap = Lib.keymapper('n', { silent = true, buffer = ev.buf })
    nmap('[d', vim.diagnostic.goto_prev)
    nmap(']d', vim.diagnostic.goto_next)
    nmap('gd', telescope_builtin.lsp_definitions, '[g]oto [d]efinitions')
    nmap('gD', telescope_builtin.lsp_type_definitions, '[g]oto type [D]efinitions')
    nmap('gi', telescope_builtin.lsp_implementations, '[g]oto [i]mplementations')
    nmap('gr', telescope_builtin.lsp_references, '[g]oto [r]eferences')
    nmap('K', vim.lsp.buf.hover)
    nmap('<Leader>ds', telescope_builtin.lsp_document_symbols, '[d]ocument [s]ymbols')
    nmap('<Leader>ws', telescope_builtin.lsp_workspace_symbols, '[w]orkspace [s]ymbols')
    nmap('<Leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
    nmap('<Leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
    nmap('<Leader>rr', '<Cmd>LspRestart<CR>')

    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })

    vim.api.nvim_set_hl(0, 'FloatBorder', {})
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = 'rounded',
      }
    )
    vim.diagnostic.config {
      float = { border = "rounded" },
    }
  end,
})

require('lspconfig.ui.windows').default_options.border = 'rounded'

cmp.setup {
  window = {
    completion = {
      border = 'rounded',
    },
    documentation = {
      border = 'rounded',
    },
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'go_pkgs' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
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


lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false, semantic = { enable = false } },
      telemetry = { enable = false },
    },
  },
}

lspconfig.nixd.setup {
  capabilities = capabilities,
  settings = {
    nixd = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
}

lspconfig.gopls.setup {
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
}

lspconfig.zls.setup {
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      },
    },
  },
}

lspconfig.jdtls.setup {
  capabilities = capabilities,
}

lspconfig.elmls.setup {
  capabilities = capabilities,
}

lspconfig.gleam.setup {
  capabilities = capabilities,
}

lspconfig.dartls.setup {
  capabilities = capabilities,
}
