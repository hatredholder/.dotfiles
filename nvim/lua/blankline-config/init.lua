vim.g.indent_blankline_show_trailing_blankline_indent=false

require("indent_blankline").setup {
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
}
