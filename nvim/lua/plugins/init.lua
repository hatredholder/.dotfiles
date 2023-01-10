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

return require('packer').startup(function(use)

  use {'wbthomason/packer.nvim'} -- Packer - needs no introduction ¯\_(ツ)_/¯

  -- Impatient - faster  Neovim startup 祥time
  use {
    'lewis6991/impatient.nvim',
    config="require('impatient')",
  }

  use {'sainnhe/everforest'} --  Everforest colorscheme

  -- Treesitter - basic syntax ﯧ highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = "require('treesitter-config')",
    event = "BufWinEnter",
    run = ":TSUpdate",
  }

  -- Treesitter-autotag - auto  tags for  HTML 
  use {
    'windwp/nvim-ts-autotag',
    after = "nvim-treesitter",
  }

  -- Treesitter-context -  show  code  context 
  use {
    'nvim-treesitter/nvim-treesitter-context'
  }


  -- Lualine - simple  statusline written in  Lua
  use {
    "nvim-lualine/lualine.nvim",
    config = "require('lualine-config')",
    event = "BufRead",
  }

  -- Web-devicons -  icons for some plugins
  use {
    'kyazdani42/nvim-web-devicons',
    config = "require('nvim-web-devicons-config')",
  }

  -- Bbye - better buffer  close command
  use {
    "moll/vim-bbye",
    event = "BufWinEnter",
  }

  -- Bufferline - a  snazzy buffer line with tabpage integration
  use {
    'akinsho/bufferline.nvim',
    config = "require('bufferline-config')",
    event = "BufWinEnter",
    -- tag = "v2.*",
  }

  -- Neo-tree - file explorer  tree for  Neovim
  use {
    'nvim-neo-tree/neo-tree.nvim',
    config = "require('neotree-config')",
    cmd = {'Neotree'},
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }

  -- Autopairs - a powerful  autopair plugin for  Neovim
  use {
    "windwp/nvim-autopairs",
    config = "require('autopairs-config')",
    after = "nvim-cmp",
  }

  -- Which-key - plugin that  displays a popup with available  key bindings
  use {
    "folke/which-key.nvim",
    config = "require('which-key-config')",
    event = "BufWinEnter",
  }

  -- Telescope -  highly extendable fuzzy finder over  lists
  use {
    'nvim-telescope/telescope.nvim',
    config = "require('telescope-config')",
    -- cmd = "Telescope",
    tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim'},
  }

  -- Undotree -  undo  history  visualizer 
  use {
    'mbbill/undotree',
  }

  use {"williamboman/mason-lspconfig.nvim"} --  Mason LSPConfig (required for Mason)

  -- Mason - portable  package manager for  Neovim
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason-config")
    end,
  }

  -- Nvim-cmp - a completion  engine plugin written in  Lua
  use {
    'hrsh7th/nvim-cmp',
    config = "require('lsp')",
  } ------------------------------|
  use {'neovim/nvim-lspconfig'} --| 
  use {'hrsh7th/cmp-nvim-lsp'} ---|
  use {'hrsh7th/cmp-buffer'} -----|  Nvim-cmp required plugins
  use {'hrsh7th/cmp-path'} -------| 
  use {'hrsh7th/cmp-cmdline'} ----|
  use {'onsails/lspkind.nvim'} ---|

  -- Lspsaga -  additional features for Nvim-cmp
  use {
    'kkharji/lspsaga.nvim',
    config = "require('lspsaga-config')",
  }

  -- Colorizer - a high-performance color ﯧ highlighter
  use {
    'NvChad/nvim-colorizer.lua',
    config = "require'colorizer'.setup()",
  }

  -- Gitsigns - fast  Git decorations
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  }

  -- Dashboard - fancy  Neovim startscreen
  use {
    'glepnir/dashboard-nvim',
    config = "require('dashboard-config')",
    commit = 'e517188dab55493fb9034b4d4f1a508ccacfcd45',
  }

  -- Indent-blankline - adds  indentation guides to all lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require('blankline-config')",
    event = "BufRead",
  }

  -- Toggleterm - persist and toggle multiple  terminals
  use {
    "akinsho/toggleterm.nvim",
    config = "require('toggleterm-config')",
  }

  -- Comment - toggle  comments in any language
  use {
    'terrortylor/nvim-comment',
    config = "require('nvim_comment').setup({comment_empty=false})",
    cmd = "CommentToggle",
  }

  -- Session-manager - manage sessions like  folders
  use {
    'Shatur/neovim-session-manager',
    config = "require('session-manager-config')",
  }

  -- Smart-splits -  smart, ﱿ directional split resizing and  navigation
  use{
    'mrjones2014/smart-splits.nvim',
    config = "require('smartsplits-config')",
  }

  -- Noice - completely replaces the  UI for messages,  cmdline and the  popupmenu
  use({
    "folke/noice.nvim",
    config = "require('noice-config')",
    event = "VimEnter",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  })

  -- Notify - a  fancy and  configurable  notification manager
  use {
    "rcarriga/nvim-notify",
    config = "require('notify-config')",
  }

  -- Null-ls -  inject  LSP diagnostics,  code actions, and more
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('null-ls-config')",
  }

  -- Presence - activity in ﭮ Discord 
  use {
    'andweeb/presence.nvim',
    config = "require('presence-config')",
  }

  -- Dap - Debug Adapter Protocol client implementation ( debugger)
  use {
    'mfussenegger/nvim-dap',
    config = "require('dap-config')",
  }

  use {'rcarriga/nvim-dap-ui'} --  UI for Nvim-dap
  use {'theHamsta/nvim-dap-virtual-text'} -- virtual  text for Nvim-dap

  -- Drop -  pretty particles for Dashboard
  use({
    "folke/drop.nvim",
    config = function()
      require("drop").setup({
        theme = "leaves",
        max = 25,
        screensaver = false,
      })
    end,
    event = "VimEnter",
  })

  -- Scrollbar - extensible  Neovim scrollbar that shows  Git changes
  use {
    'petertriho/nvim-scrollbar',
    config = "require('scrollbar-config')",
  }

  -- Leap - an  interface that makes on-screen  navigation  quicker
  use {
    'ggandor/leap.nvim',
    config = "require('leap').add_default_mappings()",
  }

  -- Python-pep8-indent - indent fix for  Python
  use {
    'Vimjas/vim-python-pep8-indent',
    ft = "python",
  }

  -- Cellular-automaton -  useless but  fancy animations for﬘ buffer text
  use {
    'Eandrju/cellular-automaton.nvim',
    after = "nvim-treesitter",
  }

  -- Chafa -  image  viewer in  Neovim through Chafa
  use {
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
    requires = {
      'nvim-lua/plenary.nvim',
      'm00qek/baleia.nvim',
    },
  }

  -- Todo-comments - ﯦ highlight,  list and  search todo comments in your projects
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({
        sign_priority = 6,
      })
    end,
    requires = "nvim-lua/plenary.nvim",
  }

  -- Mini.animate - 𧻓animations for cursor, scroll, windows
  use {
    'echasnovski/mini.animate',
    config = function()
      require('mini.animate').setup({
        scroll = {
          enable = false,
        },
      })
    end,
  }

  -- Dressing -  plugin to improve the default  vim.ui  interfaces 
  use {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup({
        select = {
          -- Priority list of preferred vim.select implementations
          backend = { "fzf_lua", "fzf", "builtin", "nui" },
        },
      })
    end,
  }

  -- Numb - :number command  peeking 
  use {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end,
  }

end)
