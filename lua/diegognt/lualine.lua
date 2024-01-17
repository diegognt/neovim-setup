local icons = require "diegognt.icons"
local diff = {
  "diff",
  colored = false,
  symbols = {
    added = icons.git.LineAdded,
    modified = icons.git.LineModified,
    removed = icons.git.LineRemoved,
  }, -- Changes the symbols used by the diff.
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local Spec = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard", "Outline" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { branch },
      lualine_c = { diff },
      lualine_x = { "copilot" },
      lualine_y = { "filetype" },
      lualine_z = { "location", "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  },
  config = true,
}

return Spec
