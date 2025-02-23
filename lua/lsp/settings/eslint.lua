local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not lspconfig_status then
  vim.notify "The `nvim/lspconfig` plugin was not found."
  return
end

return {
  root_dir = lspconfig.util.root_pattern(
    ".eslintrc.json",
    ".eslintrc.js",
    ".eslintrc",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml"
  ),
  setttings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },
    codeActionOnSave = {
      enable = true,
      mode = "all",
    },
    format = false,
    onIgnoredFiles = "on",
  },
}
