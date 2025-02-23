local icons = require "globals.icons"

local setup_servers = function()
  local lspconfig = require "lspconfig"
  local servers = require "globals.lsp"

  for _, server in pairs(servers) do
    local require_ok, settings = pcall(require, "lsp.settings." .. server)
    local opts = {
      on_attach = function(_, bufnr)
        if settings.on_attach then
          settings.on_attach(_, bufnr)
        end
      end,
      capabilities = require('blink.cmp').get_lsp_capabilities(settings.capabilities)
    }

    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)
  end
end

local setup_diagnostic = function ()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.BoldError,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.BoldWarning,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.BoldHint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.BoldInformation
      },
      linehl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      header = "",
      prefix = "",
    },
  })
end

local config = function()
  require("lspconfig.ui.windows").default_options.border = "rounded"

  setup_diagnostic()
  setup_servers()
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "b0o/schemastore.nvim",
      lazy = true,
    },
    { "saghen/blink.cmp" },
  },
  config = config
}
