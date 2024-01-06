local Spec = {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = {
    mappings = {
      -- Toggle comment (like `gcip` - comment inner paragraph) for both
      -- Normal and Visual modes
      comment = "/",
      -- Toggle comment on current line
      comment_line = "/",

      -- Toggle comment on visual selection
      comment_visual = "/",

      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      textobject = "gc",
    },
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
