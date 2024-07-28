local Spec = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ensure_installed = require("diegognt.globals").mason.lsp,
  },
}

function Spec.config(_, opts)
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  require("mason-lspconfig").setup(opts)
end

return Spec
