local icons = require "diegognt.icons"
local Spec = {
  "lewis6991/gitsigns.nvim",
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
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
      relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    yadm = {
      enable = false,
    },
  },
}

Spec.set_keymaps = function()
  require("which-key").register({
    ["<leader>gj"] = {
      '<cmd>lua require "gitsigns".next_hunk()<CR>',
      "Next Hunk",
    },
    ["<leader>gk"] = {
      '<cmd>lua require "gitsigns".prev_hunk()<CR>',
      "Prev Hunk",
    },
    ["<leader>gl"] = { '<cmd>lua require "gitsigns".blame_line()<CR>', "Blame" },
    ["<leader>gp"] = {
      '<cmd>lua require "gitsigns".preview_hunk()<CR>',
      "Preview Hunk",
    },
    ["<leader>gr"] = {
      '<cmd>lua require "gitsigns".reset_hunk()<CR>',
      "Reset Hunk",
    },
    ["<leader>gR"] = {
      '<cmd>lua require "gitsigns".reset_buffer()<CR>',
      "Reset Buffer",
    },
    ["<leader>gs"] = {
      '<cmd>lua require "gitsigns".stage_hunk()<CR>',
      "Stage Hunk",
    },
    ["<leader>gu"] = {
      '<cmd>lua require "gitsigns".undo_stage_hunk()<CR>',
      "Undo Stage Hunk",
    },
    ["<leader>go"] = { "<cmd>Telescope git_status<CR>", "Open changed file" },
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
    ["<leader>gD"] = { "<cmd>Gitsigns diffthis HEAD<CR>", "Diff" },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
  })
end

function Spec.config(_, opts)
  require("gitsigns").setup(opts)
end

return Spec
