local Spec = {
  "uga-rosa/ccc.nvim",
  event = "BufRead",
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
}

return Spec
