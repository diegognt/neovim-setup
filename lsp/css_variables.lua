---@type vim.lsp.Config
return {
  cmd = { "css-variables-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json" },
}
