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

  -- Impatient.nvim - faster  Neovim startup 祥time
  use {
    'lewis6991/impatient.nvim',
    config="require('impatient-config')",
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
            'packer', 'NvimTree', "dashboard", "TelescopePrompt", "DiffviewFilePanel"
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

  -- Vim-bbye - better buffer  close command
  use {
    "moll/vim-bbye",
    event = "BufWinEnter",
  }

  -- Bufferline.nvim - a  snazzy buffer line with tabpage integration
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    event = "BufWinEnter",
    config = "require('bufferline-config')",
  }

  -- Nvim-tree.lua - file explorer 侮tree for  Neovim
  use {
    'nvim-tree/nvim-tree.lua',
    cmd = {"NvimTreeToggle", "NvimTreeFocus"},
    config = "require('nvim-tree-config')",
  }

  -- Nvim-autopairs - a super powerful  autopair plugin for  Neovim
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = "require('autopairs-config')",
  }

  -- Which-key.nvim - plugin that  displays a popup with available  key bindings
  use {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = "require('which-key-config')",
  }

  -- Telescope.nvim -  highly extendable fuzzy finder over  lists
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    cmd = "Telescope",
    requires = {'nvim-lua/plenary.nvim'},
    config = "require('telescope-config')",
  }

  use {"williamboman/mason-lspconfig.nvim"} --  Mason LSPConfig (required for Mason)

  -- Mason.nvim - portable  package manager for  Neovim
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

  -- Lspsaga.nvim -  additional features for Nvim-cmp
  use {
    'kkharji/lspsaga.nvim',
    config = "require('lspsaga-config')",
  }

  -- Nvim-colorizer.lua - a high-performance color ﯧ highlighter
  use {
    'norcalli/nvim-colorizer.lua',
    config = "require('colorizer-config')",
  }

  -- Gitsigns.nvim - fast  Git decorations
  use {
    'lewis6991/gitsigns.nvim',
    config = "require('gitsigns-config')",
  }

  use {
    'sindrets/diffview.nvim',
  }

  -- Dashboard-nvim - fancy  Neovim startscreen
  use {
    'glepnir/dashboard-nvim',
    config = "require('dashboard-config')",
  }

  -- Indent-blankline.nvim - adds  indentation guides to all lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = "require('blankline-config')",
  }

  -- Toggleterm.nvim - persist and toggle multiple  terminals
  use {
    "akinsho/toggleterm.nvim",
    config = "require('toggleterm-config')",
  }

  -- Codewindow.nvim - fast and fresh 﫴minimap plugin 
  use {
    'gorbit99/codewindow.nvim',
    config = function()
      require('minimap-config')
    end,
  }

  -- Nvim-comment - toggle  comments in any language
  use {
    'terrortylor/nvim-comment',
    cmd = "CommentToggle",
    config = "require('comment-config')",
  }

  -- Neovim-session-manager - manage sessions like  folders
  use {
    'Shatur/neovim-session-manager',
    config = "require('session-manager-config')",
  }

  -- Smart-splits.nvim -  smart, ﱿ directional split resizing and  navigation
  use{
    'mrjones2014/smart-splits.nvim',
    config = "require('smartsplits-config')",
  }

  -- Noice.nvim - completely replaces the  UI for messages,  cmdline and the  popupmenu
  use({
    "folke/noice.nvim",
    event = "VimEnter",
    config = "require('noice-config')",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  })

  -- Nvim-notify - a  fancy,  configurable,  notification manager
  use {
    "rcarriga/nvim-notify",
    config = "require('notify-config')",
  }

  -- Null-ls.nvim -  inject  LSP diagnostics,  code actions, and more
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('null-ls-config')",
  }

  -- Presence.nvim - activity in ﭮ Discord 
  use {
    'andweeb/presence.nvim',
    config = "require('presence-config')",
  }

  -- Nvim-dap - Debug Adapter Protocol client implementation ( debugger)
  use {
    'mfussenegger/nvim-dap',
    config = "require('dap-config')",
  }

  use {'rcarriga/nvim-dap-ui'} --  UI for Nvim-dap
  use {'theHamsta/nvim-dap-virtual-text'} -- virtual  text for Nvim-dap

  -- Drop.nvim -  pretty particles for Dashboard
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

end)
