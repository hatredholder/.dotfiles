-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup lua language server
require'lspconfig'.sumneko_lua.setup{
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        completion = {
          callSnippet = 'Replace',
        },
        diagnostics = {
          enable = true,
          globals = {'vim', 'use'},
        },
        telemetry = {enable = false},
      },
    },
    capabilities = capabilities,
}

-- Setup HTML language server
require'lspconfig'.html.setup{
  capabilities = capabilities,
  filetypes = {'html', 'htmldjango'},
}

-- Setup pylsp language server
require'lspconfig'.pylsp.setup{
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pyflakes = {enabled = false},
        pylint = {enabled = false},
        pycodestyle = {enabled = false},
      }
    }
  }
}

