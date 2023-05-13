--[[

    ███        ▄████████    ▄████████    ▄████████    ▄████████  ▄█      ███         ███        ▄████████    ▄████████    ▄█       ███    █▄     ▄████████ 
▀█████████▄   ███    ███   ███    ███   ███    ███   ███    ███ ███  ▀█████████▄ ▀█████████▄   ███    ███   ███    ███   ███       ███    ███   ███    ███ 
   ▀███▀▀██   ███    ███   ███    █▀    ███    █▀    ███    █▀  ███▌    ▀███▀▀██    ▀███▀▀██   ███    █▀    ███    ███   ███       ███    ███   ███    ███ 
    ███   ▀  ▄███▄▄▄▄██▀  ▄███▄▄▄      ▄███▄▄▄       ███        ███▌     ███   ▀     ███   ▀  ▄███▄▄▄      ▄███▄▄▄▄██▀   ███       ███    ███   ███    ███ 
    ███     ▀▀███▀▀▀▀▀   ▀▀███▀▀▀     ▀▀███▀▀▀     ▀███████████ ███▌     ███         ███     ▀▀███▀▀▀     ▀▀███▀▀▀▀▀     ███       ███    ███ ▀███████████ 
    ███     ▀███████████   ███    █▄    ███    █▄           ███ ███      ███         ███       ███    █▄  ▀███████████   ███       ███    ███   ███    ███ 
    ███       ███    ███   ███    ███   ███    ███    ▄█    ███ ███      ███         ███       ███    ███   ███    ███   ███▌    ▄ ███    ███   ███    ███ 
   ▄████▀     ███    ███   ██████████   ██████████  ▄████████▀  █▀      ▄████▀      ▄████▀     ██████████   ███    ███   █████▄▄██ ████████▀    ███    █▀  
     ▀        ▀        ▀      ▀▀           ▀▀         ▀▀        ▀         ▀           ▀           ▀▀        ▀        ▀ ▀   ▀          ▀▀        ▀        

--]]

return {
  -- Treesitter - basic syntax ﯧ highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { "jsx", "cpp" },
          -- Which query to use for finding delimiters
          query = {
            'rainbow-parens',
            html = 'rainbow-tags',
          },
          -- Highlight the entire buffer all at once
          strategy = require 'ts-rainbow.strategy.global',
        },
        indent = {
          enable = true,
          disable = {"python"}
        },
        autotag = {
          enable = true,
          filetypes = {"html", "htmldjango"},
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ensure_installed = {"python"},
      })
    end,
    priority = 100,
    build = ":TSUpdate",
  },
  -- Treesitter-autotag - auto  tags for  HTML 
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
  },

  -- TS-Rainbow2 - 🌈Rainbow delimiters through 🎄Tree-sitter 
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "VeryLazy",
  }
}
