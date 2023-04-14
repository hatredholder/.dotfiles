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
        autosave_ignore_dirs = {
          '/home/hatredholder/notes'
        },
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
        ["core.norg.concealer"] = {
          config = {
              icon_preset = "diamond",
              icons = {
                todo = {
                  on_hold = {
                    icon = "󰏤"
                  }
                }
              }
            }
          },
        ["core.norg.dirman"] = {
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
            end
          },
        },
        ["core.norg.completion"] = {
          config = { engine = "nvim-cmp" },
        },
      },
    },
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
  },

  -- Nui - UI components for some of the plugins
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  -- Fzf-lua - improved fzf.vim written in  Lua 
  {
    "ibhagwan/fzf-lua",
  },
}
