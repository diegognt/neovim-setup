---@type vim.lsp.Config
return {
  root_markers = { "deno.json", "deno.jsonc" },
  settings = {
    deno = {
      enable = true,
      lint = true,
      codeLens = {
        implementations = true,
        references = true,
        test = true,
      },
      suggest = {
        imports = {
          autoImports = true,
          completeFunctionCalls = true,
          names = true,
          imports = {
            autoDiscover = true,
          },
          hosts = {
            ["https://deno.land"] = true,
          },
        },
      },
    },
  },
}
