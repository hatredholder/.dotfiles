--[[

  ▄█    █▄    ▄██████▄      ███       ▄█   ▄█▄  ▄████████ ▄██   ▄     ▄████████     ▄█       ███    █▄     ▄████████ 
 ███    ███  ███    ███ ▀█████████▄  ███ ▄███▀ ███    ███ ███   ██▄  ███    ███    ███       ███    ███   ███    ███ 
 ███    ███  ███    ███    ▀███▀▀██  ███▐██▀   ███    █▀  ███▄▄▄███  ███    █▀     ███       ███    ███   ███    ███ 
▄███▄▄▄▄███▄ ███    ███     ███   ▀ ▄█████▀   ▄███▄▄▄     ▀▀▀▀▀▀███  ███           ███       ███    ███   ███    ███ 
▀███▀▀▀▀███▀ ███    ███     ███    ▀▀█████▄   ▀███▀▀▀     ▄██   ███ ███████████    ███       ███    ███ ▀███████████ 
 ███    ███  ███    ███     ███      ███▐██▄   ███    █▄  ███   ███         ███    ███       ███    ███   ███    ███ 
 ███    ███  ███    ███     ███      ███ ▀███▄ ███    ███ ███   ███   ▄█    ███    ███▌    ▄ ███    ███   ███    ███ 
  ▀█    █▀    ▀██████▀     ▄████▀    ███   ▀█▀ ██████████  ▀█████▀  ▄████████▀     █████▄▄██ ████████▀    ███    █▀  
   ▀             ▀▀           ▀       ▀            ▀▀         ▀                 ▀     ▀           ▀▀       ▀                     
--]]
-- Set Mapleader to Space --
vim.g.mapleader = ' '

-- Vanilla Vim hotkeys --
vim.api.nvim_set_keymap('n', 'd', '"_d', {noremap = true, silent = true}) --|
vim.api.nvim_set_keymap('n', 'D', '"_D', {noremap = true, silent = true}) --| Delete without copying in Normal
vim.api.nvim_set_keymap('n', 'x', '"_x', {noremap = true, silent = true}) --| 

vim.api.nvim_set_keymap('v', 'd', '"_d', {noremap = true, silent = true}) --|
vim.api.nvim_set_keymap('v', 'D', '"_D', {noremap = true, silent = true}) --| Delete without copying in Visual
vim.api.nvim_set_keymap('v', 'x', '"_x', {noremap = true, silent = true}) --| 

vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w!<cr>', {noremap = true, silent = true})
--| Force save
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>lua require("codewindow").toggle_minimap()<CR><bar><cmd>q!<cr>', {noremap = true, silent = true})
--| Force quit

vim.api.nvim_set_keymap('n', '<C-Left>',
'<cmd> lua require("smart-splits").move_cursor_left()<CR>', {noremap = true, silent = true}) ---| Window Left
vim.api.nvim_set_keymap('n', '<C-Right>',
'<cmd> lua require("smart-splits").move_cursor_right()<CR>', {noremap = true, silent = true}) --| Window Right
vim.api.nvim_set_keymap('n', '<C-Up>',
'<cmd> lua require("smart-splits").move_cursor_up()<CR>', {noremap = true, silent = true}) -----| Window Up
vim.api.nvim_set_keymap('n', '<C-Down>',
'<cmd> lua require("smart-splits").move_cursor_down()<CR>', {noremap = true, silent = true}) ---| Window Down

-- Bufferline hotkeys --
vim.api.nvim_set_keymap('n', '<C-l>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true}) --| Go to next buffer
vim.api.nvim_set_keymap('n', '<C-h>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true}) --| Go to previous buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':Bdelete<CR>', {noremap = true, silent = true}) --------------| Close buffer

vim.api.nvim_set_keymap('n', '>b', '<cmd>BufferLineMoveNext<cr>', {noremap = true, silent = true}) --| Move buffer rigtht
vim.api.nvim_set_keymap('n', '<b', '<cmd>BufferLineMovePrev<cr>', {noremap = true, silent = true}) ---| Move buffer left

-- Nvim-Tree hotkeys --
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true}) --| Toggle NvimTree

-- Comment Hotkey -- 
vim.api.nvim_set_keymap('n', '<c-_>', ':CommentToggle<CR>', {noremap = true, silent = true}) --| Comment in Normal
vim.api.nvim_set_keymap('v', '<c-_>', ':CommentToggle<CR>', {noremap = true, silent = true}) --| Comment in Visual
