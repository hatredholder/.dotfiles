require('scrollbar').setup({
  handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
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
]])

