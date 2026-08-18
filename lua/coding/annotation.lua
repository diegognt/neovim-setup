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
    { "<leader>Aa", "<cmd>lua require('neogen').generate()<CR>", desc = "[A]dd [a]nnotation" },
    { "<leader>Ac", "<cmd>lua require('neogen').generate({type = 'class'})<CR>", desc = "[A]nnotate [c]lass" },
    { "<leader>Af", "<cmd>lua require('neogen').generate({type = 'func'})<CR>", desc = "[A]nnotate [f]unction" },
  },
}
