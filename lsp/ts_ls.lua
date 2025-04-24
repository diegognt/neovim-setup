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

local on_attach = function()
  local keymap = require("globals").keymaps.set

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
  end, { desc = "Organize TS Imports" })

  keymap("n", "<leader>lf", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.fixAll.tslint" },
        diagnostics = {},
      },
    })
  end, { desc = "Fix TS Problems" })

  keymap("n", "<leader>lu", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.removeUnused.ts" },
        diagnostics = {},
      },
    })
  end, { desc = "Remove Unused Variables" })
end

---@type vim.lsp.Config
return {
  init_options = { hostInfo = "neovim" },
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  on_attach = on_attach,
  settings = {
    javascript = common_settings,
    typescript = common_settings,
    javascriptreact = common_settings,
    typescriptreact = common_settings,
    ["javascript.jsx"] = common_settings,
    ["typescript.tsx"] = common_settings,
  },
}
