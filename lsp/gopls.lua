---@type vim.lsp.Config
return {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      codelenses = {
        generate = false, -- Don't show the `go generate` lens.
        gc_details = true, --  Show a code lens toggling the display of gc's choices.
        test = true, -- Show a code lens with the test status.
      },
    },
  },
}
