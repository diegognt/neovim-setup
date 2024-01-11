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

function Spec.set_keymaps()
  require("which-key").register({
    ["<leader>mz"] = { "<cmd>ZenMode<CR>", "Zen Mode" },
    ["<leader>mf"] = { "<cmd>Twilight<CR>", "Focus Mode" },
  })
end

function Spec.config(_, opts)
  require("zen-mode").setup(opts)

  Spec.set_keymaps()
end

return Spec
