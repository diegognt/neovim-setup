-- NOTE: When using a node based tools used the `dynamic_command`.
-- NOTE: When using custom command, use a lua table instead of a string.
local M = {}

M.opts = function(formatting, diagnostics)
  return {
    sources = {
      diagnostics.eslint.with({
        condition = function(utils)
          return utils.root_has_file('.eslintrc.json')
        end,
      }),
      formatting.deno_fmt.with({
        condition = function(utils)
          return utils.root_has_file('deno.json')
        end,
        extra_args = { '--config', 'deno.json' },
      }),
      formatting.prettier.with({
        condition = function(utils)
          return utils.root_has_file('.prettierrc')
        end,
        extra_args = { '--config', '.prettierrc' },
      }),
      formatting.stylelint.with({
        consition = function(utils)
          return utils.root_has_file('.stylelintrc')
        end,
      }),
      diagnostics.stylelint.with({
        condition = function(utils)
          return utils.root_has_file('.stylelintrc')
        end,
      }),
      formatting.stylua,
      -- diagnostics.vale,
      formatting.beautysh, -- Make sure to run `pip install --user beautysh`
      -- Python tools with Pipenv
      diagnostics.flake8.with({
        command = { 'pipenv', 'run', 'flake8' },
      }),
      formatting.black.with({
        command = { 'pipenv', 'run', 'black' },
      }),
      formatting.isort.with({
        command = { 'pipenv', 'run', 'isort' },
      }),
    },
  }
end

return M
