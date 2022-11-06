require("bufferline").setup{
  options = {
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 },
    },
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  }
}
