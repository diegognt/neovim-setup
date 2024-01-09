local Spec = {
  "moll/vim-bbye",
  event = "VeryLazy",
}

function Spec.set_keymaps()
  require "which-key".register({
    ["<leader>c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["<leader>bb"] = { "<cmd>Telescope buffers<CR>", "List" },
    ["<leader>bs"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search Text" },
    ["<leader>w"] = { "<cmd>w!<CR>", "Save" },
  })
end

Spec.config = function()
  Spec.set_keymaps()
end

return Spec
