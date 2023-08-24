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

vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w!<cr>', {noremap = true, silent = true})  --| Force save
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>qa!<cr>', {noremap = true, silent = true}) --| Force quit

vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>qa!<cr>', {noremap = true, silent = true}) --| Force quit

vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>0"_D', {noremap = true, silent = true}) --| Newline in normal mode on next line
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>0"_D', {noremap = true, silent = true}) --| Newline in normal mode on current line

vim.api.nvim_set_keymap('n', '<Leader>s', '<cmd>vsplit<cr>', {noremap = true, silent = true}) --| Newline in normal mode on current line
vim.api.nvim_set_keymap('n', '<Leader>w', '<cmd>WinShift<cr>', {noremap = true, silent = true}) --| Rearrange windows

vim.keymap.set("n", "J", "mzJ`z") -- Append to current line with space without moving cursor

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Jump half page down without moving cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Jump half page up without moving cursor

vim.keymap.set("n", "n", "nzzzv") -- |
--                                -- | Search terms in the middle
vim.keymap.set("n", "N", "Nzzzv") -- |

-- Smart-splits hotkeys --
vim.api.nvim_set_keymap('n', '<A-h>',
'<cmd> lua require("smart-splits").move_cursor_left()<CR>', {noremap = true, silent = true})  --| Window Left
vim.api.nvim_set_keymap('n', '<A-l>',
'<cmd> lua require("smart-splits").move_cursor_right()<CR>', {noremap = true, silent = true}) --| Window Right
vim.api.nvim_set_keymap('n', '<A-k>',
'<cmd> lua require("smart-splits").move_cursor_up()<CR>', {noremap = true, silent = true})    --| Window Up
vim.api.nvim_set_keymap('n', '<A-j>',
'<cmd> lua require("smart-splits").move_cursor_down()<CR>', {noremap = true, silent = true})  --| Window Down

-- Bufferline hotkeys --
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>BufferLineCycleNext<CR>', {noremap = true, silent = true}) --| Go to next buffer
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>BufferLineCyclePrev<CR>', {noremap = true, silent = true}) --| Go to previous buffer
vim.api.nvim_set_keymap('n', '<C-w>', '<cmd>Bwipeout!<CR>', {noremap = true, silent = true})           --| Close buffer
vim.api.nvim_set_keymap('n', '<a-w>', '<cmd>bwipeout!<CR>', {noremap = true, silent = true})           --| Close buffer

vim.api.nvim_set_keymap('n', '>b', '<cmd>BufferLineMoveNext<cr>', {noremap = true, silent = true}) --| Move buffer right 
vim.api.nvim_set_keymap('n', '<b', '<cmd>BufferLineMovePrev<cr>', {noremap = true, silent = true}) --| Move buffer left

vim.api.nvim_set_keymap('n', '<A-1>', '<cmd>BufferLineGoToBuffer 1<cr>', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('n', '<A-2>', '<cmd>BufferLineGoToBuffer 2<cr>', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('n', '<A-3>', '<cmd>BufferLineGoToBuffer 3<cr>', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('n', '<A-4>', '<cmd>BufferLineGoToBuffer 4<cr>', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('n', '<A-5>', '<cmd>BufferLineGoToBuffer 5<cr>', {noremap = true, silent = true}) --| Go to buffer by number
vim.api.nvim_set_keymap('n', '<A-6>', '<cmd>BufferLineGoToBuffer 6<cr>', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('n', '<A-7>', '<cmd>BufferLineGoToBuffer 7<cr>', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('n', '<A-8>', '<cmd>BufferLineGoToBuffer 8<cr>', {noremap = true, silent = true}) --| 
vim.api.nvim_set_keymap('n', '<A-9>', '<cmd>BufferLineGoToBuffer 9<cr>', {noremap = true, silent = true}) --|

-- mini.files hotkeys --
vim.api.nvim_set_keymap('n', '<Leader>n', '', {desc = 'Focus current file in file explorer', callback = function()
		if not require("mini.files").close() then
			require("mini.files").open(vim.api.nvim_buf_get_name(0))
			require("mini.files").reveal_cwd()
		end
	end})

-- Notify hotkeys --
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>', { noremap = true, silent = true }) --| Dismiss notifications

-- Treesj hotkeys --
vim.keymap.set('n', '<c-b>', function() require('treesj').toggle({ split = { recursive = true } }) end)

-- Fold hotkeys --
vim.api.nvim_set_keymap('n', 'zq', "<cmd>lua require('fold-preview').toggle_preview()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'za', "za<cmd>lua require('fold-preview').close_preview()<CR>", {noremap = true, silent = true})
