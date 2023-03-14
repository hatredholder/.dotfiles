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
vim.api.nvim_set_hl(0, "BufferLineWarning", {fg="#859290", bg="#21272c"})

vim.cmd([[
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
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", {fg="#F5EBD9", bg="#e69875"})
vim.api.nvim_set_hl(0, "CmpItemKindFolder", {fg="#F5EBD9", bg="#e69875"})

vim.api.nvim_set_hl(0, "CmpItemKindValue", {fg="#DDE5f5", bg="#6C8ED4"})
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", {fg="#DDE5f5", bg="#6C8ED4"})

vim.api.nvim_set_hl(0, "CmpItemKindInterface", {fg="#D8EEEB", bg="#62b8ad"})
vim.api.nvim_set_hl(0, "CmpItemKindColor", {fg="#D8EEEB", bg="#62b8ad"})
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", {fg="#D8EEEB", bg="#62b8ad"})
