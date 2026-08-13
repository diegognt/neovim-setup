local icons = require "globals.icons"

return {
  "SmiteshP/nvim-navic",
  dependencies = {
    { "LunarVim/breadcrumbs.nvim", opts = {} },
  },
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
}
