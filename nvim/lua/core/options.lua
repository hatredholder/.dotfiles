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

-- Set crosshair cursor
vim.cmd(':set cursorcolumn!')

-- Filetype loads
vim.cmd [[augroup filetype_settings]]
vim.cmd [[au!]]
vim.cmd [[au FileType go setlocal shiftwidth=4]]
vim.cmd [[au FileType go setlocal tabstop=4]]
vim.cmd [[au FileType lua setlocal shiftwidth=2]]
vim.cmd [[au FileType html setlocal shiftwidth=4]]
vim.cmd [[au FileType python setlocal colorcolumn=100]]
vim.cmd [[au FileType htmldjango setlocal filetype=html]]
vim.cmd("augroup END")

vim.o.timeoutlen = 300 -- time in milliseconds to wait for a mapped sequence to complete
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.conceallevel = 2
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
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
vim.o.pumblend = 10 -- Pseudo-transparency for popup windows

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.autoindent = false
vim.bo.expandtab = true

vim.opt.termguicolors = true -- Enable all terminal colors
vim.opt.undofile = true -- Enable unlimited undos between shutdowns
vim.opt.fillchars:append { eob = " " } -- Disable ~ symbol

-- vim.wo.number = true -- Enable line numbers
vim.wo.relativenumber = true -- Enable relative line numbers


-- nvim-ufo settings
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- modicator.nvim settings
vim.o.number = true
vim.o.termguicolors = true

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

-- Prioritize diagnostic signs
vim.diagnostic.config {
  virtual_text = {
    prefix = '',
  },
  severity_sort = true,
}

-- Format .go file on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
     vim.lsp.buf.format()
  end,
})
