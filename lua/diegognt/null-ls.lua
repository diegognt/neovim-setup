-- NOTE: When using a node based tools used the `dynamic_command`.
-- NOTE: When using custom command, use a lua table instead of a string.
local M = {}

M.opts = function(formatting, diagnostics)
  return {
    sources = {
      diagnostics.eslint,
      formatting.deno_fmt.with({
        condition = function(utils)
          return utils.root_has_file('deno.json')
        end,
        extra_args = { '--config', 'deno.json' },
      }),
      formatting.prettier,
      formatting.stylelint,
      diagnostics.stylelint,
      formatting.stylua,
      -- diagnostics.vale,
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
