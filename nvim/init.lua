--[[                                                                                

 ▄█  ███▄▄▄▄    ▄█      ███        ▄█       ███    █▄     ▄████████
███  ███▀▀▀██▄ ███  ▀█████████▄   ███       ███    ███   ███    ███
███▌ ███   ███ ███▌    ▀███▀▀██   ███       ███    ███   ███    ███
███▌ ███   ███ ███▌     ███   ▀   ███       ███    ███   ███    ███
███▌ ███   ███ ███▌     ███       ███       ███    ███ ▀███████████
███  ███   ███ ███      ███       ███       ███    ███   ███    ███
███  ███   ███ ███      ███       ███▌    ▄ ███    ███   ███    ███
█▀    ▀█   █▀  █▀      ▄████▀     █████▄▄██ ████████▀    ███    █▀
▀      ▀                ▀      ▀    ▀          ▀▀         ▀       

--]]

-- Load basic configs
require('plugins')
require('options')
require('hotkeys')

-- Set Colorscheme
vim.cmd('colorscheme everforest')

-- Set color for NormalFloat (WhichKey, Noice, etc.)
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg=0, fg="#d3c6aa", bg="#343f44"})

-- Set crosshair cursor
vim.cmd(':set cursorline! cursorcolumn!')
