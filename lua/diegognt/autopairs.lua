local Spec = {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.nvim",
  },
}

function Spec.config(_, opts)
  require("mini.pairs").setup(opts)
end

return Spec
