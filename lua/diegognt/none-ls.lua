-- NOTE: When using a node based tools used the `dynamic_command`.
-- NOTE: When using custom command, use a lua table instead of a string.
local Spec = {
  "nvimtools/none-ls.nvim",
}

function Spec.config()
  local none = require "null-ls"
  local formatting = none.builtins.formatting
  local diagnostics = none.builtins.diagnostics

  none.setup({
    sources = {
      formatting.prettier.with({
        condition = function(utils)
          return utils.root_has_file ".prettierrc"
        end,
        extra_args = { "--config", ".prettierrc" },
      }),
      formatting.stylua.with({
        condition = function(utils)
          return utils.root_has_file ".stylua.toml"
        end,
      }),
      -- diagnostics.vale,
      -- formatting.beautysh, -- Make sure to run `pip install --user beautysh`
      -- Python tools with Pipenv
      formatting.black.with({
        command = { "pipenv", "run", "black" },
      }),
      formatting.isort.with({
        command = { "pipenv", "run", "isort" },
      }),
    },
  })
end

return Spec
