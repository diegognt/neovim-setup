local Spec = {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>" },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>" },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>" },
    { "<C-l>", "<cmd>TmuxNavigateRight<CR>" },
  },
  lazy = false,
}

return Spec
