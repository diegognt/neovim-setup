-- NOTE: when using a node based tools used the `dynamic_command`.

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
      diagnostics.pylint,
      -- diagnostics.vale,
      formatting.black,
    },
  }
end

return M
