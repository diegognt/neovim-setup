local status_ok, _ = pcall(require, 'dap')
if not status_ok then
  vim.notify('The `` plugin was not found.')
  return
end

require('diegognt.dap.ui')
require('diegognt.dap.adapters.go')
