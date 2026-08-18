return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
      highlight_groups = {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
        LineNr = { fg = "muted" },
        CursorLineNr = { fg = "love" },
        Pmenu = { fg = "text", bg = "base" },
        PmenuSel = { fg = "base", bg = "rose" },
        LazyNormal = { bg = "base", fg = "text" },
        MasonNormal = { bg = "base", fg = "text" },
      },
    })
    vim.cmd.colorscheme "rose-pine"
  end,
}