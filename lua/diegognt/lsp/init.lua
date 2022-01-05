local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
	return
end

require('diegognt.lsp.lsp-installer')
require('diegognt.lsp.handlers').setup()
