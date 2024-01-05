local Spec = {
  "danymat/neogen",
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
}

return Spec
