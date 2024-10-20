local icons = require "diegognt.icons"
local Spec = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "b0o/schemastore.nvim",
      lazy = true,
    },
  },
}

local common_capabilities = function()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }

  return capabilities
end

local diagnostics_setup = function()
  local diagnos1ics_opts = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.BoldHint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.BoldInformation },
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
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(diagnos1ics_opts)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end
end

local common_handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
  ["textDocument/definition"] = vim.lsp.with(vim.lsp.handlers["textDocument/definition"], { loclist = false }),
  ["textDocument/references"] = vim.lsp.with(vim.lsp.handlers["textDocument/references"], { loclist = true }),
  ["textDocument/implementation"] = vim.lsp.with(vim.lsp.handlers["textDocument/implementation"], { loclist = true }),
  ["textDocument/codeAction"] = vim.lsp.with(vim.lsp.handlers["textDocument/codeAction"], { loclist = true }),
}

local setup_servers = function()
  local lspconfig = require "lspconfig"
  local servers = require("diegognt.globals").mason.lsp

  for _, server in pairs(servers) do
    local require_ok, settings = pcall(require, "diegognt.lsp.settings." .. server)
    local opts = {
      on_attach = function(_, bufnr)
        if settings.on_attach then
          settings.on_attach(_, bufnr)
        end
      end,
      capabilities = common_capabilities(),
      handlers = common_handlers,
    }

    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)
  end
end

function Spec.config()
  require("lspconfig.ui.windows").default_options.border = "rounded"

  diagnostics_setup()
  setup_servers()
end

return Spec
