local Spec = {
  "moll/vim-bbye",
  event = "VeryLazy",
}

local function set_keymaps()
  local opts = { silent = true, noremap = true }
  local keymap = vim.keymap.set

  keymap("n", "<Space>c", "<cmd>Bdelete!<CR>", vim.tbl_deep_extend("force", opts, { desc = "[c]lose buffer" }))
  keymap(
    "n",
    "<leader><leader>",
    "<cmd>Telescope buffers<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "List current uffers" })
  )
  keymap(
    "n",
    "<leader>bs",
    "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "[s]earch text on current [b]uffer" })
  )
  keymap("n", "<leader>w", "<cmd>w!<CR>", vim.tbl_deep_extend("force", opts, { desc = "[w]rite current buffer" }))
end

Spec.config = function()
  set_keymaps()
end

return Spec
