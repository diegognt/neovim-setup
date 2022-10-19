local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  vim.notify('The `jose-elias-alvarez/null-ls.nvim` plugin was not found.')
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- NOTE: when using a node based tools used the `dynamic_command`.

null_ls.setup({
  debug = false,
  sources = {
    diagnostics.eslint.with({
      dynamic_command = require('null-ls.helpers.command_resolver').from_node_modules,
      filetypes = { 'javascript', 'typescript' },
    }),
    formatting.prettier.with({
      dynamic_command = require('null-ls.helpers.command_resolver').from_node_modules,
      filetypes = { 'javascript', 'typescript', 'css', 'scss', 'astro', 'html', 'json', 'yaml', 'markdown' },
    }),
    formatting.stylelint.with({
      dynamic_command = require('null-ls.helpers.command_resolver').from_node_modules,
    }),
    diagnostics.stylelint.with({
      dynamic_command = require('null-ls.helpers.command_resolver').from_node_modules,
    }),
    formatting.stylua,
    diagnostics.pylint,
    -- diagnostics.vale,
    formatting.black,
  },
})
