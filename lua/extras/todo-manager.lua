return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "TodoTrouble" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
}
