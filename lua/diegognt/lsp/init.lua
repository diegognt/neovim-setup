local lsp_zero_status, lsp_zero = pcall(require, 'lsp-zero')
if not lsp_zero_status then
  vim.notify('The `VonHeikemen/lsp-zero.nvim` plugin was not found.')
  return
end

lsp_zero.on_attach(function()
  lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = '',
})
