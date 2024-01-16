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

function Spec.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

Spec.diagnostics_setup = function()
  local diagnos1ics_opts = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning},
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

Spec.common_handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}


Spec.set_keymaps = function()
  require("which-key").register {
    ["<leader>li"] = { "<cmd>LspInfo<CR>", "Info" },
  }
end

Spec.setup_servers = function()
  local lspconfig = require "lspconfig"
  local servers = require "diegognt.lsp.servers"

  for _, server in pairs(servers) do
    local opts = {
      capabilities = Spec.common_capabilities(),
      handlers = Spec.common_handlers,
    }

    local require_ok, settings = pcall(require, "diegognt.lsp.settings." .. server)

    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)
  end
end

function Spec.config()
  require("lspconfig.ui.windows").default_options.border = "rounded"

  Spec.diagnostics_setup()
  Spec.set_keymaps()
  Spec.setup_servers()
end

return Spec
