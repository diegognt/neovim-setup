local Spec = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<A-Right>",
        next = "<A-Down>",
        prev = "<A-Up>",
        dismiss = "<A-d>",
      },
    },
  },
}

function Spec.config(_, opts)
  require("copilot").setup(opts)
end

return Spec
