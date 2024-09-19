local Globals = {
  OBSIDIAN_VAULT = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/PersonalVault",
  mason = {
    lsp = {
      "astro",
      "bashls",
      "biome",
      "cssls",
      "clangd",
      "denols",
      "dockerls",
      "eslint",
      "glsl_analyzer",
      "gopls",
      "html",
      "jsonls",
      "lua_ls",
      "marksman",
      "pyright",
      "ruff_lsp",
      "taplo",
      "tailwindcss",
      "ts_ls",
      "stylelint_lsp",
      "yamlls",
    },
    none_ls = {
      "black",
      "clang-format",
      "stylua",
      "prettier",
      "mypy",
    },
    dap = {
      "codelldb",
      "debugpy",
      "delve",
      "js-debug-adapter",
    },
  },
}

return Globals
