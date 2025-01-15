return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    float = {
      max_width = 80,
      max_height = 50,
    },
    keymaps = {
      ["s"] = { "actions.select", opts = { vertical = true } },
      ["h"] = { "actions.select", opts = { horizontal = true } },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name:match "^.git$" or name:match "^node_modules" or name:match "^.vscode"
      end,
    },
  },
  keys = {
    { "-", "<cmd>Oil --float<CR>", desc = "Open File Navigation" }
  },
  config = true,
}
