return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = require "snacks.config.dashboard",
    picker = { enabled = true },
    indent = { enabled = true, char = "┊", only_scope = true },
    notifier = { enabled = true },
    scratch = { enabled = true },
  },
  keys = require "snacks.config.keymaps",
}
