-- Set Bufferline colors
vim.cmd([[
highlight! BufferLineWarning guifg=#859290 guibg=#21272c guisp=#dbbc7f

highlight! BufferLineHintDiagnosticVisible guifg=#A7C07F
highlight! BufferLineHintDiagnosticSelected guifg=#A7C07F gui=italic,bold
highlight! BufferLineHintSelected guifg=#A7C07F  gui=italic,bold

highlight! BufferLineInfoSelected guifg=#7fbbb3 gui=italic,bold
highlight! BufferLineInfoDiagnosticSelected guifg=#7fbbb3 gui=italic,bold
]])

-- Set Dashboard colors
vim.cmd('highlight! DashboardHeader guifg=#96A97A')
vim.cmd('highlight! DashboardCenter guifg=#DBBC7F')
vim.cmd('highlight! DashboardShortcut guifg=#DB7A7C')
vim.cmd('highlight! DashboardFooter guifg=#96A97A')

-- Set Neo-tree colors
vim.cmd([[
highlight! BufferLineWarning guifg=#DBBC7F
highlight! NeoTreeGitConflict guifg=#7FBBB3 
highlight! NeoTreeGitUntracked guifg=#DBBC7F
highlight! NeoTreeGitTabInactive guibg=#191E22
highlight! NeoTreeGitDotfile guibg=#888888
highlight! NeoTreeGitUnstaged guifg=#7FBBB3
highlight! NeoTreeNormal guibg=#2F383E
highlight! NeoTreeEndOfBuffer guibg=#2F383E
highlight! NeoTreeRootName guifg=#C6C0A9 gui=italic,bold
]])

-- Set Noice colors
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { ctermbg=0, fg="#83C092"})
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupIconCmdline", { ctermbg=0, fg="#83C092"})
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { ctermbg=0, fg="#E69875"})
vim.api.nvim_set_hl(0, "NoiceCmdlineIconInput", { ctermbg=0, fg="#E69875"})

-- Set Treesitter colors
vim.cmd([[
highlight! TSAttribute guifg=#E69875
]])

-- Set Modicator colors
vim.cmd([[
highlight! CursorLineNr guifg=#a7c080
]])

-- Set Illuminate colors
vim.cmd([[
highlight! IlluminatedWordRead gui=underline guibg=#2D353B
highlight! IlluminatedWordText gui=underline guibg=#2D353B
highlight! IlluminatedWordWrite gui=underline guibg=#2D353B
]])

-- Set Lualine Colors
vim.cmd([[
highlight! lualine_c_inactive guibg=#323b42
]])

-- Set Whichkey colors
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg=0, fg="#d3c6aa", bg="#323b42"})
