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
        text = icons.ui.BoldLineLeft,
      },
      change = {
        text = icons.ui.BoldLineLeft,
      },
      delete = {
        text = "契",
      },
      topdelete = {
        text = icons.ui.BoldDividerRight,
      },
      changedelete = {
        text = icons.ui.BoldLineLeft,
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

local set_keymaps = function(bufnr)
  local opts = { buffer = bufnr, silent = true, noremap = true }
  local keymap = vim.keymap.set
  local gs = package.loaded.gitsigns

  keymap("n", "]h", function()
    if vim.wo.diff then
      return "]h"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, vim.tbl_deep_extend("force", opts, { desc = "Next git [h]unk", expr = true }))

  keymap("n", "[h", function()
    if vim.wo.diff then
      return "[h"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, vim.tbl_deep_extend("force", opts, { desc = "Previous git [h]unk", expr = true }))

  keymap("n", "gs", function()
    gs.toggle_signs()
  end, vim.tbl_deep_extend("force", opts, { desc = "Toggle [g]it [s]igns" }))

  keymap("n", "gl", function()
    gs.toggle_current_line_blame()
  end, vim.tbl_deep_extend("force", opts, { desc = "Toggle [g]it [b]lame" }))

  keymap("n", "gf", function()
    gs.setloclist()
  end, vim.tbl_deep_extend("force", opts, { desc = "All [g]it di[f]f" }))
end

local on_attach = function(bufnr)
  set_keymaps(bufnr)
end

function Spec.config(_, opts)
  require("gitsigns").setup(vim.tbl_deep_extend("force", opts, { on_attach = on_attach }))
end

return Spec
