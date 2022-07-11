local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
  vim.notify('The `williamboman/nvim-lsp-installer` plugin was not found.')
	return
end

local servers = {
  'sumneko_lua',
  'cssls',
  'html',
  'tsserver',
  'pyright',
  'bashls',
  'jsonls',
  'yamlls',
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local opts = {}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
for _, server in pairs(servers) do
	opts = {
		on_attach = require('diegognt.lsp.handlers').on_attach,
		capabilities = require('diegognt.lsp.handlers').capabilities,
	}

	if server == 'jsonls' then
    local jsonls_opts = require 'diegognt.lsp.settings.jsonls'
    opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
	end

  if server == 'pyright' then
    local pyright_opts = require 'diegognt.lsp.settings.pyright'
    opts = vim.tbl_deep_extend('force', pyright_opts, opts)
  end

	if server == 'sumneko_lua' then
    local sumneko_opts = require 'diegognt.lsp.settings.sumneko_lua'
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
	end

  lspconfig[server].setup(opts)
end
