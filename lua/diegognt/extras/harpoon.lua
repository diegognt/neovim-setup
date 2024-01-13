local Spec = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "rcarriga/nvim-notify"
  },
}

--- Harpoon config
function Spec.config()
  local keymap = vim.keymap.set
  local notify = require"notify"
  local harpoon = require "harpoon"

  harpoon:setup()

  keymap("n", "<s-m>", function()
    harpoon:list():append()
    notify.notify("Added current buffer to Harpoon")
  end)
  keymap("n", "<TAB>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)
  keymap("n", "<s-u>", function()
    harpoon:list():remove()
    notify.notify("Removed current buffer from Harpoon")
  end)
end

return Spec
