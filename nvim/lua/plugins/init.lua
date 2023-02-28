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

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({

  -- Impatient - faster  Neovim startup 祥time
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient")
    end,
  },

  --  Everforest colorscheme
  {
    "sainnhe/everforest",
    config = function()
      vim.cmd([[colorscheme everforest]])
    end,
  },

  -- Treesitter - basic syntax ﯧ highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.configs.treesitter")
    end,
    event = { "BufReadPost", "BufNewFile" },
    priority = 100,
    build = ":TSUpdate",
  },

  -- Treesitter-autotag - auto  tags for  HTML 
  {
    "windwp/nvim-ts-autotag",
  },

  -- Lualine - simple  statusline written in  Lua
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.configs.ui.lualine")
    end,
    event = "VeryLazy",
  },

  {
    "utilyre/barbecue.nvim",
    config = function()
      require("plugins.configs.ui.barbecue")
    end,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    version = "*",
    event = "VeryLazy",
  },

  -- Web-devicons -  icons for some plugins
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.configs.ui.devicons")
    end,
    lazy = true,
  },

  -- Bbye - better buffer  close command
  {
    "moll/vim-bbye",
    cmd = "Bdelete",
  },

  -- Bufferline - a  snazzy buffer line with tabpage integration
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins.configs.ui.bufferline")
    end,
    event = "VeryLazy",
  },

  -- Neo-tree - file explorer  tree for  Neovim
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("plugins.configs.editor.neotree")
    end,
    cmd = "Neotree",
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
      require("plugins.configs.editor.autopairs")
    end,
    event = "VeryLazy",
  },

  -- Which-key - plugin that  displays a popup with available  key bindings
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.configs.ui.whichkey")
    end,
    event = "VeryLazy",
  },

  -- Telescope -  highly extendable fuzzy finder over  lists
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.configs.ui.telescope")
    end,
    cmd = "Telescope",
    tag = "0.1.0",
  },

  -- Undotree -  undo  history  visualizer 
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  --  Mason LSPConfig (required for Mason)
  {
    "williamboman/mason-lspconfig.nvim",
  },

  -- Mason - portable  package manager for  Neovim
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },

  -- Nvim-cmp - a completion  engine plugin written in  Lua
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.configs.lsp")
    end,
  }, ----------------------------|
  {"neovim/nvim-lspconfig"}, ----| 
  {"hrsh7th/cmp-nvim-lsp"}, -----|
  {"hrsh7th/cmp-buffer"}, -------|  Nvim-cmp required plugins
  {"hrsh7th/cmp-path"}, ---------| 
  {"hrsh7th/cmp-cmdline"}, ------|
  {"onsails/lspkind.nvim"}, -----|

  -- Lspsaga -  additional features for Nvim-cmp
  {
    "kkharji/lspsaga.nvim",
    config = function()
      require("plugins.configs.lsp.lspsaga")
    end,
    event = "VeryLazy",
  },

  -- Colorizer - a high-performance color ﯧ highlighter
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Gitsigns - fast  Git decorations
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      -- Setup gitsigns for petertriho/nvim-scrollbar
      require("scrollbar.handlers.gitsigns").setup()
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Dashboard - fancy  Neovim startscreen
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("plugins.configs.ui.dashboard")
    end,
    commit = "e517188dab55493fb9034b4d4f1a508ccacfcd45",
    event = "VimEnter",
  },

  -- Indent-blankline - adds  indentation guides to all lines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.configs.ui.blankline")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Toggleterm - persist and toggle multiple  terminals
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.configs.editor.toggleterm")
    end,
    cmd = "ToggleTerm",
  },

  -- Comment - toggle  comments in any language
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({comment_empty=false})
    end,
    event = "VeryLazy",
  },

  -- Session-manager - manage sessions like  folders
  {
    "Shatur/neovim-session-manager",
    config = function()
      require("plugins.configs.sessions")
    end,
    event = "VimEnter",
  },

  -- Smart-splits -  smart, ﱿ directional split resizing and  navigation
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("plugins.configs.editor.smartsplits")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Noice - completely replaces the  UI for messages,  cmdline and the  popupmenu
  {
    "folke/noice.nvim",
    config = function()
      require("plugins.configs.ui.noice")
    end,
    event = "VeryLazy",
  },

  -- Notify - a  fancy and  configurable  notification manager
  {
    "rcarriga/nvim-notify",
    init = function()
      vim.o.termguicolors = true
    end,
    config = function()
      require("plugins.configs.ui.notify")
    end,
    event = "VeryLazy",
  },

  -- Null-ls -  inject  LSP diagnostics,  code actions, and more
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.configs.lsp.null-ls")
    end,
  },

  -- Presence - activity in ﭮ Discord 
  {
    "andweeb/presence.nvim",
    config = function()
      require("plugins.configs.presence")
    end,
  },

  -- Dap - Debug Adapter Protocol client implementation ( debugger)
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.configs.editor.dap")
    end,
    event = "VeryLazy",
  },

  --  UI for Nvim-dap
  {
    "rcarriga/nvim-dap-ui",
  },

  -- virtual  text for Nvim-dap
  {
    "theHamsta/nvim-dap-virtual-text",
  },

  -- Drop -  pretty particles for Dashboard
  {
    "folke/drop.nvim",
    config = function()
      require("plugins.configs.ui.drop")
    end,
    event = "VimEnter",
  },

  -- Scrollbar - extensible  Neovim scrollbar that shows  Git changes
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("plugins.configs.ui.scrollbar")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Leap - an  interface that makes on-screen  navigation  quicker
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    event = "VeryLazy",
  },

  -- Python-pep8-indent - indent fix for  Python
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
  },

  -- Cellular-automaton -  useless but  fancy animations for﬘ buffer text
  {
    "Eandrju/cellular-automaton.nvim",
  },

  -- Chafa -  image  viewer in  Neovim through Chafa
  {
    "princejoogie/chafa.nvim",
    dependencies = {
      "m00qek/baleia.nvim",
    },
    config = function()
      require("plugins.configs.chafa")
    end,
  },

  -- Todo-comments - ﯦ highlight,  list and  search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    config = function()
      require("plugins.configs.editor.todo-comments")
    end,
    cmd = {"TodoTelescope"},
  },

  -- Mini.animate - 𧻓animations for cursor, scroll, windows
  {
    "echasnovski/mini.animate",
    config = function()
      require("plugins.configs.ui.mini-animate")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Mini.move -  move blocks of text in any  direction 
  {
    "echasnovski/mini.move",
    config = function()
      require("plugins.configs.editor.mini-move")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Dressing -  plugin to improve the default  vim.ui  interfaces 
  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.configs.ui.dressing")
    end,
    event = "VeryLazy",
  },

  -- Fzf-lua - improved fzf.vim written in  Lua 
  {
    "ibhagwan/fzf-lua"
  },

  -- Numb - :number command  peeking 
  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
    event = "VeryLazy",
  },

  -- UFO -  VSCode-like  folding in  Neovim
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        "luukvbaal/statuscol.nvim",
    },
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      require("statuscol").setup({foldfunc = "builtin", setopt = true })

    end,
    config = function()
      require("plugins.configs.editor.ufo")
    end,
    event = "VeryLazy",
  },

  -- Illuminate -  plugin for automatically ﯧ highlighting other uses of the  word
  {
    "RRethy/vim-illuminate",
    config = function()
      require("plugins.configs.ui.illuminate")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Mini.indentscope -  visualize and  operate on indent  scope
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("plugins.configs.ui.indentscope")
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Modicator -  cursor  line number mode  colorful indicator
  {
    "mawkler/modicator.nvim",
    init = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    config = function()
      require("plugins.configs.ui.modicator")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Tint - dim inactive  windows using window-local  highlight namespaces. 
  -- (disabled until https://github.com/levouh/tint.nvim/issues/38 gets fixed)
  -- {
  --   "levouh/tint.nvim",
  --   config = function()
  --     require("tint").setup()
  --   end,
  --   event = { "BufReadPre", "BufNewFile" },
  -- }

})
