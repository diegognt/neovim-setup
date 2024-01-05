local Spec = {
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
    {
      "windwp/nvim-ts-autotag",
      event = "VeryLazy",
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
    },
  },
  opts = {
    ensure_installed = {
      "astro",
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "dockerfile",
      "dot",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "graphql",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "php",
      "phpdoc",
      "prisma",
      "pug",
      "python",
      "query",
      "regex",
      "scss",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    ignore_install = { "" },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
      enable = true,
      disable = { "markdown" },
      additional_vim_regex_highlighting = false,
    },
    matchup = {
      enable = { "astro" },
      disable = { "lua" },
    },
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    autotag = { -- `Uses windwp/nvim-ts-autotag` to autoclose or autoremane HTML tags.
      enable = true,
    },
    textobject = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
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
  },
}

function Spec.config(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return Spec
