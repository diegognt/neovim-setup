-- Desc: Settings for tsserver

local lspconfig = require "lspconfig"
local common_settings = {
  implementationsCodeLens = {
    enabled = true,
  },
  referencesCodeLens = {
    enabled = true,
    showOnAllFunctions = true,
  },
  inlayHints = {
    includeInlayEnumMemberValueHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayParameterNameHints = "all",
    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayVariableTypeHints = true,
  },
}
local function on_attach(_, bufnr)
  local opts = { buffer = bufnr, silent = true, noremap = true }
  local keymap = vim.keymap.set

  -- LSP Code Actions
  keymap("n", "<leader>li", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = {
          "source.organizeImports.ts",
          "source.addMissingImports.ts",
          "source.removeUnusedImports.ts",
          "source.sortImports.ts",
        },
        diagnostics = {},
      },
    })
  end, vim.tbl_deep_extend("force", opts, { desc = "Organize TS Imports" }))

  keymap("n", "<leader>lf", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.fixAll.tslint" },
        diagnostics = {},
      },
    })
  end, vim.tbl_deep_extend("force", opts, { desc = "Fix TS Problems" }))

  keymap("n", "<leader>lu", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.removeUnused.ts" },
        diagnostics = {},
      },
    })
  end, vim.tbl_deep_extend("force", opts, { desc = "Remove Unused Variables" }))
end

return {
  on_attach = on_attach,
  single_file_support = false,
  root_dir = lspconfig.util.root_pattern({ "tsconfig.json", "package.json" }),
  settings = {
    javascript = common_settings,
    typescript = common_settings,
    javascriptreact = common_settings,
    typescriptreact = common_settings,
    ["javascript.jsx"] = common_settings,
    ["typescript.tsx"] = common_settings,
  },
}
