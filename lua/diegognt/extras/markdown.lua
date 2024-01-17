local Spec = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}

function Spec.config()
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = "markdown",
    callback = function()
      vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle markdown preview",
      })
    end,
  })
end

return Spec
