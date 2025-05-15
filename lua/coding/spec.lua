local lsp_servers = require "globals.lsp"

-- return {
--   {
--     "mason-org/mason.nvim",
--   },
--   {
--     "mason-org/mason-lspconfig.nvim",
--     opts = {
--       ensure_installed = lsp_servers,
--     },
--   },
--   "neovim/nvim-lspconfig",
-- }
return {
  {
    "mason-org/mason.nvim",
    opts = {},
    keys = {
      { "<leader>M", "<cmd>Mason<CR>", desc = "Open [M]ason" },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = { ensure_installed = lsp_servers },
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
