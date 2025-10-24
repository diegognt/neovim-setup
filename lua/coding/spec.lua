local lsp_servers = require "globals.lsp"

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
        keys = {
          { "<leader>M", "<cmd>Mason<CR>", desc = "Open [M]ason" },
        },
      },
      "neovim/nvim-lspconfig",
    },
    opts = { ensure_installed = lsp_servers },
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
