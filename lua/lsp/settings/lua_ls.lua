local lspconfig_status, _ = pcall(require, "lspconfig")

if not lspconfig_status then
  vim.notify "The `nvim/lspconfig` plugin was not found."
  return
end

return {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        return
      end
    end
  end,
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
