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

  -- Impatient.nvim - faster Neovim startup time
  use {
    'lewis6991/impatient.nvim',
    config="require('impatient-config')",
  }

  use {'sainnhe/everforest'} -- Everforest colorscheme

  -- Treesitter - basic syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('treesitter-config')"
  }

  -- Lualine - simple statusline
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          disabled_filetypes = { 'packer', 'NvimTree', "dashboard", "TelescopePrompt" }
        }
      })
    end,
    event = "BufRead",
  }

  -- Web-devicons - icons for some plugins
  use {
    'kyazdani42/nvim-web-devicons', config = "require('nvim-web-devicons-config')",
  }

  -- Vim-bbye - better buffer close command
  use {
    "moll/vim-bbye",
    event = "BufWinEnter",
  }

  -- Bufferline.nvim - a snazzy buffer line with tabpage integration
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    event = "BufWinEnter",
    config = "require('bufferline-config')",
  }

  -- Nvim-tree.lua - file explorer tree for Neovim
  use {
    'nvim-tree/nvim-tree.lua',
    cmd = {"NvimTreeToggle", "NvimTreeFocus"},
    config = "require('nvim-tree-config')",
  }

  -- Nvim-autopairs - a super powerful autopair plugin for Neovim
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = "require('autopairs-config')",
  }

  -- Which-key.nvim - plugin that displays a popup with possible key bindings
  use {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = "require('which-key-config')",
  }

  -- Telescope.nvim - highly extendable fuzzy finder over lists
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim'},
    cmd = "Telescope",
    config = "require('telescope-config')",
  }
  use {"williamboman/mason-lspconfig.nvim"} -- Mason LSPConfig (required for Mason)

  -- Mason.nvim - portable package manager for Neovim
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason-config")
    end,
  }

  -- Nvim-cmp - a completion engine plugin for neovim written in Lua
  use {
    'hrsh7th/nvim-cmp',
    config = "require('lsp')",
  } ------------------------------|
  use {'neovim/nvim-lspconfig'} --| 
  use {'hrsh7th/cmp-nvim-lsp'} ---|
  use {'hrsh7th/cmp-buffer'} -----| Nvim-cmp required plugins
  use {'hrsh7th/cmp-path'} -------| 
  use {'hrsh7th/cmp-cmdline'} ----|
  use {'onsails/lspkind.nvim'} ---|

  -- Lspsaga.nvim - additional features for Nvim-cmp
  use {
    'kkharji/lspsaga.nvim',
    config = "require('lspsaga-config')",
  }

  -- Nvim-colorizer.lua - a high-performance color highlighter for Neovim 
  use {
    'norcalli/nvim-colorizer.lua',
    config = "require('colorizer-config')",
  }

  -- Gitsigns.nvim - fast git decorations implemented purely in lua
  use {
    'lewis6991/gitsigns.nvim',
    config = "require('gitsigns-config')",
  }

  -- Dashboard-nvim - fancy Neovim startscreen
  use {
    'glepnir/dashboard-nvim',
    config = "require('dashboard-config')",
  }

  -- Drop.nvim - pretty particles for dashboard
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

  -- Indent-blankline.nvim - adds indentation guides to all lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = "require('blankline-config')",
  }

  -- Toggleterm.nvim - persist and toggle multiple terminals during an editing session in Neovim
  use {
    "akinsho/toggleterm.nvim",
    config = "require('toggleterm-config')",
  }

  -- Codewindow.nvim - minimap plugin for Neovim
  use {
    'gorbit99/codewindow.nvim',
    config = function()
      require('minimap-config')
    end,
  }

  -- Nvim-comment - toggle comments in Neovim
  use {
    'terrortylor/nvim-comment',
    cmd = "CommentToggle",
    config = "require('comment-config')",
  }

  -- Neovim-session-manager - manage sessions like folders in VSCode
  use {
    'Shatur/neovim-session-manager',
    config = "require('session-manager-config')",
  }

  -- Smart-splits.nvim - smart, directional Neovim split resizing and navigation
  use{
    'mrjones2014/smart-splits.nvim',
    config = "require('smartsplits-config')",
  }

  -- Noice.nvim - completely replaces the UI for messages, cmdline and the popupmenu
  use({
    "folke/noice.nvim",
    event = "VimEnter",
    config = "require('noice-config')",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  })

  -- Nvim-notify - a fancy, configurable, notification manager for NeoVim 
  use {
    "rcarriga/nvim-notify",
    config = "require('notify-config')",
  }

  -- Null-ls.nvim - use Neovim as a language server to inject LSP diagnostics, code actions, and more via lua
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('null-ls-config')",
  }

  -- Presence.nvim - Neovim as activity in Discord 
  use {
    'andweeb/presence.nvim',
    config = "require('presence-config')",
  }

  -- Nvim-dap - debugger in Neovim
  use {
    'mfussenegger/nvim-dap',
    config = "require('dap-config')",
  }

  use {'rcarriga/nvim-dap-ui'} -- UI for Nvim-dap
  use {'theHamsta/nvim-dap-virtual-text'} -- virtual text for Nvim-dap

end)
