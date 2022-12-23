require('scrollbar').setup({
  handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
    },
  excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
        "neo-tree",
        "dashboard",
    },
})

vim.cmd([[
highlight! ScrollbarHandle guibg=#48565d
highlight! ScrollbarErrorHandle guifg=#859289 guibg=#48565d
highlight! ScrollbarHintHandle guifg=#859289 guibg=#48565d
highlight! ScrollbarGitChangeHandle guifg=#7fbbb3 guibg=#48565d
highlight! ScrollbarWarnHandle guifg=#859289 guibg=#48565d
highlight! ScrollbarGitAddHandle guifg=#a7c080 guibg=#48565d
highlight! ScrollbarGitDeleteHandle guifg=#e67e80 guibg=#48565d
highlight! ScrollbarMiscHandle guifg=#d3c6aa guibg=#48565d
highlight! ScrollbarSearchHandle guifg=#2d353b guibg=#48565d
highlight! ScrollbarCursorHandle guifg=#d3c6aa guibg=#48565d
highlight! ScrollbarInfoHandle guifg=#859289 guibg=#48565d
]])

