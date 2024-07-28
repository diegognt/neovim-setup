local Spec = {
  "folke/zen-mode.nvim",
  dependencies = {
    "folke/twilight.nvim",
    cmd = { "Twilight" },
    opts = {
      context = 5, -- amount of lines we will try to show around the current line
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ZenMode" },
  opts = {
    plugins = {
      -- this will change the font size on wezterm when in zen mode
      -- See alse also the Plugins/Wezterm section in this projects README
      wezterm = {
        enabled = true,
        -- can be either an absolute font size or the number of incremental steps
        font = "+2",
      },
    },
  },
}

local function set_keymaps()
  local opts = { silent = true, noremap = true, expr = true }
  local keymap = vim.keymap.set

  keymap("n", "<leader>mz", "<cmd>ZenMode<CR>", vim.tbl_deep_extend("force", opts, { desc = "[m]ode [z]en" }))
  keymap("n", "<leader>mf", "<cmd>Twilight<CR>", vim.tbl_deep_extend("force", opts, { desc = "[m]ode [f]ocus" }))
end

function Spec.config(_, opts)
  require("zen-mode").setup(opts)

  set_keymaps()
end

return Spec
