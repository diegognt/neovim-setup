return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
  opts = {
    adapters = {
      gemma3 = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "gemma3:4b", -- Give this adapter a different name to differentiate it from the default ollama adapter
          schema = {
            model = {
              default = "gemma3:4b",
            },
            num_ctx = {
              default = 16384,
            },
            num_predict = {
              default = -1,
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "gemma3",
      },
      inline = {
        adapter = "gemma3",
      },
      cmd = {
        adapter = "gemma3",
      },
    },
  },
}
