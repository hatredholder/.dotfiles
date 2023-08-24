--[[

   ▄████████ ████████▄   ▄█      ███      ▄██████▄     ▄████████    ▄█       ███    █▄     ▄████████
  ███    ███ ███   ▀███ ███  ▀█████████▄ ███    ███   ███    ███    ███       ███    ███   ███    ███
  ███    █▀  ███    ███ ███▌    ▀███▀▀██ ███    ███   ███    ███    ███       ███    ███   ███    ███
 ▄███▄▄▄     ███    ███ ███▌     ███   ▀ ███    ███  ▄███▄▄▄▄██▀    ███       ███    ███   ███    ███
▀▀███▀▀▀     ███    ███ ███▌     ███     ███    ███ ▀▀███▀▀▀▀▀      ███       ███    ███ ▀███████████
  ███    █▄  ███    ███ ███      ███     ███    ███ ▀███████████    ███       ███    ███   ███    ███
  ███    ███ ███   ▄███ ███      ███     ███    ███   ███    ███    ███▌    ▄ ███    ███   ███    ███
  ██████████ ████████▀  █▀      ▄████▀    ▀██████▀    ███    ███    █████▄▄██ ████████▀    ███    █▀
     ▀▀          ▀▀     ▀         ▀                   ▀        ▀  ▀   ▀          ▀▀         ▀ 

--]]


return {
  -- Mini.files - file explorer for  Neovim
   {
    'echasnovski/mini.files',
     init = function()
            -- Add rounded corners.
            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesWindowOpen',
                callback = function(args)
                    local win_id = args.data.win_id
                    vim.api.nvim_win_set_config(win_id, { border = 'rounded' })
                end,
            })
        end,
    config = {
      -- Module mappings created only inside explorer.
      -- Use `''` (empty string) to not create one.
      mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = '<CR>',
        go_out      = 'h',
        go_out_plus = 'H',
        reset       = '<BS>',
        show_help   = 'g?',
        synchronize = '<c-s>',
        trim_left   = '<',
        trim_right  = '>',
      },

      -- General options
      options = {
        -- Whether to use for editing directories
        use_as_default_explorer = true,
      },

      -- Customization of explorer windows
      windows = {
        -- Maximum number of windows to show side by side
        max_number = math.huge,
        -- Whether to show preview of file/directory under cursor
        preview = true,
        -- Width of focused window
        width_focus = 50,
        -- Width of non-focused window
        width_nofocus = 15,
        -- Width of preview window
        width_preview = 25,
      },
    }
  },

  -- Bufdelete - delete  Neovim  buffers without losing window layout 
  {
    "famiu/bufdelete.nvim",
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

  -- Comment - toggle  comments in any language
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({
        comment_empty = false,
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
        -- place the cursor on the same row of the *screen
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
        multiplexer_integration = "tmux",
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

  --  UI for Nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
  },

  -- virtual  text for Nvim-dap
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
  },

  --  Go Adapter for Nvim-dap
  {
    "leoluz/nvim-dap-go",
    config = function ()
      require('dap-go').setup()
    end,
    event = "VeryLazy",
  },

   -- Flash.nvim - 󰆋 navigate your code with  search labels
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter({
              label = {
                rainbow = {
                  enabled = true,
                },
              },
            })
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
    },
    config = function()
      require('flash').setup(
        {
          -- labels = "abcdefghijklmnopqrstuvwxyz",
          labels = "asdfghjklqwertyuiopzxcvbnm",
          search = {
            -- search/jump in all windows
            multi_window = true,
            -- search direction
            forward = true,
            -- when `false`, find only matches in the given direction
            wrap = true,
            -- Each mode will take ignorecase and smartcase into account.
            -- * exact: exact match
            -- * search: regular search
            -- * fuzzy: fuzzy search
            -- * fun(str): custom function that returns a pattern
            --   For example, to only match at the beginning of a word:
            --   mode = function(str)
            --     return "\\<" .. str
            --   end,
            mode = "exact",
            -- behave like `incsearch`
            incremental = false,
            -- Excluded filetypes and custom window filters
            exclude = {
              "notify",
              "cmp_menu",
              "noice",
              "flash_prompt",
              function(win)
                -- exclude non-focusable windows
                return not vim.api.nvim_win_get_config(win).focusable
              end,
            },
            -- Optional trigger character that needs to be typed before
            -- a jump label can be used. It's NOT recommended to set this,
            -- unless you know what you're doing
            trigger = "",
            -- max pattern length. If the pattern length is equal to this
            -- labels will no longer be skipped. When it exceeds this length
            -- it will either end in a jump or terminate the search
            max_length = nil, ---@type number?
          },
          jump = {
            -- save location in the jumplist
            jumplist = true,
            -- jump position
            pos = "start", ---@type "start" | "end" | "range"
            -- add pattern to search history
            history = false,
            -- add pattern to search register
            register = false,
            -- clear highlight after jump
            nohlsearch = false,
            -- automatically jump when there is only one match
            autojump = false,
            -- You can force inclusive/exclusive jumps by setting the
            -- `inclusive` option. By default it will be automatically
            -- set based on the mode.
            inclusive = nil, ---@type boolean?
            -- jump position offset. Not used for range jumps.
            -- 0: default
            -- 1: when pos == "end" and pos < current position
            offset = nil, ---@type number
          },
          label = {
            -- allow uppercase labels
            uppercase = true,
            -- add a label for the first match in the current window.
            -- you can always jump to the first match with `<CR>`
            current = true,
            -- show the label after the match
            after = true, ---@type boolean|number[]
            -- show the label before the match
            before = false, ---@type boolean|number[]
            -- position of the label extmark
            style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
            -- flash tries to re-use labels that were already assigned to a position,
            -- when typing more characters. By default only lower-case labels are re-used.
            reuse = "lowercase", ---@type "lowercase" | "all"
            -- for the current window, label targets closer to the cursor first
            distance = true,
            -- minimum pattern length to show labels
            -- Ignored for custom labelers.
            min_pattern_length = 2,
            -- Enable this to use rainbow colors to highlight labels
            -- Can be useful for visualizing Treesitter ranges.
            rainbow = {
              enabled = false,
              -- number between 1 and 9
              shade = 5,
            },
            -- With `format`, you can change how the label is rendered.
            -- Should return a list of `[text, highlight]` tuples.
            format = function(opts)
              return { { opts.match.label, opts.hl_group } }
            end,
          },
          highlight = {
            -- show a backdrop with hl FlashBackdrop
            backdrop = true,
            -- Highlight the search matches
            matches = true,
            -- extmark priority
            priority = 5000,
            groups = {
              match = "FlashMatch",
              current = "FlashCurrent",
              backdrop = "FlashBackdrop",
              label = "FlashLabel",
            },
          },
          -- action to perform when picking a label.
          -- defaults to the jumping logic depending on the mode.
          action = nil,
          -- initial pattern to use when opening flash
          pattern = "",
          -- When `true`, flash will try to continue the last search
          continue = false,
          -- You can override the default options for a specific mode.
          -- Use it with `require("flash").jump({mode = "forward"})`
          modes = {
            -- options used when flash is activated through
            -- a regular search with `/` or `?`
            search = {
              -- when `true`, flash will be activated during regular search by default.
              -- You can always toggle when searching with `require("flash").toggle()`
              enabled = false,
              highlight = { backdrop = false },
              jump = { history = true, register = true, nohlsearch = true },
              search = {
                -- `forward` will be automatically set to the search direction
                -- `mode` is always set to `search`
                -- `incremental` is set to `true` when `incsearch` is enabled
              },
            },
            -- options used when flash is activated through
            -- `f`, `F`, `t`, `T`, `;` and `,` motions
            char = {
              enabled = true,
              -- by default all keymaps are enabled, but you can disable some of them,
              -- by removing them from the list.
              keys = { "f", "F", "t", "T", ";", "," },
              search = { wrap = false },
              highlight = { backdrop = true },
              jump = { register = false },
            },
            -- options used for treesitter selections
            -- `require("flash").treesitter()`
            treesitter = {
              labels = "abcdefghijklmnopqrstuvwxyz",
              jump = { pos = "range" },
              search = { incremental = false },
              label = { before = true, after = true, style = "inline" },
              highlight = {
                backdrop = false,
                matches = false,
              },
            },
            treesitter_search = {
              jump = { pos = "range" },
              search = { multi_window = true, wrap = true, incremental = false },
              remote_op = { restore = true },
              label = { before = true, after = true, style = "inline" },
            },
            -- options used for remote flash
            remote = {
              remote_op = { restore = true, motion = true },
            },
          },
          -- options for the floating window that shows the prompt,
          -- for regular jumps
          prompt = {
            enabled = true,
            prefix = { { "󱐋 ", "FlashPromptIcon" } },
            win_config = {
              relative = "editor",
              width = 1, -- when <=1 it's a percentage of the editor width
              height = 1,
              row = -1, -- when negative it's an offset from the bottom
              col = 0, -- when negative it's an offset from the right
              zindex = 1000,
            },
          },
          -- options for remote operator pending mode
          remote_op = {
            -- restore window views and cursor position
            -- after doing a remote operation
            restore = false,
            -- For `jump.pos = "range"`, this setting is ignored.
            -- `true`: always enter a new motion when doing a remote operation
            -- `false`: use the window's cursor position and jump target
            -- `nil`: act as `true` for remote windows, `false` for the current window
            motion = false,
          },
        }
      )
    end,
  },

  -- Various-textobjs - two dozen new text objects
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = {
      useDefaultKeymaps = true,
      disabledKeymaps = {"aS", "iS"},
    },
  },

  -- Python-pep8-indent - indent fix for  Python
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
    config = function()
      vim.cmd [[set colorcolumn=100]]
    end,
    event = "VeryLazy",
  },

  -- Todo-comments - ﯦ highlight,  list and  search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({
        sign_priority = 0,
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "#7fbbb3" },
          NOTE = { icon = " ", color = "#E69875" },
        },
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

  -- Fold-preview - preview folds
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = function()
      require('fold-preview').setup({
        default_keybindings = false,
        auto = 1,
      })
    end,
    event = "VeryLazy",
  },

  -- GX - Open 🔗links without netrw
  {
    "chrishrb/gx.nvim",
    config = true,
    event = { "BufEnter" },
  },

  -- Spider - Use the w, e, b motions like a 🕷️spider. Considers camelCase and skips insignificant punctuation. 
  {
    "chrisgrieser/nvim-spider",
    config = function()
      require("spider").setup({
        skipInsignificantPunctuation = false
      })
      vim.keymap.set({"n", "o", "x"}, "w", function() require("spider").motion("w") end, { desc = "Spider-w" })
      vim.keymap.set({"n", "o", "x"}, "e", function() require("spider").motion("e") end, { desc = "Spider-e" })
      vim.keymap.set({"n", "o", "x"}, "b", function() require("spider").motion("b") end, { desc = "Spider-b" })
      vim.keymap.set({"n", "o", "x"}, "ge", function() require("spider").motion("ge") end, { desc = "Spider-ge" })
    end,
    event = "VeryLazy",
  },

  -- Deadcolumn -  plugin that shows  ﴳ colorcolumn dynamically with :set colorcolumn
  {
    'Bekaboo/deadcolumn.nvim',
    event = "VeryLazy",
  },

  -- Surround - Add/change/delete 󱓼 surrounding 󱤎 delimiter pairs with ease
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- Treesj -  splitting/joining 🔳blocks of  code
  {
    "Wansmer/treesj",
    config = function()
      require('treesj').setup({ use_default_keymaps = false, max_join_length = 720 })
    end,
    event = "VeryLazy",
  },
}
