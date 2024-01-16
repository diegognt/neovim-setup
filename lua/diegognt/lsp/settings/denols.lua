local lspconfig = require "lspconfig"

return {
  -- on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern "deno.json",
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
        autoImports = true,
        completeFunctionCalls = true,
        names = true,
        imports = {
          autoDiscover = true,
        },
      },
    },
  },
}
