require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  -- A list of parser names, or "all"
  ensure_installed = {"python"},

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
