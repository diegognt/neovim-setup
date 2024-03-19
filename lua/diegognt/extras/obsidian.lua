-- Description: Configuration for the obsidian spec

local globals = require "diegognt.globals"

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
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.title)
      return path:with_suffix ".md"
    end,
  },
}

function Spec.config(_, opts)
  require("obsidian").setup(opts)
end

return Spec
