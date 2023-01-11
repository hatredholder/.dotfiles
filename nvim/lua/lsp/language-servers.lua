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

require'lspconfig'.gopls.setup{
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities
--         -- you can add other fields for setting up lsp server in this table
--     })
-- end
-- require('ufo').setup()
