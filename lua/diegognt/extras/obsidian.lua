-- Description: Configuration for the obsidian spec
-- TODO: Find the way to use path as a function to get the path from the system

local globals = require("diegognt.globals")

local Spec = {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Personal",
        path = globals.OBSIDIAN_VAULT,
      },
    },
  },
}

function Spec.config(_, opts)
  require("obsidian").setup(opts)
end

return Spec
