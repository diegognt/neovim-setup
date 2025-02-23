local globals = require "globals"
local icons = require "globals.icons"

local set_keymaps = function(bufnr)
  local keymap = globals.keymaps.set
  local gs = package.loaded.gitsigns

  -- Navigation
  keymap("n", "]h", function()
    if vim.wo.diff then
      vim.cmd.normal({"]h", bang = true})
    else
      gs.nav_hunk("next")
    end
  end, {desc="Next git [h]unk", buffer=bufnr})

  keymap("n", "[h", function()
    if vim.wo.diff then
      vim.cmd.normal({"[h", bang = true})
    else
      gs.nav_hunk("prev")
    end
  end, { desc="Previous git [h]unk", buffer=bufnr })

  -- Actions
  keymap('n', "gw", gs.preview_hunk, { desc = "[g]it hunk previe[w]", buffer=bufnr })
  keymap("n", "gs", gs.toggle_signs, { desc = "Toggle [g]it [s]igns", buffer=bufnr })
  keymap("n", "gb", gs.toggle_current_line_blame, { desc = "Toggle [g]it [b]lame", buffer=bufnr })
  keymap("n", "gf", gs.setloclist, { desc = "All [g]it di[f]f", buffer=bufnr })
end

return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  opts = {
    on_attach = set_keymaps,
    signs = {
      add = {
        text = icons.ui.BoldLineLeft,
      },
      change = {
        text = icons.ui.BoldLineLeft,
      },
      delete = {
        text = icons.ui.BoldLineLeft,
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
  config = true
}
