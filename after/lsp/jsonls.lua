---@type vim.lsp.Config
return {
  filetypes = { "json", "jsonc" },
  single_file_support = true,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
}
