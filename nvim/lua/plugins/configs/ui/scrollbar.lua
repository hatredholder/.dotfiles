require('scrollbar').setup({
  handle = {
    color = "#48565d",
  },
  marks = {
    Search = { color = "#2d353b"},
    Error = { color = "#e67e80"},
    Warn = { color = "#dbbc7f"},
    Info = { color = "#7fbbb3"},
    Hint = { color = "#a7c080"},
    Misc = { color = "#859289"},

    GitAdd = { color = "#a7c080"},
    GitChange = { color = "#7fbbb3"},
    GitDelete = { color = "#e67e80"},
  },
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
