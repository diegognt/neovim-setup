local icons = require "diegognt.icons"

local Spec = {
  "SmiteshP/nvim-navic",
  opts = {
    icons = icons.kind,
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
    separator = " " .. icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  },
  config = true,
}

return Spec
