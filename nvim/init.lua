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

-- Hide ~ symbols 
vim.cmd('highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg')

-- Set crosshair cursor
vim.cmd(':set cursorline! cursorcolumn!')

