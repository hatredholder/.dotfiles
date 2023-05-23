--[[

███    █▄      ███      ▄█   ▄█          ▄█       ███    █▄     ▄████████ 
███    ███ ▀█████████▄ ███  ███         ███       ███    ███   ███    ███ 
███    ███    ▀███▀▀██ ███▌ ███         ███       ███    ███   ███    ███ 
███    ███     ███   ▀ ███▌ ███         ███       ███    ███   ███    ███ 
███    ███     ███     ███▌ ███         ███       ███    ███ ▀███████████ 
███    ███     ███     ███  ███         ███       ███    ███   ███    ███ 
███    ███     ███     ███  ███▌    ▄   ███▌    ▄ ███    ███   ███    ███ 
████████▀     ▄████▀   █▀   █████▄▄██   █████▄▄██ ████████▀    ███    █▀  
   ▀▀           ▀      ▀      ▀       ▀   ▀          ▀▀         ▀            

--]]

return {

  -- Session-manager - manage sessions like  folders
  {
    "Shatur/neovim-session-manager",
    config = function()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
        path_replacer = '__', -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          'gitcommit',
        },
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      })

    end,
    event = "VimEnter",
  },

  -- Neorg -  org-mode alternative in  Neovim
  {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
              icon_preset = "diamond",
              icons = {
                todo = {
                  on_hold = {
                    icon = "󰏤"
                  }
                },
                delimiter = {
                  horizontal_line = {
                    icon = "─"
                  },
                  weak = {
                    enabled = false,
                  }
                }
              }
            }
          },
        ["core.dirman"] = {
          config = {
            workspaces = {
                notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              keybinds.remap_key("norg", "n", "<CR>", "gx")
              keybinds.remap("norg", "n", "gtd", "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<CR><Plug>(nvim-surround-normal)$-")
              keybinds.remap("norg", "n", "gtu", "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_undone<CR><Plug>(nvim-surround-delete)-")
            end
          },
        },
        ["core.completion"] = {
          config = { engine = "nvim-cmp" },
        },
      },
    },
  },

  -- Headlines -  horizontal 💡highlights for Neorg
  {
    'lukas-reineke/headlines.nvim',
    config = function()
      require("headlines").setup{
        norg = {
          query = vim.treesitter.parse_query(
              "norg",
              [[
                  [
                      (heading1_prefix)
                      (heading2_prefix)
                      (heading3_prefix)
                      (heading4_prefix)
                      (heading5_prefix)
                      (heading6_prefix)
                  ] @headline

                  (weak_paragraph_delimiter) @dash
                  (strong_paragraph_delimiter) @doubledash

                  ((ranged_tag
                      name: (tag_name) @_name
                      (#eq? @_name "code")
                  ) @codeblock (#offset! @codeblock 0 0 1 0))

                  (quote1_prefix) @quote
              ]]
          ),
          headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4" },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          doubledash_highlight = "DoubleDash",
          doubledash_string = "&",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = false,
          fat_headline_upper_string = "▃",
          fat_headline_lower_string = "🬂",
        },
      }
    end,
    event = "VeryLazy",
  },

  -- Presence - activity in ﭮ Discord 
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence"):setup({
          auto_update = true,
          neovim_image_text = "The One True Text Editor",
          main_image = "neovim",
          client_id = "793271441293967371",
          log_level = nil,
          debounce_timeout = 10,
          enable_line_number = false,
          blacklist = {},
          buttons = true,
          file_assets = {},
          show_time = true,

          editing_text = "Editing %s",
          file_explorer_text = "Browsing %s",
          git_commit_text = "Committing changes",
          plugin_manager_text = "Managing plugins",
          reading_text = "Reading %s",
          workspace_text = "Working on %s",
          line_number_text = "Line %s out of %s",
      })
    end,
  },

  -- Chafa -  image  viewer in  Neovim through Chafa
  {
    "princejoogie/chafa.nvim",
    dependencies = {
      "m00qek/baleia.nvim",
    },
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

  -- Plenary - All the lua functions I don't want to write twice
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },

  -- Nui - UI components for some of the plugins
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  -- Rest - a REST client in  Neovim
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = true,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = true,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
    event = "VeryLazy",
  }
}
