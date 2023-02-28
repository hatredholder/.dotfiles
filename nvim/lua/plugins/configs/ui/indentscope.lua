require("mini.indentscope").setup({
  symbol = "│",
  options = { try_as_border = true },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"packer", 'neo-tree', "dashboard", "TelescopePrompt", "DiffviewFilePanel", "diff", "undotree"},
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
