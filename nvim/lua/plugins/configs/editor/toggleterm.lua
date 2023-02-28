require"toggleterm".setup {
  size = 10,
  open_mapping = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'float',
   highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    FloatBorder = {
      guifg = "#A7C080",
    },
  },
}
