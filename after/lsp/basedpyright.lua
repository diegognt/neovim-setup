---@type vim.lsp.Config
return {
  single_file_support = true,
  before_init = function(_, config)
    local venv = vim.fn.getcwd() .. "/.venv"
    if vim.fn.isdirectory(venv) == 1 then
      config.init_options = config.init_options or {}
      config.init_options.python = config.init_options.python or {}
      config.init_options.python.path = venv .. "/bin/python"
      config.init_options.pythonPath = venv .. "/bin/python"
      config.settings = config.settings or {}
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = venv .. "/bin/python"
      config.settings.python.defaultInterpreterPath = venv .. "/bin/python"
      config.settings.python.venvPath = vim.fn.getcwd()
      config.settings.python.venv = ".venv"
    end
  end,
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}