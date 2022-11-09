local wk = require('which-key')

local Terminal = require('toggleterm.terminal').Terminal

local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end

local mappings = {

  f = {"<cmd>Telescope live_grep<CR>", "Live Grep (Global Search)"},
  r = {"<cmd>Telescope find_files<CR>", "Find Files"},

  d = {
    name = "Dashboard",
    r = {"<cmd>Telescope find_files<CR>", "Find Files"},
    f = {"<cmd>Telescope live_grep<CR>", "Live Grep"},
    l = {"<cmd>Telescope oldfiles<CR>", "Old Files"},
    s = {"<cmd>SessionManager! load_last_session<CR>", "Load Session"},
    c = {"<cmd>edit ~/.config/nvim/init.lua<CR>", "Open Config"},
    q = {"<cmd>quitall<CR>", "Quit Neovim"},
  },

  t = {
    name = "Terminal",
    f = {toggle_float, "Floating Terminal"},
    g = {toggle_lazygit, "Lazygit Terminal"}
  },

  m = {
    name = "Minimap",
    m = {function()require('codewindow').toggle_minimap() end, "Toggle Minimap"},
  },

  l = {
    name = "LSP",
    i = {"<cmd>LspInfo<cr>", "Connected Language Servers"},

    h = {'<cmd>lua vim.lsp.buf.hover()<CR>', "Hover"},

    d = {'<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition"},
    r = {'<cmd>lua vim.lsp.buf.references()<CR>', "References"},

    p = {'<cmd>Telescope diagnostics bufnr=0<CR>', "Get Diagnostics"},
    s = {'<cmd>Lspsaga show_line_diagnostics<CR>', "Show line diagnostics"},
    n = {'<cmd>lua vim.diagnostic.goto_next()<CR>', "Go to next diagnostic"},
    N = {'<cmd>lua vim.diagnostic.goto_prev()<CR>', "Go to previous diagnostic"},

    f = {'<cmd>!black %<CR>', "Format Python File"},
  },

  y = {
    name = "Debug",
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },

    t = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    y = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },

    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    q = { "<cmd>lua require'dap'.terminate()<cr>", "Quit" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },

    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    s = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  },

  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  },

  h = {
    name = "Diffview",
    h = { "<cmd>DiffviewOpen<CR>", "Open Diffview"},
    c = { "<cmd>DiffviewClose<CR>", "Close Diffview"},
  }
}

local opts = {prefix = "<leader>"}
wk.register(mappings, opts)
