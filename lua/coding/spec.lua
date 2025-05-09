local icons = require "globals.icons"

local setup_diagnostic = function()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.BoldError,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.BoldWarning,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.BoldHint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.BoldInformation,
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
    virtual_lines = {
      -- Only show virtual line diagnostics for the current cursor line
      current_line = true,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      header = "Diagnostic",
      prefix = "",
    },
  })
end

local config = function()
  setup_diagnostic()
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
  config = config,
}
