--[[

 ▄██████▄     ▄███████▄     ███      ▄█   ▄██████▄  ███▄▄▄▄      ▄████████     ▄█       ███    █▄     ▄████████ 
███    ███   ███    ███ ▀█████████▄ ███  ███    ███ ███▀▀▀██▄   ███    ███    ███       ███    ███   ███    ███ 
███    ███   ███    ███    ▀███▀▀██ ███▌ ███    ███ ███   ███   ███    █▀     ███       ███    ███   ███    ███ 
███    ███   ███    ███     ███   ▀ ███▌ ███    ███ ███   ███   ███           ███       ███    ███   ███    ███ 
███    ███ ▀█████████▀      ███     ███▌ ███    ███ ███   ███ ▀███████████    ███       ███    ███ ▀███████████ 
███    ███   ███            ███     ███  ███    ███ ███   ███          ███    ███       ███    ███   ███    ███ 
███    ███   ███            ███     ███  ███    ███ ███   ███    ▄█    ███    ███▌    ▄ ███    ███   ███    ███ 
 ▀██████▀   ▄████▀         ▄████▀   █▀    ▀██████▀   ▀█   █▀   ▄████████▀     █████▄▄██ ████████▀    ███    █▀  
   ▀▀        ▀                ▀              ▀▀       ▀          ▀         ▀     ▀           ▀▀       ▀             

--]]

vim.cmd("filetype plugin indent on")

vim.cmd [[augroup filetype_settings]]
vim.cmd [[au!]]
-- Filetype loads
vim.cmd [[au FileType lua setlocal shiftwidth=2]]
vim.cmd [[au FileType html setlocal shiftwidth=4]]
vim.cmd [[au FileType htmldjango setlocal filetype=html]]
vim.cmd("augroup END")

vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.ch = 0 -- Hide command line
vim.o.clipboard = "unnamedplus" -- System level clipboard
vim.o.pumblend = 25 -- Pseudo-transparency for popup windows

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.autoindent = false
vim.bo.expandtab = true

vim.opt.termguicolors = true -- Enable all terminal colors
vim.opt.undofile = true -- Enable unlimited undos between shutdowns
vim.opt.fillchars:append { eob = " " } -- Disable ~ symbol

vim.wo.number = true -- Enable line numbers


-- nvim-ufo settings
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldnestmax = 1
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Highlight yanked text

local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

au('TextYankPost', {
  group = ag('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=1500 }
  end,
})

-- Disable shift-k
vim.cmd('map <S-k> <Nop>')

-- Disable Swapfile
vim.cmd('set noswapfile')
