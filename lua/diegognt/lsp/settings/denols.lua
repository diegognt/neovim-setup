local lspconfig_status, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_status then
  vim.notify('The `nvim/lspconfig` plugin was not found.')
  return
end

return {
  root_dir = lspconfig.util.root_pattern('deno.json'),
  settings = {
    deno = {
      enable = true,
      lint = true,
    },
  },
}
