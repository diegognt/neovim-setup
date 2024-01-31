local icons = require "diegognt.icons"

local Spec = {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  event = "BufRead",
  opts = {
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = "契",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = icons.ui.BoldDividerRight,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    watch_gitdir = {
      interval = 1000,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%d-%m-%Y> - <summary>",
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      col = 2,
    },
  },
}

Spec.on_attach = function(bufnr)
  Spec.set_keymaps(bufnr)
end

Spec.set_keymaps = function(bufnr)
  local opts = { buffer = bufnr, silent = true, noremap = true }
  local keymap = vim.keymap.set
  local gs = package.loaded.gitsigns

  keymap("n", "]c", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, vim.tbl_deep_extend("force", opts, { desc = "Next Git Hunk", expr = true }))

  keymap("n", "[c", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, vim.tbl_deep_extend("force", opts, { desc = "Previous Git Hunk", expr = true }))

  keymap("n", "gs", function()
    gs.toggle_signs()
  end, vim.tbl_deep_extend("force", opts, { desc = "Toggle Git Signs" }))

  keymap("n", "gp", function()
    gs.preview_hunk()
  end, vim.tbl_deep_extend("force", opts, { desc = "Preview Git Hunk" }))

  keymap("n", "gl", function()
    gs.toggle_current_line_blame()
  end, vim.tbl_deep_extend("force", opts, { desc = "Toggle Git Blame" }))

  keymap("n", "gf", function()
    gs.setloclist()
  end, vim.tbl_deep_extend("force", opts, { desc = "All Diff" }))
end

function Spec.config(_, opts)
  require("gitsigns").setup(vim.tbl_deep_extend("force", opts, { on_attach = Spec.on_attach }))
end

return Spec
