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

local function set_keymaps()
  local opts = { silent = true, noremap = true }
  local keymap = vim.keymap.set

  keymap(
    "n",
    "<leader>xd",
    "<cmd>Trouble document_diagnostics<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "Document" })
  )
  keymap(
    "n",
    "<leader>xw",
    "<cmd>Trouble workspace_diagnostics<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "Workspace" })
  )
  keymap("n", "<leader>xl", "<cmd>Trouble loclist<CR>", vim.tbl_deep_extend("force", opts, { desc = "Loclist" }))
  keymap("n", "<leader>xt", "<cmd>TodoTrouble<CR>", vim.tbl_deep_extend("force", opts, { desc = "TODOs" }))
  keymap("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", vim.tbl_deep_extend("force", opts, { desc = "Quickfix" }))
end

function Spec.config(_, opts)
  require("trouble").setup(opts)

  set_keymaps()
end

return Spec
