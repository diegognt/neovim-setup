local Spec = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { -- Elegant diagnostic tools for lsp_keymaps
      "folke/trouble.nvim",
      cmd = { "Trouble" },
      opts = { use_diagnostic_signs = true },
    },
    {
      "b0o/schemastore.nvim",
      lazy = true,
    },
  },
}

local function lsp_keymaps(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

function Spec.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

Spec.on_attach = function(client, bufnr)
  lsp_keymaps(client, bufnr)

  -- if client.supports_method "textDocument/inlayHint" then
  --   vim.lsp.inlay_hint.enable(bufnr)
  -- end
end

-- Spec.toggle_inlay_hints = function ()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
-- end

function Spec.config()
  local lspconfig = require "lspconfig"
  local icons = require "diegognt.icons"
  local servers = require "diegognt.lsp.servers"
  local whichkey = require "which-key"
  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
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

  whichkey.register({
    ["<leader>li"] = { "<cmd>LspInfo<CR>", "Info" },
    ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    ["<leader>lf"] = {
      "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
      "Format",
    },
    ["<leader>ll"] = {
      "<cmd>lua vim.lsp.codelens.run()<CR>",
      "CodeLens Action",
    },
    ["<leader>lk"] = {
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      "Symbol Signature",
    },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<leader>ls"] = {
      "<cmd>Telescope lsp_document_symbols<CR>",
      "Document Symbols",
    },
    ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quick fix" },
    -- ["<leader>lh"] = { "<cmd>lua require('diegognt.lsp').toggle_inlay_hints()<CR>", "Hints" },
  })

  require("lspconfig.ui.windows").default_options.border = "rounded"

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in
    ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {})
  do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = sign.name }
    )
  end

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  for _, server in pairs(servers) do
    local opts = {
      on_attach = Spec.on_attach,
      capabilities = Spec.common_capabilities(),
    }

    local require_ok, settings =
      pcall(require, "diegognt.lsp.settings." .. server)

    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)
  end
end

return Spec
