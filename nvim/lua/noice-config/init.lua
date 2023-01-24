-- Set colors
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { ctermbg=0, fg="#83C092"})
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupIconCmdline", { ctermbg=0, fg="#83C092"})
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { ctermbg=0, fg="#E69875"})
vim.api.nvim_set_hl(0, "NoiceCmdlineIconInput", { ctermbg=0, fg="#E69875"})

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    long_message_to_split = true,
  },
})

