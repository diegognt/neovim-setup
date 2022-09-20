local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify('The `neovim/nvim-lspconfig` plugin was not found.')
  return
end

require('diegognt.lsp.lsp-installer')
require('diegognt.lsp.handlers').setup()
require('diegognt.lsp.null-ls')
