local Spec = {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    float = {
      max_width = 80,
      max_height = 30,
    },
    keymaps = {
      ["v"] = "actions.select_vsplit",
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name:match "^.git$" or name:match "^node_modules" or name:match "^.vscode"
      end,
    },
  },
}

function Spec.config(_, opts)
  require("oil").setup(opts)

  vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil" })
end

return Spec
