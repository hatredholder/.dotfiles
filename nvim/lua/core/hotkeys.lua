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

-- Vanilla Vim hotkeys --
vim.api.nvim_set_keymap('n', 'd', '"_d', {noremap = true, silent = true}) --|
vim.api.nvim_set_keymap('n', 'D', '"_D', {noremap = true, silent = true}) --|
vim.api.nvim_set_keymap('n', 'c', '"_c', {noremap = true, silent = true}) --| Delete without copying in Normal
vim.api.nvim_set_keymap('n', 'C', '"_C', {noremap = true, silent = true}) --|
vim.api.nvim_set_keymap('n', 'x', '"_x', {noremap = true, silent = true}) --|

vim.api.nvim_set_keymap('v', 'd', '"_d', {noremap = true, silent = true}) --|
vim.api.nvim_set_keymap('v', 'D', '"_D', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('v', 'c', '"_c', {noremap = true, silent = true}) --| Delete without copying in Visual
vim.api.nvim_set_keymap('v', 'C', '"_C', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('v', 'x', '"_x', {noremap = true, silent = true}) --| 

vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w!<cr>', {noremap = true, silent = true})
--| Force save
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>q!<cr>', {noremap = true, silent = true})
--| Force quit

vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>0"_D', {noremap = true, silent = true}) -- | Newline in normal mode on next line
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>0"_D', {noremap = true, silent = true}) -- | Newline in normal mode on current line

vim.api.nvim_set_keymap('n', '<C-h>',
'<cmd> lua require("smart-splits").move_cursor_left()<CR>', {noremap = true, silent = true})  --| Window Left
vim.api.nvim_set_keymap('n', '<C-l>',
'<cmd> lua require("smart-splits").move_cursor_right()<CR>', {noremap = true, silent = true}) --| Window Right
vim.api.nvim_set_keymap('n', '<C-k>',
'<cmd> lua require("smart-splits").move_cursor_up()<CR>', {noremap = true, silent = true})    --| Window Up
vim.api.nvim_set_keymap('n', '<C-j>',
'<cmd> lua require("smart-splits").move_cursor_down()<CR>', {noremap = true, silent = true})  --| Window Down

vim.keymap.set("n", "J", "mzJ`z") -- Append to current line with space without moving cursor

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Jump half page down without moving cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Jump half page up without moving cursor

vim.keymap.set("n", "n", "nzzzv") -- |
--                                -- | Search terms in the middle
vim.keymap.set("n", "N", "Nzzzv") -- |

-- Bufferline hotkeys --
vim.api.nvim_set_keymap('n', '<C-m>', '<cmd>BufferLineCycleNext<CR>', {noremap = true, silent = true}) -- | Go to next buffer
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>BufferLineCyclePrev<CR>', {noremap = true, silent = true}) -- | Go to previous buffer
vim.api.nvim_set_keymap('n', '<C-w>', '<cmd>bd!<CR>', {noremap = true, silent = true})            -- | Close buffer

vim.api.nvim_set_keymap('n', '>b', '<cmd>BufferLineMoveNext<cr>', {noremap = true, silent = true}) --| Move buffer rigtht
vim.api.nvim_set_keymap('n', '<b', '<cmd>BufferLineMovePrev<cr>', {noremap = true, silent = true}) --| Move buffer left

-- Neo-Tree hotkeys --
vim.api.nvim_set_keymap('n', '<Leader>n', ':Neotree toggle<CR>', {noremap = true, silent = true}) --| Toggle Neo-Tree

-- Notify hotkeys --
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<c-o>", "<cmd>Portal jumplist backward<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-i>", "<cmd>Portal jumplist forward<cr>", {noremap = true, silent = true})
