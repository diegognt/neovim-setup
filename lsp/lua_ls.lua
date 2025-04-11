---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      format = { enable = false },
      hint = { enable = true },
      diagnostics = {
        globals = { "vim", "spec", "Snacks" },
      },
      runtime = {
        version = "LuaJIT",
        special = {
          spec = "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
