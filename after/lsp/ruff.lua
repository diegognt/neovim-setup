---@type vim.lsp.Config
return {
  on_attach = function(client, _)
    if client.name == "ruff" then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  before_init = function(_, config)
    local venv = vim.fn.getcwd() .. "/.venv"
    if vim.fn.isdirectory(venv) == 1 and vim.fn.executable(venv .. "/bin/ruff") == 1 then
      config.cmd = { venv .. "/bin/ruff", "server" }
    end
  end,
}