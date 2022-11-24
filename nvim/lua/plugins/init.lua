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

  use {'wbthomason/packer.nvim'} -- Packer

  -- Impatient - faster  Neovim startup 祥time
  use {
    'lewis6991/impatient.nvim',
    config="require('impatient')",
  }

  use {'sainnhe/everforest'} --  Everforest colorscheme

  -- Treesitter - basic syntax ﯧ highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('treesitter-config')"
  }

  -- Treesitter-autotag - auto  tags for  HTML 
  use {
    'windwp/nvim-ts-autotag',
    after = "nvim-treesitter",
  }

  -- Lualine - simple  statusline written in  Lua
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          disabled_filetypes = {
            'packer', 'neo-tree', "dashboard", "TelescopePrompt", "DiffviewFilePanel"
          },
        },
      })
    end,
    event = "BufRead",
  }

  -- Web-devicons -  icons for some plugins
  use {
    'kyazdani42/nvim-web-devicons', config = "require('nvim-web-devicons-config')",
  }

  -- Bbye - better buffer  close command
  use {
    "moll/vim-bbye",
    event = "BufWinEnter",
  }

  -- Bufferline - a  snazzy buffer line with tabpage integration
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    event = "BufWinEnter",
    config = "require('bufferline-config')",
  }

  -- Neo-tree - file explorer 侮tree for  Neovim
  use {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = {'Neotree'},
    branch = "v2.x",
    config = "require('neotree-config')",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }

  -- Autopairs - a powerful  autopair plugin for  Neovim
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = "require('autopairs-config')",
  }

  -- Which-key - plugin that  displays a popup with available  key bindings
  use {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = "require('which-key-config')",
  }

  -- Telescope -  highly extendable fuzzy finder over  lists
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    cmd = "Telescope",
    requires = {'nvim-lua/plenary.nvim'},
    config = "require('telescope-config')",
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
  }

  -- Indent-blankline - adds  indentation guides to all lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = "require('blankline-config')",
  }

  -- Toggleterm - persist and toggle multiple  terminals
  use {
    "akinsho/toggleterm.nvim",
    config = "require('toggleterm-config')",
  }

  -- Comment - toggle  comments in any language
  use {
    'terrortylor/nvim-comment',
    cmd = "CommentToggle",
    config = "require('nvim_comment').setup({comment_empty=false})",
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
    event = "VimEnter",
    config = "require('noice-config')",
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
    event = "VimEnter",
    config = function()
      require("drop").setup({
        theme = "leaves",
        max = 25,
        screensaver = false,
      })
    end,
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

  use {
    'Vimjas/vim-python-pep8-indent',
    ft = "python",
  } -- indent fix for  Python
end)
