---@type vim.lsp.Config
return {
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac", -- AutoTools
  },
  settings = {
    clangd = {
      fileStatus = true,
      semanticHighlighting = true,
      showTodos = true,
    },
  },
}
