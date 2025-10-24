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

---@type vim.lsp.Config
return {
  settings = {
    javascript = common_settings,
    typescript = common_settings,
    javascriptreact = common_settings,
    typescriptreact = common_settings,
    ["javascript.jsx"] = common_settings,
    ["typescript.tsx"] = common_settings,
  },
}
