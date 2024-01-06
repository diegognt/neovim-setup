local Spec = {
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
}

function Spec.config(_, opts)
  local whichkey = require "which-key"

  whichkey.register {
    ["<leader>aa"] = { '<cmd>lua require("neogen").generate()<CR>', "Annotation" },
    ["<leader>ac"] = { '<cmd>lua require("neogen").generate({type = "class"})<CR>', "Class" },
    ["<leader>af"] = {
      '<cmd>lua require("neogen").generate({type = "func"})<CR>',
      "Function",
    },
  }

  require "neogen".setup(opts)
end

return Spec
