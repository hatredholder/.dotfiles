--[[

▄█          ▄████████    ▄███████▄    ▄█        ███    █▄     ▄████████ 
███         ███    ███   ███    ███   ███       ███    ███   ███    ███ 
███         ███    █▀    ███    ███   ███       ███    ███   ███    ███ 
███         ███          ███    ███   ███       ███    ███   ███    ███ 
███       ▀███████████ ▀█████████▀    ███       ███    ███ ▀███████████ 
███                ███   ███          ███       ███    ███   ███    ███ 
███▌    ▄    ▄█    ███   ███          ███▌    ▄ ███    ███   ███    ███ 
█████▄▄██  ▄████████▀   ▄████▀        █████▄▄██ ████████▀    ███    █▀  
     ▀       ▀            ▀        ▀    ▀           ▀▀        ▀

--]]

return {
  --  Mason LSPConfig (required for Mason)
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
  },

  -- Mason - portable  package manager for  Neovim
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
    event = "VeryLazy",
    cmd = "Mason",
  },

  -- Lspsaga -  additional features for Nvim-cmp
  {
    "kkharji/lspsaga.nvim",
    config = function()
      local lspsaga = require 'lspsaga'
      lspsaga.setup { -- defaults ...
        debug = false,
        use_saga_diagnostic_sign = true,
        -- diagnostic sign
        error_sign = "",
        warn_sign = "",
        hint_sign = "",
        infor_sign = "",
        diagnostic_header_icon = "   ",
        -- code action title icon
        code_action_icon = "",
        code_action_prompt = {
          enable = false,
          sign = true,
          sign_priority = 40,
          virtual_text = false,
        },
        finder_definition_icon = "  ",
        finder_reference_icon = "  ",
        max_preview_lines = 10,
        finder_action_keys = {
          open = "o",
          vsplit = "s",
          split = "i",
          quit = "q",
          scroll_down = "<C-f>",
          scroll_up = "<C-b>",
        },
        code_action_keys = {
          quit = "q",
          exec = "<CR>",
        },
        rename_action_keys = {
          quit = "<C-c>",
          exec = "<CR>",
        },
        definition_preview_icon = "  ",
        border_style = "single",
        rename_prompt_prefix = "➤",
        rename_output_qflist = {
          enable = false,
          auto_open_qflist = false,
        },
        server_filetype_map = {},
        diagnostic_prefix_format = "%d. ",
        diagnostic_message_format = "%m %c",
        highlight_prefix = false,
      }
    end,
    event = "BufEnter",
  },

  -- Null-ls -  inject  LSP diagnostics,  code actions, and more
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
          sources = {
              -- lua
              require("null-ls").builtins.formatting.stylua,
              require("null-ls").builtins.completion.spell,

              -- python
              require("null-ls").builtins.diagnostics.ruff,
              require("null-ls").builtins.formatting.black,


              -- golang
              require("null-ls").builtins.formatting.goimports,
              -- require("null-ls").builtins.diagnostics.golangci_lint,
          },
      })
    end,
    event = "VeryLazy",
  },

  -- LuaSnip -  Snippet  Engine written in  Lua. 
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
      require'luasnip'.filetype_extend("html", {"djangohtml"})
    end,
    event = "VeryLazy",
  },
  -- Friendly-snippets - Set of  preconfigured  snippets for different languages
  {
    'rafamadriz/friendly-snippets',
    event = "VeryLazy",
  },

  -- Nvim-cmp - a completion  engine plugin written in  Lua
  {
    "hrsh7th/nvim-cmp",
    config = function()
      vim.g.completeopt="menu, menuone, noselect, noinsert"

      -- Set up nvim-cmp.
      -- local has_words_before = function()
      --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      -- end

      local cmp = require'cmp'

      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,noselect'
        },
        -- experimental = {
        --   ghost_text = {hlgroup = "Comment"}
        -- },
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end,
        },
        window = {
            completion = {
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
              col_offset = -3,
              side_padding = 0,
            },
          },
          formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
              -- Setup Highlight for Codeium
              if entry.source.name == "codeium" then
                vim_item.kind = "  "
                vim_item.menu = "    (Codeium)"
                vim_item.kind_hl_group = "CmpItemKindSnippet"
                return vim_item
              end

              local kind = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
              })(entry, vim_item)
              local strings = vim.split(kind.kind, "%s", { trimempty = true })
              kind.kind = " " .. (strings[1] or "") .. " "
              kind.menu = "    (" .. (strings[2] or "") .. ")"

              return kind
            end,
          },
        -- Setup keybindings
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- elseif has_words_before() then
            --   cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "codeium", priority = 9},
          { name = "neorg", priority = 8},
          { name = 'rg', priority = 7},
          { name = 'nvim_lsp', priority = 6},
          { name = 'luasnip', priority = 5},
          { name = 'buffer', priority = 4},
          { name = 'path', priority = 3},
          { name = 'emoji', priority = 2},
          { name = 'nerdfont', priority = 1},
        })

      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Set configuration for Go
      -- (disable emojis and nerdfont)
      cmp.setup.filetype('go', {
        sources = cmp.config.sources({
          { name = "codeium", priority = 9},
          { name = "neorg", priority = 8},
          { name = 'rg', priority = 7},
          { name = 'nvim_lsp', priority = 6},
          { name = 'luasnip', priority = 5},
          { name = 'buffer', priority = 4},
          { name = 'path', priority = 3},
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      -- Setup Diagnostic Signs
      local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Set up Language Servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Set up Lua Language Server
      require'lspconfig'.lua_ls.setup{
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

      ----- Python setup

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

      ----- Golang setup

      -- Setup gopls
      require'lspconfig'.gopls.setup{
        capabilities = capabilities,
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

      -- Setup golangci_lint
      -- require'lspconfig'.golangci_lint_ls.setup{
      --   command = { "golangci-lint", "run", "--disable", "typecheck", "staticcheck", "unused", "--out-format", "json" }
      -- }

    end,
  },
  {"neovim/nvim-lspconfig"}, ------| 
  {"hrsh7th/cmp-nvim-lsp"}, -------|
  {"hrsh7th/cmp-buffer"}, ---------|   
  {"hrsh7th/cmp-emoji"}, ----------| 
  {"hrsh7th/cmp-path"}, -----------|  Nvim-cmp required plugins
  {"hrsh7th/cmp-cmdline"}, --------|
  {"lukas-reineke/cmp-rg"}, -------|
  {"onsails/lspkind.nvim"}, -------|
  {'saadparwaiz1/cmp_luasnip'}, ---|
  {'chrisgrieser/cmp-nerdfont'}, --|
}
