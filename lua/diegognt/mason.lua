local Spec = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function Spec.config()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = require "diegognt.lsp.servers",
  })
end

return Spec
