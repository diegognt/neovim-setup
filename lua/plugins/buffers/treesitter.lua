local parsers = require "globals.treesitter"

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "VeryLazy",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
  opts = {
    ensure_installed = parsers,
    sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = false,
    },
    textobject = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@scopename.inner",
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
        },
      },
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    matchup = {
      enable = { "astro" },
      disable = { "lua" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
