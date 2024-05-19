-- NOTE: When using a node based tools used the `dynamic_command`.

local Spec = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  opts = {
    ensure_installed = require("diegognt.globals").mason.none_ls,
  },
}

function Spec.config(_, opts)
  local none = require "null-ls"
  local formatting = none.builtins.formatting
  local diagnostics = none.builtins.diagnostics

  require("mason-null-ls").setup(opts)

  none.setup {
    sources = {
      formatting.prettier.with {
        condition = function(utils)
          return utils.root_has_file ".prettierrc"
        end,
        extra_args = { "--config", ".prettierrc" },
      },
      formatting.stylua.with {
        condition = function(utils)
          return utils.root_has_file ".stylua.toml"
        end,
      },
      formatting.black,
      formatting.clang_format,
      diagnostics.mypy,
    },
  }
end

return Spec
