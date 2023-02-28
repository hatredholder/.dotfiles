require("nvim-treesitter.configs").setup({
  indent = {
    enable = true,
    disable = {"python"}
  },
  autotag = {
    enable = true,
    filetypes = {"html", "htmldjango"},
  },
  ensure_installed = {"python"},
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
