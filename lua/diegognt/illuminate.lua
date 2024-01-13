local Spec = {
  "RRethy/vim-illuminate",
  opts = {
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = { "alpha", "NvimTree" },
  },
}

Spec.set_keymap = function()
  vim.api.nvim_set_keymap(
    "n",
    "<A-n>",
    '<cmd>lua require"illuminate".goto_next_reference{wrap=true}<CR>',
    { noremap = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<A-p>",
    '<cmd>lua require"illuminate".goto_prev_reference{reverse=true,wrap=true}<CR>',
    { noremap = true }
  )
end

function Spec.config(_, opts)
  require("illuminate").configure(opts)
  Spec.set_keymap()
end

return Spec
