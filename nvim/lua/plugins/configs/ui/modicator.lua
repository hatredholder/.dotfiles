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
