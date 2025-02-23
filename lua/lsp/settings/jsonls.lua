local lspconfig_status, _ = pcall(require, "lspconfig")

if not lspconfig_status then
  vim.notify "The `nvim/lspconfig` plugin was not found."
  return
end

return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}
