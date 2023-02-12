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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Load basic configs
require('options')
require('plugins')
require('hotkeys')

-- Set Colorscheme
vim.cmd('colorscheme everforest')

-- Set Custom Colors
require('colors')

-- Set crosshair cursor
vim.cmd(':set cursorline! cursorcolumn!')
