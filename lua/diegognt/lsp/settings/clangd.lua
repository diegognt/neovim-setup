local lspconfig = require "lspconfig"

return {
  settings = {
    clangd = {
      fileStatus = true,
      semanticHighlighting = true,
      showTodos = true,
    },
  },
}
