local Spec = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}

-- TODO: Find a better ASCII art.

return Spec
