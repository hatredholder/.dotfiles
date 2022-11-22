vim.cmd([[
highlight! BufferLineWarning guifg=#DBBC7F
highlight! BufferLineHintDiagnosticVisible guifg=#DBBC7F
highlight! BufferLineHintDiagnosticSelected guifg=#DBBC7F
highlight! BufferLineHintSelected guifg=#DBBC7F  gui=italic,bold
]])
require("bufferline").setup{
  options = {
    offsets = {
      { filetype = "neo-tree", text="File Explorer", padding = 1},
    },
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  }
}
