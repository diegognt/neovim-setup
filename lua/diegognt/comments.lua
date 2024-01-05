local Spec = {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = {
    hooks = {
      pre = function()
        require("ts_context_commentstring.internal").update_commentstring({})
      end,
    },
  },
}

function Spec.config(_, opts)
  require("mini.comment").setup(opts)
end

return Spec
