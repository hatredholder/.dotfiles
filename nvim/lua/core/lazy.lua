-- Set Mapleader to Space
-- (lazy.nvim requires it to be set before loading it)
vim.g.mapleader = " "

-- Bootstrap Lazy.nvim
-- (the plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Load Plugins with Lazy
-- (https://github.com/folke/lazy.nvim#-structuring-your-plugins)
require("lazy").setup("plugins")

-- Load Core Configurations
require("core.options")
require("core.hotkeys")
require("core.colors")
