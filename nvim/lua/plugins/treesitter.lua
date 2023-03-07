return {
  -- Treesitter - basic syntax ﯧ highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
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
    end,
    priority = 100,
    build = ":TSUpdate",
  },
  -- Treesitter-autotag - auto  tags for  HTML 
  {
    "windwp/nvim-ts-autotag",
  },
}
