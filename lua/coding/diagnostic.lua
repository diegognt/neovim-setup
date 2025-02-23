local icons = require "globals.icons"

return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
  },
  opts = {
    auto_close = true, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    focus = true,
    signs = {
      error = icons.diagnostics.BoldError,
      warning = icons.diagnostics.BoldWarning,
      hint = icons.diagnostics.BoldHint,
      information = icons.diagnostics.BoldInformation,
      other = icons.diagnostics.BoldQuestion,
    },
  },
  keys = {
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc="Buffer diagnostics"},
    { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Loclist" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "TODOs" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix" },
  },
}
