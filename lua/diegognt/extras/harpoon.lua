local Spec = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",
  },
}

--- Harpoon config
function Spec.config()
  local keymap = vim.keymap.set
  local fidget = require"fidget"
  local harpoon = require "harpoon"

  harpoon:setup()

  keymap("n", "<s-m>", function()
    harpoon:list():append()
    fidget.notify("Added current buffer to Harpoon")
  end)
  keymap("n", "<TAB>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)
  keymap("n", "<s-u>", function()
    harpoon:list():remove()
    fidget.notify("Removed current buffer from Harpoon")
  end)
end

return Spec
