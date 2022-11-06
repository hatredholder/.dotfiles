local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/home/hatredholder/.local/share/nvim/mason/packages/debugpy/venv/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = dap.configurations.python or {}
    table.insert(dap.configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'Django',
    python = "/home/hatredholder/Programming/Python/Django/social_network/bin/python",
    program = vim.fn.getcwd() .. '/manage.py',  -- NOTE: Adapt path to manage.py as needed
    args = {'runserver', '--noreload'},
  })
require("nvim-dap-virtual-text").setup {
    commented = true,
}
require("dapui").setup({
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
})

local dapui = require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close()
end

