return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
      },
    },
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ensure_installed = require "globals.lsp",
  },
  keys = {
    { "<leader>M", "<cmd>Mason<CR>", desc = "Open [M]ason" },
  },
}
