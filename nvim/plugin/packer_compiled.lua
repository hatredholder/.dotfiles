-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hatredholder/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hatredholder/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hatredholder/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hatredholder/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hatredholder/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["baleia.nvim"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/baleia.nvim",
    url = "https://github.com/m00qek/baleia.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('bufferline-config')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cellular-automaton.nvim"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/cellular-automaton.nvim",
    url = "https://github.com/Eandrju/cellular-automaton.nvim"
  },
  ["chafa.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vevents\1\0\1\26update_on_nvim_resize\2\vrender\1\0\0\1\0\2\15show_label\2\16min_padding\3\5\nsetup\nchafa\frequire\0" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/chafa.nvim",
    url = "https://github.com/princejoogie/chafa.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["dashboard-nvim"] = {
    config = { "require('dashboard-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n{\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vselect\1\0\0\fbackend\1\0\0\1\5\0\0\ffzf_lua\bfzf\fbuiltin\bnui\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["drop.nvim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\bmax\3\25\ntheme\vleaves\16screensaver\1\nsetup\tdrop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/drop.nvim",
    url = "https://github.com/folke/drop.nvim"
  },
  everforest = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nf\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0 scrollbar.handlers.gitsigns\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "require('impatient')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('blankline-config')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    config = { "require('leap').add_default_mappings()" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "require('lspsaga-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/kkharji/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('lualine-config')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17mason-config\frequire\0" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.animate"] = {
    config = { "\27LJ\2\n[\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vscroll\1\0\0\1\0\1\venable\1\nsetup\17mini.animate\frequire\0" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/mini.animate",
    url = "https://github.com/echasnovski/mini.animate"
  },
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    config = { "require('neotree-config')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neovim-session-manager"] = {
    config = { "require('session-manager-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["noice.nvim"] = {
    config = { "require('noice-config')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "require('null-ls-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('autopairs-config')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    config = { "require('lsp')" },
    loaded = true,
    only_config = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require'colorizer'.setup()" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    commands = { "CommentToggle" },
    config = { "require('nvim_comment').setup({comment_empty=false})" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-dap"] = {
    config = { "require('dap-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "require('notify-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "require('scrollbar-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-autotag", "cellular-automaton.nvim" },
    config = { "require('treesitter-config')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    config = { "require('nvim-web-devicons-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "require('presence-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["smart-splits.nvim"] = {
    config = { "require('smartsplits-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('telescope-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\18sign_priority\3\6\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require('toggleterm-config')" },
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bbye"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["which-key.nvim"] = {
    config = { "require('which-key-config')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hatredholder/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require('dap-config')
time([[Config for nvim-dap]], false)
-- Config for: chafa.nvim
time([[Config for chafa.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vevents\1\0\1\26update_on_nvim_resize\2\vrender\1\0\0\1\0\2\15show_label\2\16min_padding\3\5\nsetup\nchafa\frequire\0", "config", "chafa.nvim")
time([[Config for chafa.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
require('impatient')
time([[Config for impatient.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('telescope-config')
time([[Config for telescope.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\18sign_priority\3\6\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
require('leap').add_default_mappings()
time([[Config for leap.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('toggleterm-config')
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
require('scrollbar-config')
time([[Config for nvim-scrollbar]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require('null-ls-config')
time([[Config for null-ls.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require('dashboard-config')
time([[Config for dashboard-nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require('lspsaga-config')
time([[Config for lspsaga.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n{\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vselect\1\0\0\fbackend\1\0\0\1\5\0\0\ffzf_lua\bfzf\fbuiltin\bnui\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
require('session-manager-config')
time([[Config for neovim-session-manager]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require('nvim-web-devicons-config')
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('lsp')
time([[Config for nvim-cmp]], false)
-- Config for: mini.animate
time([[Config for mini.animate]], true)
try_loadstring("\27LJ\2\n[\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vscroll\1\0\0\1\0\1\venable\1\nsetup\17mini.animate\frequire\0", "config", "mini.animate")
time([[Config for mini.animate]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require'colorizer'.setup()
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require('notify-config')
time([[Config for nvim-notify]], false)
-- Config for: smart-splits.nvim
time([[Config for smart-splits.nvim]], true)
require('smartsplits-config')
time([[Config for smart-splits.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17mason-config\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0 scrollbar.handlers.gitsigns\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
require('presence-config')
time([[Config for presence.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
require('autopairs-config')

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Neotree', function(cmdargs)
          require('packer.load')({'neo-tree.nvim'}, { cmd = 'Neotree', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neo-tree.nvim'}, { cmd = 'Neotree' }, _G.packer_plugins)
          return vim.fn.getcompletion('Neotree ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CommentToggle', function(cmdargs)
          require('packer.load')({'nvim-comment'}, { cmd = 'CommentToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-comment'}, { cmd = 'CommentToggle' }, _G.packer_plugins)
          return vim.fn.getcompletion('CommentToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'drop.nvim', 'noice.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'lualine.nvim', 'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'bufferline.nvim', 'nvim-treesitter', 'vim-bbye', 'which-key.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
