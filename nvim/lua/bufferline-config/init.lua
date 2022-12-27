vim.cmd([[
highlight! BufferLineWarning guifg=#859289 guibg=#21272c guisp=#dbbc7f

highlight! BufferLineHintDiagnosticVisible guifg=#A7C07F
highlight! BufferLineHintDiagnosticSelected guifg=#A7C07F gui=italic,bold
highlight! BufferLineHintSelected guifg=#A7C07F  gui=italic,bold

highlight! BufferLineInfoSelected guifg=#7fbbb3 gui=italic,bold
highlight! BufferLineInfoDiagnosticSelected guifg=#7fbbb3 gui=italic,bold
]])
require("bufferline").setup{
  options = {
    offsets = {
      { filetype = "neo-tree", text="File Explorer", padding = 1},
    },
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict)
      local s = ""
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and ""
          or e == "warning" and ""
          or e == "info" and ""
          or ""
        s = s .. n .. sym
      end
      return s
    end

  }
}
