local lspconfig_status, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_status then
  vim.notify('The `nvim/lspconfig` plugin was not found.')
  return
end

return {
  single_file_support = false,
  root_dir = lspconfig.util.root_pattern({ 'tsconfig.json' }),
  on_init = function(client)
    -- disable formatting capabilities
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
}
