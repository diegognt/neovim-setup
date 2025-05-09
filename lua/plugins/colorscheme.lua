return {
  "EdenEast/nightfox.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    options = {
      transparent = true,
      styles = {
        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
        types = "italic",
      },
    },
  },
  config = function()
    vim.cmd.colorscheme "duskfox"
  end,
}
