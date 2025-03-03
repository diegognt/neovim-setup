return {
  "danymat/neogen",
  -- TODO: Add dependencies
  opts = {
    languages = {
      c = {
        template = {
          annotation_convention = "doxygen",
        },
      },
      lua = {
        template = {
          annotation_convention = "ldoc",
        },
      },
      javascript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      python = {
        template = {
          annotation_convention = "google_docstrings",
        },
      },
      typescript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
    },
  },
  event = "VeryLazy",
  keys = {
    {"<leader>aa", "<cmd>lua require('neogen').generate()<CR>", desc = "[a]dd [a]nnotation"},
    {"<leader>ac", "<cmd>lua require('neogen').generate({type = 'class'})<CR>", desc = "[a]nnotate [c]lass"},
    {"<leader>af", "<cmd>lua require('neogen').generate({type = 'func'})<CR>", desc = "[a]nnotate [f]unction"},
  },
}
