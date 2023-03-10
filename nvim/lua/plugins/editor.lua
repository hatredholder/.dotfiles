--[[

   ▄████████ ████████▄   ▄█      ███      ▄██████▄     ▄████████   ▄█       ███    █▄     ▄████████ 
  ███    ███ ███   ▀███ ███  ▀█████████▄ ███    ███   ███    ███   ███       ███    ███   ███    ███ 
  ███    █▀  ███    ███ ███▌    ▀███▀▀██ ███    ███   ███    ███   ███       ███    ███   ███    ███ 
 ▄███▄▄▄     ███    ███ ███▌     ███   ▀ ███    ███  ▄███▄▄▄▄██▀   ███       ███    ███   ███    ███ 
▀▀███▀▀▀     ███    ███ ███▌     ███     ███    ███ ▀▀███▀▀▀▀▀     ███       ███    ███ ▀███████████ 
  ███    █▄  ███    ███ ███      ███     ███    ███ ▀███████████   ███       ███    ███   ███    ███ 
  ███    ███ ███   ▄███ ███      ███     ███    ███   ███    ███   ███▌    ▄ ███    ███   ███    ███ 
  ██████████ ████████▀  █▀      ▄████▀    ▀██████▀    ███    ███   █████▄▄██ ████████▀    ███    █▀  
     ▀▀          ▀▀     ▀         ▀                   ▀        ▀ ▀   ▀          ▀▀         ▀ 

--]]

return {

  -- Neo-tree - file explorer  tree for  Neovim
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        source_selector = {
          winbar = true,
          content_layout = "center",
          tab_labels = {
            filesystem = " File",
            buffers = "פּ Bufs",
            git_status = " Git",
          },
        },
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil , -- use a custom function for sorting files and directories in the tree 
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NvimTreeGitNew",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "◌",
              unstaged  = "",
              staged    = "S",
              conflict  = "",
            }
          },
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<space>"] = "none",
            ["/"] = "none",
          },
          mapping_options = {
            noremap = true,
            nowait = true,
          },
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = true, -- This will find and focus the file in the active buffer every
                                       -- time the current file is changed while the tree is open.
        },
      })
    end,
    cmd = "Neotree",
    branch = "v2.x",
  },

  -- Autopairs - a powerful  autopair plugin for  Neovim
  {
    "windwp/nvim-autopairs",
    config = function()
      local npairs = require('nvim-autopairs')

      npairs.setup({break_line_filetype = nil, check_ts = true})

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
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

  -- mini.comment - toggle  comments in any language
  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup({
        mappings = {
          comment='<c-_>',
          comment_line='<c-_>',
        },
      })
    end,
    event = "VeryLazy",
  },

  -- Smart-splits -  smart, ﱿ directional split resizing and  navigation
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require('smart-splits').setup({
        -- Ignored filetypes (only while resizing)
        ignored_filetypes = {
          'nofile',
          'quickfix',
          'prompt',
        },
        -- Ignored buffer types (only while resizing)
        ignored_buftypes = { 'NvimTree' },
        -- the default number of lines/columns to resize by at a time
        default_amount = 3,
        -- when moving cursor between splits left or right,
        -- place the cursor on the same row of the *screen*
        -- regardless of line numbers. False by default.
        -- Can be overridden via function parameter, see Usage.
        move_cursor_same_row = false,
        -- resize mode options
        resize_mode = {
          -- key to exit persistent resize mode
          quit_key = '<ESC>',
          -- keys to use for moving in resize mode
          -- in order of left, down, up' right
          resize_keys = { 'h', 'j', 'k', 'l' },
          -- set to true to silence the notifications
          -- when entering/exiting persistent resize mode
          silent = false,
          -- must be functions, they will be executed when
          -- entering or exiting the resize mode
          hooks = {
            on_enter = nil,
            on_leave = nil
          }
        },
        -- ignore these autocmd events (via :h eventignore) while processing
        -- smart-splits.nvim computations, which involve visiting different
        -- buffers and windows. These events will be ignored during processing,
        -- and un-ignored on completed. This only applies to resize events,
        -- not cursor movement events.
        ignored_events = {
          'BufEnter',
          'WinEnter',
        },
        -- enable or disable the tmux integration
        tmux_integration = true,
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Dap - Debug Adapter Protocol client implementation ( debugger)
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')
      dap.adapters.python = {
        type = 'executable';
        command = '/home/hatredholder/.local/share/nvim/mason/packages/debugpy/venv/bin/python';
        args = { '-m', 'debugpy.adapter' };
      }

      -- TODO: Delete personal configurations before uploading to github

      -- Pastebin-clone dap config
      dap.configurations.python = dap.configurations.python or {}
          table.insert(dap.configurations.python, {
          name = 'Flask - Pybin',
          type = 'python',
          request = 'launch',
          module = 'flask',
          python = "/home/hatredholder/Programming/Python/Flask/pastebin-clone/bin/python",
          env = {
            FLASK_APP = "app.py",
          },
          jinja = true,
          args = {'run', '--no-debugger'},
        })

      -- -- Social Network dap config
      -- dap.configurations.python = dap.configurations.python or {}
      --     table.insert(dap.configurations.python, {
      --     name = 'Django - Social Network',
      --     type = 'python',
      --     request = 'launch',
      --     python = "/home/hatredholder/Programming/Python/Django/social_network/bin/python",
      --     program = vim.fn.getcwd() .. '/manage.py',  -- NOTE: Adapt path to manage.py as needed
      --     args = {'runserver', '--noreload'},
      --   })

      require("nvim-dap-virtual-text").setup {
          commented = true,
      }
      require("dapui").setup({
        layouts = {
          {
            elements = {
            -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
      })

      local dapui = require('dapui')

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end



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

  -- Todo-comments - ﯦ highlight,  list and  search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({
        sign_priority = 6,
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Mini.move -  move blocks of text in any  direction 
  {
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup({
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
    event = { "BufReadPost", "BufNewFile" },
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

      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
          { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
      }})
    end,
    config = function()
      require('ufo').setup({
        provider_selector = function()
            return {'treesitter', 'indent'}
        end
      })
    end,
    event = "VeryLazy",
  },

  -- SSR - Structural  search and  replace for  Neovim
  {
    "cshuaimin/ssr.nvim",
    config = function()
      require("ssr").setup {
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      }
    end,
  },
}
