local globals = require "globals" 
local icons = globals.icons
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
  icon = icons.git.Branch,
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {"snacks_dashboard", "snacks_picker_input", "oil", "oil_preview"},
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { branch },
      lualine_c = { diff },
      lualine_y = { "filetype" },
      lualine_z = { "location", "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  },
}
