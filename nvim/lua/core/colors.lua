--[[


 ▄████████  ▄██████▄   ▄█        ▄██████▄     ▄████████    ▄████████    ▄█       ███    █▄     ▄████████ 
███    ███ ███    ███ ███       ███    ███   ███    ███   ███    ███   ███       ███    ███   ███    ███ 
███    █▀  ███    ███ ███       ███    ███   ███    ███   ███    █▀    ███       ███    ███   ███    ███ 
███        ███    ███ ███       ███    ███  ▄███▄▄▄▄██▀   ███          ███       ███    ███   ███    ███ 
███        ███    ███ ███       ███    ███ ▀▀███▀▀▀▀▀   ▀███████████   ███       ███    ███ ▀███████████ 
███    █▄  ███    ███ ███       ███    ███ ▀███████████          ███   ███       ███    ███   ███    ███ 
███    ███ ███    ███ ███▌    ▄ ███    ███   ███    ███    ▄█    ███   ███▌    ▄ ███    ███   ███    ███ 
████████▀   ▀██████▀  █████▄▄██  ▀██████▀    ███    ███  ▄████████▀    █████▄▄██ ████████▀    ███    █▀  
   ▀▀          ▀▀       ▀           ▀▀       ▀        ▀    ▀▀        ▀    ▀          ▀▀        ▀         

--]]

-- Set Bufferline colors
vim.api.nvim_set_hl(0, "BufferLineWarning", {fg="#c6c0a9", bg="#21272c"})

vim.cmd([[

highlight! BufferTabpageFill guifg=#2D353B guibg=#2D353B

highlight! BufferCurrent guifg=#c6c0a9 guibg=#21272c gui=italic,bold
highlight! BufferCurrentMod guifg=#a7c080 guibg=#21272c gui=italic,bold
highlight! BufferCurrentSign guifg=#a7c080 guibg=#21272c

highlight! BufferInactive guifg=#677172 guibg=#2D353B
highlight! BufferInactiveMod guifg=#677172 guibg=#2D353B
highlight! BufferInactiveSign guifg=#2D353B guibg=#2D353B

highlight! BufferLineDiagnosticVisible guifg=#c6c0a9 guibg=#21272c

highlight! BufferLineHint guifg=#677172 guibg=#2D353B
highlight! BufferLineHintVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineHintDiagnostic guifg=#677172 guibg=#2D353B
highlight! BufferLineHintDiagnosticVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineHintDiagnosticSelected guifg=#A7C07F guibg=#21272c gui=italic,bold
highlight! BufferLineHintSelected guifg=#A7C07F  guibg=#21272c gui=italic,bold

highlight! BufferLineInfo guifg=#677172 guibg=#2D353B
highlight! BufferLineInfoVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineInfoDiagnostic guifg=#677172 guibg=#2D353B
highlight! BufferLineInfoDiagnosticVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineInfoDiagnosticSelected guifg=#7fbbb3 guibg=#21272c gui=italic,bold
highlight! BufferLineInfoSelected guifg=#7fbbb3  guibg=#21272c gui=italic,bold

highlight! BufferLineWarning guifg=#677172 guibg=#2D353B
highlight! BufferLineWarningVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineWarningDiagnostic guifg=#677172 guibg=#2D353B
highlight! BufferLineWarningDiagnosticVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineWarningDiagnosticSelected guifg=#DBBC7F guibg=#21272c gui=italic,bold
highlight! BufferLineWarningSelected guifg=#DBBC7F  guibg=#21272c gui=italic,bold

highlight! BufferLineError guifg=#677172 guibg=#2D353B
highlight! BufferLineErrorVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineErrorDiagnostic guifg=#677172 guibg=#2D353B
highlight! BufferLineErrorDiagnosticVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineErrorDiagnosticSelected guifg=#DB7A7C guibg=#21272c gui=italic,bold
highlight! BufferLineErrorSelected guifg=#DB7A7C  guibg=#21272c gui=italic,bold

highlight! BufferLineOffsetSeparator guifg=#4f585e guibg=#2D353B

highlight! BufferLineSeparator guifg=#2D353B  guibg=#2D353B
highlight! BufferLineSeparatorVisible guifg=#21272c  guibg=#21272c
highlight! BufferLineSeparatorSelected guifg=#21272c  guibg=#21272c

highlight! BufferLineDuplicate guifg=#c6c0a9 guibg=#2d353b
highlight! BufferLineDuplicateVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineDuplicateSelected guifg=#c6c0a9 guibg=#21272c gui=italic,bold

highlight! BufferLineCloseButton guifg=#c6c0a9 guibg=#2D353B
highlight! BufferLineCloseButtonVisible guifg=#c6c0a9 guibg=#21272c
highlight! BufferLineCloseButtonSelected guifg=#c6c0a9 guibg=#21272c

highlight! BufferLineModified guifg=#a7c080 guibg=#2D353B
highlight! BufferLineModifiedSelected guifg=#a7c080 guibg=#21272c

highlight! BufferLineIndicatorSelected guifg=#a7c080 guibg=#21272c
highlight! BufferLineIndicatorVisible guifg=#21272c guibg=#21272c
]])

-- Set Dashboard colors
vim.cmd('highlight! DashboardHeader guifg=#96A97A')
vim.cmd('highlight! DashboardCenter guifg=#DBBC7F')
vim.cmd('highlight! DashboardShortcut guifg=#DB7A7C')
vim.cmd('highlight! DashboardFooter guifg=#96A97A')

-- Set Leap colors
vim.cmd('highlight! LeapMatch guifg=#d3c6aa guibg=#D699B6 gui=bold')
vim.cmd('highlight! LeapLabelPrimary guifg=#A7C07F gui=bold')
vim.cmd('highlight! LeapLabelSecondary guifg=#D699B6 gui=bold')
vim.cmd('highlight! LeapBackdrop guifg=#859290')

-- Set Neo-tree colors
vim.cmd([[
highlight! BufferLineWarning guifg=#DBBC7F
highlight! NeoTreeGitConflict guifg=#7FBBB3 
highlight! NeoTreeGitUntracked guifg=#DBBC7F
highlight! NeoTreeGitTabInactive guibg=#191E22
highlight! NeoTreeGitDotfile guibg=#888888
highlight! NeoTreeGitUnstaged guifg=#7FBBB3
highlight! NeoTreeNormal guibg=#2D353B
highlight! NeoTreeEndOfBuffer guibg=#2D353B
highlight! NeoTreeRootName guifg=#C6C0A9 gui=italic,bold
highlight! NeoTreeTabActive guibg=#181c1e guifg=#C6C0A9
highlight! NeoTreeTabInactive guibg=#2D353B
highlight! NeoTreeTabSeparatorActive guifg=#2D353B guibg=#181c1e
highlight! NeoTreeTabSeparatorInactive guifg=#2D353B guibg=#2D353B
highlight! NeoTreeExpander guifg=gray
]])

-- Set TS-Rainbow2 colors
vim.cmd([[
highlight! TSRainbowRed guifg=#DB7A7C
highlight! TSRainbowOrange guifg=#E69875
highlight! TSRainbowYellow guifg=#DBBC7F
highlight! TSRainbowGreen guifg=#A7C07F
highlight! TSRainbowCyan guifg=#83C092
highlight! TSRainbowBlue guifg=#7FBBB3
highlight! TSRainbowViolet guifg=#D699B6
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

-- Set Diagnostic Virtual Text colors
vim.cmd([[
highlight! DiagnosticVirtualTextError guifg=#DB7A7C guibg=#4a3e3e
highlight! DiagnosticVirtualTextWarn guifg=#DBBC7F guibg=#4d483d
highlight! DiagnosticVirtualTextInfo guifg=#7FBBB3 guibg=#354846
highlight! DiagnosticVirtualTextHint guifg=#96A97A guibg=#353f2c
]])

-- Set Modicator colors
vim.cmd([[
highlight! CursorLineNr guifg=#a7c080 gui=bold
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

-- Set Nvim-CMP colors
vim.api.nvim_set_hl(0, "Pmenu", {fg="#C5CDD9", bg="#424e53"})

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {fg="#7E8294"})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {fg="#7FBBB3"})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {fg="#7FBBB3"})
vim.api.nvim_set_hl(0, "CmpItemMenu", {fg="#7a8478"})

vim.api.nvim_set_hl(0, "CmpItemKindConstant", {fg="#dfeeec", bg="#7FBBB3"})
vim.api.nvim_set_hl(0, "CmpItemKindField", {fg="#dfeeec", bg="#7FBBB3"})
vim.api.nvim_set_hl(0, "CmpItemKindProperty", {fg="#dfeeec", bg="#7FBBB3"})
vim.api.nvim_set_hl(0, "CmpItemKindEvent", {fg="#dfeeec", bg="#7FBBB3"})
vim.api.nvim_set_hl(0, "CmpItemKindReference", {fg="#dfeeec", bg="#7FBBB3"})

vim.api.nvim_set_hl(0, "CmpItemKindKeyword", {fg="#EED8DA", bg="#E67E80"})

vim.api.nvim_set_hl(0, "CmpItemKindText", {fg="#e5ddcc", bg="#d3c6aa"})
vim.api.nvim_set_hl(0, "CmpItemKindEnum", {fg="#e5ddcc", bg="#d3c6aa"})

vim.api.nvim_set_hl(0, "CmpItemKindModule", {fg="#EADFF0", bg="#D699B6"})

vim.api.nvim_set_hl(0, "CmpItemKindClass", {fg="#FFe082", bg="#DBBC7F"})

vim.api.nvim_set_hl(0, "CmpItemKindConstructor", {fg="#C3E88D", bg="#A7C080"})
vim.api.nvim_set_hl(0, "CmpItemKindFunction", {fg="#C3E88D", bg="#A7C080"})
vim.api.nvim_set_hl(0, "CmpItemKindMethod", {fg="#C3E88D", bg="#A7C080"})
vim.api.nvim_set_hl(0, "CmpItemKindStruct", {fg="#C3E88D", bg="#A7C080"})
vim.api.nvim_set_hl(0, "CmpItemKindOperator", {fg="#C3E88D", bg="#A7C080"})

vim.api.nvim_set_hl(0, "CmpItemKindVariable", {fg="#C5CDD9", bg="#3A515D"})
vim.api.nvim_set_hl(0, "CmpItemKindFile", {fg="#C5CDD9", bg="#3A515D"})

vim.api.nvim_set_hl(0, "CmpItemKindUnit", {fg="#F5EBD9", bg="#e69875"})
vim.api.nvim_set_hl(0, "CmpItemKindFolder", {fg="#F5EBD9", bg="#e69875"})

vim.api.nvim_set_hl(0, "CmpItemKindValue", {fg="#DDE5f5", bg="#6C8ED4"})
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", {fg="#DDE5f5", bg="#6C8ED4"})

vim.api.nvim_set_hl(0, "CmpItemKindInterface", {fg="#D8EEEB", bg="#62b8ad"})
vim.api.nvim_set_hl(0, "CmpItemKindColor", {fg="#D8EEEB", bg="#62b8ad"})
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", {fg="#D8EEEB", bg="#62b8ad"})
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", {fg="#D8EEEB", bg="#62b8ad"})
