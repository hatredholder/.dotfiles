--[[

   ▄███████▄  ▄█       ███    █▄     ▄██████▄   ▄█  ███▄▄▄▄      ▄████████     ▄█       ███    █▄     ▄████████ 
  ███    ███ ███       ███    ███   ███    ███ ███  ███▀▀▀██▄   ███    ███    ███       ███    ███   ███    ███ 
  ███    ███ ███       ███    ███   ███    █▀  ███▌ ███   ███   ███    █▀     ███       ███    ███   ███    ███ 
  ███    ███ ███       ███    ███  ▄███        ███▌ ███   ███   ███           ███       ███    ███   ███    ███ 
▀█████████▀  ███       ███    ███ ▀▀███ ████▄  ███▌ ███   ███ ▀███████████    ███       ███    ███ ▀███████████ 
  ███        ███       ███    ███   ███    ███ ███  ███   ███          ███    ███       ███    ███   ███    ███ 
  ███        ███▌    ▄ ███    ███   ███    ███ ███  ███   ███    ▄█    ███    ███▌    ▄ ███    ███   ███    ███ 
 ▄████▀      █████▄▄██ ████████▀    ████████▀  █▀    ▀█   █▀   ▄████████▀     █████▄▄██ ████████▀    ███    █▀  
  ▀           ▀            ▀▀          ▀              ▀          ▀         ▀     ▀           ▀▀       ▀

--]]

return require('lazy').setup({

  -- Impatient - faster  Neovim startup 祥time
  {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end,
  },

  --  Everforest colorscheme
  {
    'sainnhe/everforest',
    config = function()
      vim.cmd([[colorscheme everforest]])
    end,
  },

  -- Treesitter - basic syntax ﯧ highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("nvim-treesitter.configs").setup({
        indent = {
          enable = true,
          disable = {"python"}
        },
        autotag = {
          enable = true,
          filetypes = {"html", "htmldjango"},
        },
        ensure_installed = {"python"},
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
    priority = 100,
    build = ":TSUpdate",
  },

  -- Treesitter-autotag - auto  tags for  HTML 
  {
    'windwp/nvim-ts-autotag',
  },

  -- Treesitter-context -  show  code  context 
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  -- },


  -- Lualine - simple  statusline written in  Lua
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine-config')
    end,
    event = "VeryLazy",
  },

  {
    "utilyre/barbecue.nvim",
    config = function()
      require('barbecue-config')
    end,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    version = "*",
    event = "VeryLazy",
  },

  -- Web-devicons -  icons for some plugins
  {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons-config')
    end,
    lazy = true,
  },

  -- Bbye - better buffer  close command
  {
    "moll/vim-bbye",
  },

  -- Bufferline - a  snazzy buffer line with tabpage integration
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline-config')
    end,
    event = "VeryLazy",
  },

  -- Neo-tree - file explorer  tree for  Neovim
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = function()
      require('neotree-config')
    end,
    cmd = 'Neotree',
    branch = "v2.x",
  },
  {"nvim-lua/plenary.nvim"},

  -- Nui - UI components for some of the plugins
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  -- Autopairs - a powerful  autopair plugin for  Neovim
  {
    "windwp/nvim-autopairs",
    config = function()
      require('autopairs-config')
    end,
    event = "VeryLazy",
  },

  -- Which-key - plugin that  displays a popup with available  key bindings
  {
    "folke/which-key.nvim",
    config = function()
      require('which-key-config')
    end,
    event = "VeryLazy",
  },

  -- Telescope -  highly extendable fuzzy finder over  lists
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope-config')
    end,
    cmd = "Telescope",
    tag = '0.1.0',
  },

  -- Undotree -  undo  history  visualizer 
  {
    'mbbill/undotree',
  },

  --  Mason LSPConfig (required for Mason)
  {
    "williamboman/mason-lspconfig.nvim",
  },

  -- Mason - portable  package manager for  Neovim
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason-config")
    end,
  },

  -- Nvim-cmp - a completion  engine plugin written in  Lua
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('lsp')
    end,
  }, ----------------------------|
  {'neovim/nvim-lspconfig'}, ----| 
  {'hrsh7th/cmp-nvim-lsp'}, -----|
  {'hrsh7th/cmp-buffer'}, -------|  Nvim-cmp required plugins
  {'hrsh7th/cmp-path'}, ---------| 
  {'hrsh7th/cmp-cmdline'}, ------|
  {'onsails/lspkind.nvim'}, -----|

  -- Lspsaga -  additional features for Nvim-cmp
  {
    'kkharji/lspsaga.nvim',
    config = function()
      require('lspsaga-config')
    end,
  },

  -- Colorizer - a high-performance color ﯧ highlighter
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- Gitsigns - fast  Git decorations
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Dashboard - fancy  Neovim startscreen
  {
    'glepnir/dashboard-nvim',
    config = function()
      require('dashboard-config')
    end,
    commit = 'e517188dab55493fb9034b4d4f1a508ccacfcd45',
    event = "VimEnter",
  },

  -- Indent-blankline - adds  indentation guides to all lines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('blankline-config')
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Toggleterm - persist and toggle multiple  terminals
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require('toggleterm-config')
    end,
  },

  -- Comment - toggle  comments in any language
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({comment_empty=false})
    end,
  },

  -- Session-manager - manage sessions like  folders
  {
    'Shatur/neovim-session-manager',
    config = function()
      require('session-manager-config')
    end,
  },

  -- Smart-splits -  smart, ﱿ directional split resizing and  navigation
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smartsplits-config')
    end,
  },

  -- Noice - completely replaces the  UI for messages,  cmdline and the  popupmenu
  {
    "folke/noice.nvim",
    config = function()
      require('noice-config')
    end,
  },

  -- Notify - a  fancy and  configurable  notification manager
  {
    "rcarriga/nvim-notify",
    config = function()
      require('notify-config')
    end,
  },

  -- Null-ls -  inject  LSP diagnostics,  code actions, and more
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('null-ls-config')
    end,
  },

  -- Presence - activity in ﭮ Discord 
  {
    'andweeb/presence.nvim',
    config = function()
      require('presence-config')
    end,
  },

  -- Dap - Debug Adapter Protocol client implementation ( debugger)
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('dap-config')
    end,
  },

  --  UI for Nvim-dap
  {
    'rcarriga/nvim-dap-ui',
  },

  -- virtual  text for Nvim-dap
  {
    'theHamsta/nvim-dap-virtual-text',
  },

  -- Drop -  pretty particles for Dashboard
  {
    "folke/drop.nvim",
    config = function()
      require("drop").setup({
        theme = "leaves",
        max = 25,
        screensaver = false,
      })
    end,
    event = "VimEnter",
  },

  -- Scrollbar - extensible  Neovim scrollbar that shows  Git changes
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar-config')
    end,
  },

  -- Leap - an  interface that makes on-screen  navigation  quicker
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
    event = "VeryLazy",
  },

  -- Python-pep8-indent - indent fix for  Python
  {
    'Vimjas/vim-python-pep8-indent',
    ft = "python",
  },

  -- Cellular-automaton -  useless but  fancy animations for﬘ buffer text
  {
    'Eandrju/cellular-automaton.nvim',
  },

  -- Chafa -  image  viewer in  Neovim through Chafa
  {
    'princejoogie/chafa.nvim',
    config = function()
      require("chafa").setup({
        render = {
          min_padding = 5,
          show_label = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      })
    end,
  },

  {'m00qek/baleia.nvim'},

  -- Todo-comments - ﯦ highlight,  list and  search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({
        sign_priority = 6,
      })
    end,
    cmd = {"TodoTelescope"},
  },

  -- Mini.animate - 𧻓animations for cursor, scroll, windows
  {
    'echasnovski/mini.animate',
    config = function()
      require('mini.animate').setup({
        scroll = {
          enable = false,
        },
      })
    end,
  },

  -- Mini.move -  move blocks of text in any  direction 
  {
    'echasnovski/mini.move',
    config = function()
      require('mini.move').setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<S-h>',
          right = '<S-l>',
          down = '<S-j>',
          up = '<S-k>',

          -- Move current line in Normal mode
          line_left = '<Nop>',
          line_right = '<Nop>',
          line_down = '<Nop>',
          line_up = '<Nop>',
        },
      })
    end,
  },

  -- Dressing -  plugin to improve the default  vim.ui  interfaces 
  {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup({
        select = {
          backend = { "fzf_lua"},
        },
      })
    end,
    event = "VeryLazy",
  },

  -- Fzf-lua - improved fzf.vim written in  Lua 
  {
    'ibhagwan/fzf-lua'
  },

  -- Numb - :number command  peeking 
  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end,
  },

  -- UFO -  VSCode-like  folding in  Neovim
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {{
        "kevinhwang91/promise-async",
        {
          "luukvbaal/statuscol.nvim",
          config = function()
            require("statuscol").setup(
              {
                foldfunc = "builtin",
                setopt = true
              }
            )
          end
        }
      }},
    config = function()
      require('ufo').setup({
        provider_selector = function()
            return {'treesitter', 'indent'}
        end
      })
    end,
  },

  -- Illuminate -  plugin for automatically ﯧ highlighting other uses of the  word
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        min_count_to_highlight = 2,
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Mini.indentscope -  visualize and  operate on indent  scope
  {
    'echasnovski/mini.indentscope',
    config = function()
      require('mini.indentscope').setup({
        symbol = "│",
        options = { try_as_border = true },
      })
      vim.api.nvim_create_autocmd("FileType", {
      pattern = {'packer', 'neo-tree', "dashboard", "TelescopePrompt", "DiffviewFilePanel", "diff", "undotree"},
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Modicator -  cursor  line number mode  colorful indicator
  {
    'mawkler/modicator.nvim',
    dependencies = "sainnhe/everforest",
    config = function()
      vim.cmd([[set cursorline]])
      require('modicator-config')
    end,
  },

})
