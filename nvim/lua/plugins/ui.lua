--[[

███    █▄   ▄█     ▄█       ███    █▄     ▄████████ 
███    ███ ███    ███       ███    ███   ███    ███ 
███    ███ ███▌   ███       ███    ███   ███    ███ 
███    ███ ███▌   ███       ███    ███   ███    ███ 
███    ███ ███▌   ███       ███    ███ ▀███████████ 
███    ███ ███    ███       ███    ███   ███    ███ 
███    ███ ███    ███▌    ▄ ███    ███   ███    ███ 
████████▀  █▀     █████▄▄██ ████████▀    ███    █▀  
   ▀▀          ▀    ▀          ▀▀         ▀            

--]]

return {
  -- Lualine - simple  statusline written in  Lua
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local utils = require("lualine.utils.utils") local highlight = require("lualine.highlight")

      local diagnostics_message = require("lualine.component"):extend()

      diagnostics_message.default = {
        colors = {
          error = utils.extract_color_from_hllist(
            { "fg", "sp" },
            { "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
            "#e32636"
          ),
          warning = utils.extract_color_from_hllist(
            { "fg", "sp" },
            { "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
            "#ffa500"
          ),
          info = utils.extract_color_from_hllist( { "fg", "sp" },
            { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
            "#ffffff"
          ),
          hint = utils.extract_color_from_hllist(
            { "fg", "sp" },
            { "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
            "#273faf"
          ),
        },
      }
      function diagnostics_message:init(options)
        diagnostics_message.super:init(options)
        self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
        self.highlights = { error = "", warn = "", info = "", hint = "" }
        self.highlights.error = highlight.create_component_highlight_group(
          { fg = self.options.colors.error },
          "diagnostics_message_error",
          self.options
        )
        self.highlights.warn = highlight.create_component_highlight_group(
          { fg = self.options.colors.warn },
          "diagnostics_message_warn",
          self.options
        )
        self.highlights.info = highlight.create_component_highlight_group(
          { fg = self.options.colors.info },
          "diagnostics_message_info",
          self.options
        )
        self.highlights.hint = highlight.create_component_highlight_group(
          { fg = self.options.colors.hint },
          "diagnostics_message_hint",
          self.options
        )
      end

      function diagnostics_message:update_status()
        local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
        local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
        if #diagnostics > 0 then
          local diag = diagnostics[1]
          for _, d in ipairs(diagnostics) do
            if d.severity < diag.severity then
              diagnostics = d
            end
          end
          local icons = { " ", " ", " ", " " }
          local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
          return highlight.component_format_highlight(hl[diag.severity]) .. icons[diag.severity] .. " " .. diag.message
        else
          return ""
        end
      end

      local custom_auto = require('lualine.themes.auto')

      custom_auto.normal.c.bg = '#272e33'
      custom_auto.insert.c.bg = '#272e33'
      custom_auto.visual.c.bg = '#272e33'
      custom_auto.command.c.bg = '#272e33'
      custom_auto.terminal.c.bg = '#272e33'


      require('lualine').setup({
        options = {
          globalstatus = true,
          theme = custom_auto,
          disabled_filetypes = {
            "dashboard", "TelescopePrompt",
          },
          refresh = {
            statusline = 10,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff',},
          lualine_c = {diagnostics_message},
          lualine_x = {'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })

    end,
    event = "VeryLazy",
  },

  -- Barbecue - A  VS Code like  winbar
  {
    "utilyre/barbecue.nvim",
    config = function()
      require("barbecue").setup({
        exclude_filetypes = {'toggleterm', 'neo-tree', "dashboard", "TelescopePrompt", "norg"},
        theme = { normal = { fg = "#C6C0A9", bold = true },
        context_file = { fg = "#535F5C" },
        context_module = { fg = "#535F5C" },
        context_namespace = { fg = "#535F5C" },
        context_package = { fg = "#535F5C" },
        context_class = { fg = "#535F5C" },
        context_method = { fg = "#535F5C" },
        context_property = { fg = "#535F5C" },
        context_field = { fg = "#535F5C" },
        context_constructor = { fg = "#535F5C" },
        context_enum = { fg = "#535F5C" },
        context_interface = { fg = "#535F5C" },
        context_function = { fg = "#535F5C" },
        context_variable = { fg = "#535F5C" },
        context_constant = { fg = "#535F5C" },
        context_string = { fg = "#535F5C" },
        context_number = { fg = "#535F5C" },
        context_boolean = { fg = "#535F5C" },
        context_array = { fg = "#535F5C" },
        context_object = { fg = "#535F5C" },
        context_key = { fg = "#535F5C" },
        context_null = { fg = "#535F5C" },
        context_enum_member = { fg = "#535F5C" },
        context_struct = { fg = "#535F5C" },
        context_event = { fg = "#535F5C" },
        context_operator = { fg = "#535F5C" },
        context_type_parameter = { fg = "#535F5C" },
        },
      })
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
      local nvim_web_devicons = require "nvim-web-devicons"

      local current_icons = nvim_web_devicons.get_icons()
      local new_icons = {}

      -- Set default color
      for key, icon in pairs(current_icons) do
          icon.color = "#C6C0A9"
          icon.cterm_color = 198
          new_icons[key] = icon
      end

      nvim_web_devicons.set_icon(new_icons)
    end,
    lazy = true,
  },

  -- Bufferline - a  snazzy buffer line with tabpage integration
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup{

      highlights = {
          background = {
            bg = "#2D353B",
            fg = "#677172",
          },
          buffer_selected = {
            bg = "#21272c",
            fg = "#c6c0a9",
            bold = true,
            italic = true,
          },
          buffer_visible = {
            bg = "#21272c",
            fg = "#c6c0a9",
          },
          fill = {
            bg = "#2D353B"
          },
        },
        options = {
          always_show_bufferline = false,
          offsets = {
            { filetype = "neo-tree", text="FILE EXPLORER", padding = 0, highlight = 'BufferLineExplorer', text_align = 'left', separator = true,},
          },
          hover = {
              enabled = true,
              delay = 200,
              reveal = {'close'}
          },
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, _, diagnostics_dict)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " "
                or e == "warning" and " "
                or e == "info" and " "
                or " "
              s = s .. n .. sym
            end
            return s
          end,
          custom_areas = {
            right = function()
            local result = {}
            local seve = vim.diagnostic.severity

            -- get diagnostics from all buffers
            local error = #vim.diagnostic.get(nil, {severity = seve.ERROR})
            local warning = #vim.diagnostic.get(nil, {severity = seve.WARN})
            local info = #vim.diagnostic.get(nil, {severity = seve.INFO})
            local hint = #vim.diagnostic.get(nil, {severity = seve.HINT})

            if error ~= 0 then
            table.insert(result, {text = "  " .. error .. " ", bg = "#272e33", fg = "#c6c0a9"})
            end

            if warning ~= 0 then
            table.insert(result, {text = "  " .. warning .. " ", bg = "#272e33", fg = "#c6c0a9"})
            end

            if hint ~= 0 then
            table.insert(result, {text = "  " .. hint .. " ", bg = "#272e33", fg = "#c6c0a9"})
            end

            if info ~= 0 then
            table.insert(result, {text = "  " .. info .. " ", bg = "#272e33", fg = "#c6c0a9"})
            end
            return result
            end,
          },
        },
      }
      vim.api.nvim_set_hl(0, "BufferLineWarning", {fg="#859290", bg="#2D353B"})
      vim.api.nvim_set_hl(0, "BufferLineExplorer", {fg="#859290", bg="#2D353B", bold=true, italic=true})
    end,
    event = "VeryLazy",
  },

  -- Which-key - plugin that  displays a popup with available  key bindings
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require('which-key')

      local Terminal = require('toggleterm.terminal').Terminal

      local toggle_lazygit = function()
        local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float", count = 1 })
        return lazygit:toggle()
      end

      local toggle_neorg = function()
        local neorg = Terminal:new({ cmd = 'cd /home/hatredholder/notes; nvim /home/hatredholder/notes/index.norg', direction = "float", count = 2 })
        return neorg:toggle()
      end


      local mappings = {

        f = {"<cmd>Telescope live_grep<CR>", "Live Grep (Global Search)"},
        r = {"<cmd>Telescope find_files<CR>", "Find Files"},
        u = {"<cmd>Telescope undo<cr>", "Undo History"},
        g = {"<cmd>TodoTelescope<cr>", "See Todo's"},

        d = {
          name = "Dashboard",
          r = {"<cmd>Telescope find_files<CR>", "Find Files"},
          f = {"<cmd>Telescope live_grep<CR>", "Live Grep"},
          l = {"<cmd>Telescope oldfiles<CR>", "Old Files"},
          s = {"<cmd>SessionManager load_session<CR>", "Load Session"},
          c = {"<cmd>edit ~/.config/nvim/init.lua<CR>", "Open Config"},
          q = {"<cmd>quitall<CR>", "Quit Neovim"},
        },

        t = {
          name = "Terminal",
          g = {toggle_lazygit, "Lazygit Terminal"}
        },

        l = {
          name = "LSP",
          r = {'<cmd>LspRestart<CR>', "Restart LSP"},
          i = {"<cmd>LspInfo<cr>", "Connected Language Servers"},

          h = {'<cmd>lua vim.lsp.buf.hover()<CR>', "Hover"},

          d = {'<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition"},
          g = {'<cmd>lua vim.lsp.buf.references()<CR>', "References"},

          p = {'<cmd>Telescope diagnostics bufnr=0<CR>', "Get Diagnostics"},
          s = {'<cmd>Lspsaga show_line_diagnostics<CR>', "Show line diagnostics"},
          n = {'<cmd>lua vim.diagnostic.goto_next()<CR>', "Go to next diagnostic"},
          N = {'<cmd>lua vim.diagnostic.goto_prev()<CR>', "Go to previous diagnostic"},

          f = {'<cmd>!black %<CR>', "Format Python File"},
        },

        b = {
          name = "Bookmarks",
          m = {"<cmd> lua require('grapple').toggle() <CR>", "Mark current file"},
          o = {"<cmd> lua require('portal.builtin').grapple.tunnel()<CR>", "Open bookmarks portal"},
          b = {"<cmd> GrapplePopup tags<CR>", "Open bookmarks list"},
        },

        y = {
          name = "Debug",
          R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
          E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
          C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
          U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },

          t = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
          u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
          y = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
          o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },

          c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
          q = { "<cmd>lua require'dap'.terminate()<cr>", "Quit" },
          d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },

          e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
          g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
          h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
          s = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
          p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
          r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
          b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        },

        v = {
          name = "Visuals",
          y = { "<cmd>CellularAutomaton make_it_rain<CR>", "MAKE IT RAIN!" },
          c = { "<cmd>CellularAutomaton game_of_life<CR>", "Game of Code" },
          h = { "<cmd>Hack<CR>", "Hollywood Mode"},
        },

        o = {
          name = "Neorg",
          o = {toggle_neorg, "Open Neorg" },
          t = {"<cmd>Neorg journal today<CR>", "Journal Today"},
          y = {"<cmd>Neorg journal tomorrow<CR>", "Journal Tomorrow"},
          j = {"<cmd>Neorg journal toc update<CR>", "Update Journal"},
        }
      }

      local opts = {prefix = "<leader>"}
      wk.setup({
        ignore_missing = true
      })
      wk.register(mappings, opts)
    end,
    event = "VeryLazy",
  },

  -- Telescope -  highly extendable fuzzy finder over  lists
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup {
        extensions = {
          undo = {
            use_delta = true,
            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
            side_by_side = false,
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            mappings = {
              i = {
              -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
              -- you want to replicate these defaults and use the following actions. This means
              -- installing as a dependency of telescope in it's `requirements` and loading this
              -- extension from there instead of having the separate plugin definition as outlined
              -- above.
              ["<cr>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        },
        defaults = {
          layout_config = {
            width = 0.75,
            prompt_position = "bottom",
            preview_cutoff = 120,
            horizontal = {mirror = false},
            vertical = {mirror = false}
          },
          find_command = {
            'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
          },
          prompt_prefix = " ",
          selection_caret = " ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          file_sorter = require'telescope.sorters'.get_fuzzy_file,
          file_ignore_patterns = {},
          generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
          path_display = {},
          winblend = 0,
          border = {},
          borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
          color_devicons = true,
          use_less = true,
          set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
          file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
          grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
          qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
          buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
            }
          }
        },
      }

      require("telescope").load_extension("undo")
    end,
    dependencies = {
      "debugloop/telescope-undo.nvim",
    },
    cmd = "Telescope",
    tag = "0.1.0",
  },

  -- Gitsigns - fast  Git decorations
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        sign_priority = 100,
      })
      -- Setup gitsigns for petertriho/nvim-scrollbar
      require("scrollbar.handlers.gitsigns").setup()
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Dashboard - fancy  Neovim startscreen
  {
    "glepnir/dashboard-nvim",
    config = function()
      local db = require("dashboard")

      db.default_banner = {
      '',
      '',
      '',
      '',
      '',
      '',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠔⠒⠒⠲⠎⠀⠀⢹⡃⢀⣀⠀    ⢀⠔⠒⢢⠀⠀⠀⡖⠉⠉⠉⠒⢤⡀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠚⠙⠒⠒⠒⠤⡎⠀⠀⠀⠀⢀⣠⣴⣦⠀⠈⠘⣦⠑⠢⡀⠀⢰⠁⠀⠀⠀⠑⠰⠋⠁⠀⠀⠀⠀⠀⠈⢦⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⠀⠀⢰⠃⠀⣀⣀⡠⣞⣉⡀⡜⡟⣷⢟⠟⡀⣀⡸⠀⡎⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⣻⠀⠀⠀⠀',
      '  ⠀⠀⠀⠀⠀⠀⠀⣗⠀⠀⢀⣀⣀⣀⣀⣀⣓⡞⢽⡚⣑⣛⡇⢸⣷⠓⢻⣟⡿⠻⣝⢢⠀⢇⣀⡀⠀⠀⠀⢈⠗⠒⢶⣶⣶⡾⠋⠉⠀⠀⠀⠀⠀',
      '  ⠀⠀⠀⠀⠀⢀⠀⠈⠒⠊⠻⣷⣿⣚⡽⠃⠉⠀⠀⠙⠿⣌⠳⣼⡇⠀⣸⣟⡑⢄⠘⢸⢀⣾⠾⠥⣀⠤⠖⠁⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀ ⠀⠀',
      '⠀⠀⠀⢰⢆⠀⢀⠏⡇⠀⡀⠀⠀⠀⣿⠉⠀⠀⠀⠀⠀⠀⠀⠈⢧⣸⡇⢐⡟⠀⠙⢎⢣⣿⣾⡷⠊⠉⠙⠢⠀⠀⠀⠀⠀⢸⡇⢀⠀⠀⠀    ',
      '⠀⠀⠀⠘⡌⢣⣸⠀⣧⢺⢃⡤⢶⠆⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣟⠋⢀⠔⣒⣚⡋⠉⣡⠔⠋⠉⢰⡤⣇⠀⠀⠀⠀⢸⡇⡇⠀⠀⠀⠀⠀⠀ ',
      '⠀⠀⠀⠀⠑⢄⢹⡆⠁⠛⣁⠔⠁⠀⣿⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣿⢠⡷⠋⠁⠀⠈⣿⡇⠀⠀⠀⠈⡇⠉⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠑⣦⡔⠋⠁⠀⠀⠀⣿⠀⠀⢠⡀⢰⣼⡇⠀⡀⠀⠀⣿⠀⠁⠀⠀⠀⠀⣿⣷⠀⠀⠀⠀⡇⠀⠀⢴⣤⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⢰⣿⡇⠀⠀⠀⠀⠀⣿⡀⠀⢨⣧⡿⠋⠀⠘⠛⠀⠀⣿⠀⠀⢀⠀⠀⠀⣿⣿⠀⠀⠀⠀⢲⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⢸⡧⡄⠀⠹⣇⡆⠀⠀⠀⠀⠀⣿⠀⢰⣏⠀⣿⣸⣿⣿⠀⠀⠀⠀⣼⠀⠀⠰⠗⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⢸⡇⣷⣛⣦⣿⢀⠈⠑⠀⢠⡆⣿⠐⢠⣟⠁⢸⠸⣿⣿⢱⣤⢀⠀⣼⠀⠀⢀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⢀⠀⠀⠀⢸⡇⠘⠫⣟⡇⠊⣣⠘⠛⣾⡆⢿⠀⠙⣿⢀⣘⡃⣿⣿⡏⠉⠒⠂⡿⠀⠰⣾⡄⠀⢸⡟⣽⣀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠸⣿⡇⠀⠘⣾⠀⠀⢸⡇⢸⣇⡙⠣⠀⣹⣇⠀⠈⠧⢀⣀⣀⡏⣸⣿⣇⢹⣿⡇⢴⣴⣄⣀⡀⢰⣿⡇⠀⢸⣇⢿⡿⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠓⠁⠈⠻⢷⠾⠦⠤⠬⣅⣹⣿⣖⣶⣲⣈⡥⠤⠶⡖⠛⠒⠛⠁⠉⠛⠮⠐⢛⡓⠒⢛⠚⠒⠒⠒⠛⣚⣫⡼⠿⠿⣯⠛⠤⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⡉⠉⠁⠀⠀⠘⠓⠀⠀⠀⠀⠀⣀⣞⡿⡉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣶⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      "",
      "[ Come to the woods, for here is rest ]",
      "",
      }

      db.preview_file_height = 20
      db.preview_file_width = 70
      db.custom_center = {
        {
          -- icon = " ",
          icon = " ",
          desc = "Find Files            ",
          action = "Telescope find_files",
          shortcut = " SPC d r ",
        },
        {
          -- icon = " ",
          icon = " ",
          desc = "Search Text           ",
          action = "Telescope live_grep",
          shortcut = " SPC d f ",
        },
        {
          -- icon = "羽",
          icon = " ",
          desc = "Recent Files          ",
          action = "Telescope oldfiles",
          shortcut = " SPC d l ",
        },
        {
          -- icon = "ﭢ ",
          icon = " ",
          desc = "Load Session          ",
          action = "SessionManager! load_last_session",
          shortcut = " SPC d s ",
        },
        {
          -- icon = " ",
          icon = " ",
          desc = "Open Config           ",
          action = "edit ~/.config/nvim/init.lua",
          shortcut = " SPC d c ",
        },
        {
          -- icon = " ",
          icon = " ",
          desc = "Quit Neovim           ",
          action = "quitall",
          shortcut = " SPC d q ",
        }
      }

      db.custom_footer = {"", "[ Loaded " .. require("lazy").stats().count .. " plugins successfully!   ]"}


    end,
    commit = "e517188dab55493fb9034b4d4f1a508ccacfcd45",
    event = "VimEnter",
  },

  -- Indent-blankline - adds  indentation guides to all lines
  {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
      vim.g.indent_blankline_filetype_exclude = {"norg"}
    end,
    config = function()
      require("indent_blankline").setup {
        char = "│",
        use_treesitter = true,
        show_current_context = false,
        show_trailing_blankline_indent = false,
      }

    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Toggleterm - persist and toggle multiple  terminals
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require"toggleterm".setup {
        size = 15,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = '1',
        start_in_insert = true,
        persist_size = true,
        direction = 'float',
         highlights = {
          FloatBorder = {
            guifg = "#A7C080",
          },
        },
      }
    end,
    cmd = "ToggleTerm",
  },

  -- Noice - completely replaces the  UI for messages,  cmdline and the  popupmenu
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
          },
        },
        presets = {
          long_message_to_split = true,
        },
      })

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
      require("notify").setup{
        background_colour = "Normal",
        fps = 60,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = 2,
        minimum_width = 10,
        render = "minimal",
        stages = "fade",
        timeout = 3000,
        top_down = true,
      }
    end,
    event = "VeryLazy",
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
    "petertriho/nvim-scrollbar",
    config = function()
      require('scrollbar').setup({
        handle = {
          color = "#48565d",
        },
        marks = {
          Search = { color = "#2d353b"},
          Error = { color = "#e67e80"},
          Warn = { color = "#dbbc7f"},
          Info = { color = "#7fbbb3"},
          Hint = { color = "#a7c080"},
          Misc = { color = "#859289"},

          GitAdd = { color = "#a7c080"},
          GitChange = { color = "#7fbbb3"},
          GitDelete = { color = "#e67e80"},
        },
        handlers = {
              cursor = false,
              diagnostic = true,
              gitsigns = true, -- Requires gitsigns
              handle = true,
              search = false, -- Requires hlslens
          },
        excluded_filetypes = {
              "prompt",
              "TelescopePrompt",
              "noice",
              "neo-tree",
              "dashboard",
          },
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Cellular-automaton -  useless but  fancy animations for buffer text
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },

  -- Hacker - Hollywood  hacker experience
  {
    "letieu/hacker.nvim",
    config = function()
      require("hacker").setup {
        filetype = "lua", -- filetype of code snippet
        speed = { -- characters insert each time, random from min -> max
          min = 2,
          max = 10,
        },
        is_popup = false, -- show random float window when typing
        popup_after = 5,
      }
      vim.cmd[[SmoothCursorToggle]]
    end,
    cmd = "Hack",
  },


  -- SmoothCursor -  sub-cursor to show 📜scroll direction
  {
    'gen740/SmoothCursor.nvim',
    config = function()
      require('smoothcursor').setup({
          priority = 1,
          cursor = "",
          texthl = "CursorLineNr",
          disabled_filetypes = {'neo-tree', "dashboard", "TelescopePrompt", "help",},
      })
    end,
    event = "VeryLazy"
  },

  -- Dressing -  plugin to improve the default  vim.ui  interfaces 
  {
    "stevearc/dressing.nvim",
    config = function()
      require('dressing').setup({
        select = {
          backend = { "fzf_lua"},
        },
      })
    end,
    event = "VeryLazy",
  },

  -- Illuminate -  plugin for automatically ﯧ highlighting other uses of the  word
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        min_count_to_highlight = 2,
        under_cursor = false,
        filetypes_denylist = {
          'neo-tree',
          'norg',
        },
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Mini.indentscope -  visualize and  operate on indent  scope
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "packer", 'neo-tree', "dashboard",
          "TelescopePrompt", "DiffviewFilePanel", "diff",
          "help", "norg", 'toggleterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
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
      local modicator = require('modicator')

      modicator.setup({
        -- Show warning if any required option is missing
        show_warnings = true,
        highlights = {
          -- Default options for bold/italic. You can override these individually
          -- for each mode if you'd like as seen below.
          defaults = {
            foreground = modicator.get_highlight_bg('Search'),
            -- background = modicator.get_highlight_bg('CursorLineNr'),
            bold = true,
            italic = false
          },
          -- Color and bold/italic options for each mode. You can add a bold and/or
          -- italic key pair to override the default highlight for a specific mode if
          -- you would like.
          modes = {
            ['n'] = {
              foreground = modicator.get_highlight_bg('Search'),
            },
            ['i']  = {
              foreground = modicator.get_highlight_fg('ModeMsg'),
            },
            ['v']  = {
              foreground = modicator.get_highlight_bg('IncSearch'),
            },
            ['V']  = {
              foreground = modicator.get_highlight_bg('IncSearch'),
            },
            ['�'] = { -- This symbol is the ^V character
              foreground = modicator.get_highlight_fg('Type'),
            },
            ['s']  = {
              foreground = modicator.get_highlight_fg('Keyword'),
            },
            ['S']  = {
              foreground = modicator.get_highlight_fg('Keyword'),
            },
            ['R']  = {
              foreground = modicator.get_highlight_fg('Title'),
            },
            ['c']  = {
              foreground = modicator.get_highlight_bg('Search'),
            },
          },
        },
      })

      vim.cmd([[set cursorline]])
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Portal - improved location  list  navigation 
  {
    "cbochs/portal.nvim",
    config = function()
      require("portal").setup({
        escape = {
          ["q"] = true,
          ["<esc>"] = true,
        },
        window_options = {
          relative = "cursor",
          width = 80,
          height = 5,
          col = 3,
          focusable = false,
          border = "single",
          noautocmd = true,
        }
      })
    end,
    dependencies = {
      "cbochs/grapple.nvim",
    },
  },

  -- Incline - 🎈Floating statuslines
  {
    "b0o/incline.nvim",
    config = function()
      require('incline').setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#a5b888", guifg = "#e1e1d7" },
          },
        },
        window = {
          margin = {
            horizontal = 5,
            vertical = 3,
          },
          options = {
            signcolumn = "no",
            wrap = true
          },
        },
        ignore = {
          buftypes = "special",
          filetypes = {"norg"},
          floating_wins = true,
          unlisted_buffers = true,
          wintypes = "special"
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, _ = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = "#e1e1d7" }, { " " }, { filename } }
        end,
      })
    end,
    event = "VeryLazy"
  },

  -- (disabled until https://github.com/levouh/tint.nvim/issues/38 gets fixed)
  -- Tint -  dim inactive  windows using window-local  highlight namespaces. 
  {
    "levouh/tint.nvim",
    config = function()
      require("tint").setup()
    end,
    event = { "BufReadPre", "BufNewFile" },
  }
}
