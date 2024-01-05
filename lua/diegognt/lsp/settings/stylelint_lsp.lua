local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not lspconfig_status then
  vim.notify "The `nvim/lspconfig` plugin was not found."
  return
end

return {
  root_dir = lspconfig.util.root_pattern({
    ".stylelintrc",
    ".stylelintrc.cjs",
    ".stylelintrc.js",
    ".stylelintrc.json",
    ".stylelintrc.yaml",
    ".stylelintrc.yml",
    "stylelint.config.cjs",
    "stylelint.config.mjs",
    "stylelint.config.js",
  }),
}
