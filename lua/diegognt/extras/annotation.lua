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

local function set_keymaps()
  local opts = { silent = true, noremap = true, expr = true }
  local keymap = vim.keymap.set

  keymap(
    "n",
    "<leader>aa",
    "<cmd>lua require('neogen').generate()<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "[a]nnotate" })
  )
  keymap(
    "n",
    "<leader>ac",
    "<cmd>lua require('neogen').generate({type = 'class'})<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "[a]nnotate [c]lass" })
  )
  keymap(
    "n",
    "<leader>af",
    "<cmd>lua require('neogen').generate({type = 'func'})<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "[a]nnotate [f]unction" })
  )
end
function Spec.config(_, opts)
  require("neogen").setup(opts)

  set_keymaps()
end

return Spec
