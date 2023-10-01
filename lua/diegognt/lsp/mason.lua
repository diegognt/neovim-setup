local lsp_zero_status, lsp_zero = pcall(require, 'lsp-zero')
if not lsp_zero_status then
  vim.notify('The `VonHeikemen/lsp-zero.nvim` plugin was not found.')
  return
end

local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  vim.notify('The `nvim/lspconfig` plugin was not found.')
  return
end

local servers = {
  'astro',
  'bashls',
  'cssls',
  'denols',
  'dockerls',
  'eslint',
  'gopls',
  'html',
  'jsonls',
  'lua_ls',
  'marksman',
  'pylsp',
  'taplo',
  'tailwindcss',
  'tsserver',
  'stylelint_lsp',
  'yamlls',
}

return {
  ensure_installed = servers,
  handlers = {
    lsp_zero.default_setup,
    cssls = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
    end,
    html = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.html.setup({
        capabilities = capabilities,
      })
    end,
    jsonls = function()
      local opts = require('diegognt.lsp.settings.jsonls')
      lspconfig.jsonls.setup(opts)
    end,
    lua_ls = function()
      local opts = require('diegognt.lsp.settings.lua_ls')
      lspconfig.lua_ls.setup(opts)
    end,
    eslint = function()
      local opts = require('diegognt.lsp.settings.eslint')
      lspconfig.eslint.setup(opts)
    end,
    tsserver = function()
      local opts = require('diegognt.lsp.settings.tsserver')
      lspconfig.tsserver.setup(opts)
    end,
    denols = function()
      local opts = require('diegognt.lsp.settings.denols')
      lspconfig.denols.setup(opts)
    end,
    stylelint_lsp = function()
      local opts = require('diegognt.lsp.settings.stylelint_lsp')
      lspconfig.stylelint_lsp.setup(opts)
    end,
    tailwindcss = function()
      lspconfig.tailwindcss.setup({
        root_dir = lspconfig.util.root_pattern({ 'tailwind.config.js', 'twind.config.ts', 'tailwind.config.cjs' }),
      })
    end,
  },
}
