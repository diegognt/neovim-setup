local icons = require "diegognt.icons"
local Spec = {
  "j-hui/fidget.nvim",
  opts = {
    progress = {
      display = {
        done_icon = icons.misc.Smiley,
      },
    },
    notification = {
      window = {
        winblend = 0,
      },
    }
  },
}

function Spec.config(_, opts)
  require("fidget").setup(opts)

  local whichkey = require "which-key"

  whichkey.register {
    ["<leader>ln"] = { "<cmd>Fidget history<CR>", "Notifications" }
  }
end

return Spec
