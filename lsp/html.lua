---@type vim.lsp.Config
return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ", "htmlangular" },
  root_markers = { "package.json" },
}
