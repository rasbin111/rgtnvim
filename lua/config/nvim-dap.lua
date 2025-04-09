local dap = require('dap')

dap.adapters.python = {
    type = 'executable',
    -- command = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python',
    command = vim.fn.getcwd() .. '/.venv/bin/python', -- Use your venv's Python

    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',    -- Run the current file
        pythonPath = function()
            return vim.fn.exepath('python3')  -- Adjust if needed
        end,
    },
}

-- Django 
table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py',  -- Adjust path if needed
  args = {'runserver'},
})


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>o', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)

local dapui = require("dapui")
dapui.setup()

vim.keymap.set('n', '<Leader>du', dapui.toggle)

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end



