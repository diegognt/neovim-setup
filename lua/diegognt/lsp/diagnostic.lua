local icons = require "diegognt.icons"
local Spec = {
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
    signs = {
      error = icons.diagnostics.BoldError,
      warning = icons.diagnostics.BoldWarning,
      hint = icons.diagnostics.BoldHint,
      information = icons.diagnostics.BoldInformation,
      other = icons.diagnostics.BoldQuestion,
    },
  },
}

function Spec.config(_, opts)
  require("trouble").setup(opts)

  require("which-key").register {
    ["<leader>xd"] = { "<cmd>Trouble document_diagnostics<CR>", "Document" },
    ["<leader>xw"] = { "<cmd>Trouble workspace_diagnostics<CR>", "Workspace" },
    ["<leader>xl"] = { "<cmd>Trouble loclist<CR>", "Loclist" },
    ["<leader>xt"] = { "<cmd>TodoTrouble<CR>", "TODOs" },
    ["<leader>xq"] = { "<cmd>Trouble quickfix<CR>", "Quickfix" },
  }
end

return Spec
