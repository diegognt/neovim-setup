local colorscheme = "nightfox"

-- Tokyo Night set up
-- if colorscheme == 'tokyonight' then
-- require('tokyonight').setup({
-- styles = {
-- Style to be applied to different syntax groups
-- comments = { italic = true },
-- keywords = { italic = false },
-- },
-- })
-- end

-- TODO: Add each setup when the colorscheme is in used.
-- require('kanagawa').setup({
-- transparent = true, -- do not set background color
-- functionStyle = {},
-- commentStyle = { italic = true },
-- keywordStyle = { italic = true },
-- statementStyle = { bold = true },
-- typeStyle = { bold = true, italic = true },
-- })

local Spec = {
  "EdenEast/nightfox.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    options = {
      transparent = true,
      styles = {
        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "italic",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "italic",
        variables = "NONE",
      },
    },
  },
}

function Spec.config(_, opts)
  require("nightfox").setup(opts)

  vim.cmd.colorscheme "duskfox"
end

return Spec
