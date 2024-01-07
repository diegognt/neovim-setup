local Spec = {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  }
}

function Spec.config()
  local whichkey = require "which-key"

  whichkey.register({
    ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  })

  whichkey.register({
    ["<leader>/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment", mode = "v"}
  })

  vim.g.skip_ts_commentstring_module = true

  ---@diagnostic disable: missing-fields
  require('ts_context_commentstring').setup {
  enable_autocmd = false,
  }

  require("Comment").setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })

end

return Spec
