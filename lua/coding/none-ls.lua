local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local config = function(_, opts)
  local none = require "null-ls"
  local formatting = none.builtins.formatting
  local diagnostic = none.builtins.diagnostics

  require("mason-null-ls").setup(opts)

  none.setup({
    sources = {
      formatting.prettier.with({
        condition = function(utils)
          return utils.root_has_file({ ".prettierrc" })
        end,
        extra_args = { "--config", ".prettierrc" },
        disabled_filetypes = {
          "vue",
          "json",
          "jsonc",
          "yaml",
          "markdown",
          "markdown.mdx",
          "graphql",
          "handlebars",
          "astro",
        },
      }),
      formatting.stylua.with({
        condition = function(utils)
          return utils.root_has_file ".stylua.toml"
        end,
      }),
      formatting.pyink,
      formatting.clang_format,
      diagnostic.pylint,
    },
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  })
end

return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  opts = {
    ensure_installed = require "globals.none-ls",
  },
  config = config,
}
