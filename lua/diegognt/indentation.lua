local Spec = {
  "echasnovski/mini.indentscope",
  dependencies = {
    "echasnovski/mini.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    draw = { delay = 80 },
    symbol = "┊",
  },
}

function Spec.configfunction(_, opts)
  require("mini.indentscope").setup(opts)
end

return Spec
