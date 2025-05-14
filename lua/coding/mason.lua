local lsp_servers = require "globals.lsp"

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
      },
    },
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = lsp_servers,
    automatic_enable = true,
  },
  keys = {
    { "<leader>M", "<cmd>Mason<CR>", desc = "Open [M]ason" },
  },
}
