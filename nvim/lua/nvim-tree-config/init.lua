-- Set Nvim-Tree folder icon color to green
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { ctermbg=0, fg="#8CA072"})

require("nvim-tree").setup({
  filters = {
    dotfiles = false,
    custom = { "^.git$", "__pycache__" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {'dashboard'},
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  },
  view = {
    width = 30,
    side = 'left',
    mappings = {custom_only = false, list = {}}
  },
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = "",
      },
    },
    icons = {
      git_placement = "before",
      show = {
        folder_arrow = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
      enable = true,
      ignore = false,
      show_on_dirs = true,
      timeout = 400,
    },
})

