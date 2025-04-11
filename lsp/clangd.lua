---@type vim.lsp.Config
return {
  single_file_support = true,
  settings = {
    clangd = {
      fileStatus = true,
      semanticHighlighting = true,
      showTodos = true,
    },
  },
}
