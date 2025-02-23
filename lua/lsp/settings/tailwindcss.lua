local lspconfig = require "lspconfig"

return {
  root_dir = lspconfig.util.root_pattern({
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
  }),
}
