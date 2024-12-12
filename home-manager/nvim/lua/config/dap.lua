local dap, dapui = require('dap'), require('dapui')

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-dap', -- adjust as needed, must be absolute path
  name = 'lldb'
}


dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

  },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.rust = { {

  name = 'Launch',
  type = 'lldb',
  request = 'launch',
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
  args = {},
} }


dap.configurations.c = dap.configurations.cpp
