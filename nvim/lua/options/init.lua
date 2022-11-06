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
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.ch = 0 -- Hide command line
vim.o.clipboard = "unnamedplus" -- System level clipboard
vim.o.pumblend = 25 -- Pseudo-transparency for popup windows

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.autoindent = true
vim.bo.expandtab = true

vim.opt.termguicolors = true -- Enable all terminal colors

vim.wo.number = true -- Enable line numbers

