local icons = require "globals.icons"
local diff = {
  "diff",
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
local lsp_status = {
  "lsp_status",
  icon = "",
  symbols = {
    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
    done = "✓",
    separator = " ",
  },
  ignore_lsp = { "null-ls" },
  show_name = false,
}

return {
  "nvim-lualine/lualine.nvim",
  event = "ColorScheme",
  opts = {
    theme = "rose-pine",
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "snacks_dashboard", "snacks_picker_input", "oil", "oil_preview" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { branch },
      lualine_c = { diff, "diagnostics" },
      lualine_x = { lsp_status, "encoding", "filetype" },
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  },
}
