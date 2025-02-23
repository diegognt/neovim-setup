return function()
  -- local client = vim.lsp.get_client_by_id(event.data.client_id)
  local keymap = require("globals").keymaps.set

  -- CodeLens
  -- if client and client.supports_method("textDocument/codeLens", event.buf) then
  --   vim.lsp.codelens.refresh({ bufnr = event.buf})
  --
  --   keymap("n", "<leader>ll", function()
  --     vim.lsp.codelens.refresh({ bufnr = event.buf })
  --   end, { desc = "Disp[l]ay Code [l]ens" })
  --
  --   keymap("n", "<leader>lc", vim.lsp.codelens.run,  { desc = "Run Code Lens" })
  -- end

  -- Inlay Hints
  -- if client and client.supports_method("textDocument/inlayHint", event.buf) then
  --   keymap("n", "<leader>lh", function()
  --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  --   end, { desc = "Inlay Hints" })
  -- end

  -- LSP default
  keymap("n", "gd", vim.lsp.buf.definition,  { desc = "Go to Definition" })
  keymap("n", "gD", vim.lsp.buf.declaration,  { desc = "Go to Declaration" })
  keymap("n", "K", vim.lsp.buf.hover,  { desc = "Hover" })
  keymap("n", "gi", vim.lsp.buf.implementation,  { desc = "Go to Implementation" })
  keymap("n", "gr", vim.lsp.buf.references,  { desc = "Go to References" })
  keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
  keymap("v", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
  keymap("n", "<leader>lr", vim.lsp.buf.rename,  { desc = "Rename" })
  keymap("n", "<leader>lk", vim.lsp.buf.signature_help, { desc = "Signature Help" })
  keymap("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "Type Definition" })
  keymap("n", "<leader>lf", function()
    vim.lsp.buf.format({
      async = true,
      filter = function(client)
        return client.name ~= "typescript-tools"
      end,
    })
  end,  { desc = "Format" })

  -- Float Diagnostics
  keymap("n", "<leader>xf", vim.diagnostic.open_float, { desc = "Open Diagnostics on Float" })

  -- LSP Info
  keymap("n", "<leader>lI", "<cmd>LspInfo<CR>",  { desc = "LSP Info" })

  -- LSP Document Symbols
  keymap("n", "<leader>ds", function()
    vim.lsp.buf.document_symbol({ loclist = true })
  end,  { desc = "[d]ocument [s]ymbols" })
end
