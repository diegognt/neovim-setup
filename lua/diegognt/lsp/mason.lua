local mason_status, mason = pcall(require, 'mason')
if not mason_status then
  vim.notify('The `williamboman/mason` plugin was not found.')
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
  vim.notify('The `williamboman/mason-lspconfig` plugin was not found.')
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
  'cmake',
  'cssls',
  'clangd',
  'denols',
  'dockerls',
  'gopls',
  'html',
  'jsonls',
  'pylsp',
  'sumneko_lua',
  'yamlls',
}

-- Setup mason so it can manage external tooling
mason.setup()

-- Ensure the servers above are installed
mason_lspconfig.setup({
  ensure_installed = servers,
})

local opts = {}

mason_lspconfig.setup_handlers({
  function(server_name)
    opts = {
      on_attach = require('diegognt.lsp.handlers').on_attach,
      capabilities = require('diegognt.lsp.handlers').capabilities,
    }

    if server_name == 'jsonls' then
      local jsonls_opts = require('diegognt.lsp.settings.jsonls')
      opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
    end

    if server_name == 'sumneko_lua' then
      local sumneko_opts = require('diegognt.lsp.settings.sumneko_lua')
      opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    if server_name == 'denols' then
      local denols_opts = {
        root_dir = lspconfig.util.root_pattern('deno.json'),
        init_options = {
          lint = false,
        },
      }
      opts = vim.tbl_deep_extend('force', denols_opts, opts)
    end

    if server_name == 'tsserver' then
      local tsserver_opts = {
        root_dir = lspconfig.util.find_node_modules_ancestors,
        init_options = {
          lint = true,
        },
      }
      opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
    end

    lspconfig[server_name].setup(opts)
  end,
})
