local dapui_status_ok, _ = pcall(require, 'dapui')
local virtualtext_status_ok, _ = pcall(require, 'nvim-dap-virtual-text')

if not dapui_status_ok then
  vim.notify('The `rcarriga/nvim-dap-ui` plugin was not found.')
  return
end

if not virtualtext_status_ok then
  vim.notify('The `theHamsta/nvim-dap-virtual-text` plugin was not found.')
  return
end

local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require('nvim-dap-virtual-text')

dapui.setup()
dap_virtual_text.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
  dap.repl.close()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
