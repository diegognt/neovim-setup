local agent = { name = "antigravity", cmd = "agy" }

local M = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>ao",
      function()
        require("codecompanion").cli({ agent = agent.name })
      end,
      desc = "[a]gent [o]pen CLI",
      mode = "n",
    },
    {
      "<leader>ad",
      function()
        require("codecompanion").cli("#{diagnostics} Can you fix these?", { agent = agent.name })
      end,
      desc = "[a]gent fix [d]iagnostics",
      mode = "n",
    },
    {
      "<leader>ap",
      function()
        require("codecompanion").cli({ agent = agent.name, submit = true, prompt = true })
      end,
      desc = "[a]gent [p]rompt",
      mode = "n",
    },
    {
      "<leader>ar",
      function()
        require("codecompanion").cli("#{review} Review the code in the #{diff}?", { agent = agent.name })
      end,
      desc = "[a]gent [r]eview",
      mode = "n",
    },
  },
  opts = {
    interactions = {
      cli = {
        agent = agent.name,
        agents = {
          antigravity = {
            cmd = agent.cmd,
            args = {},
            description = "Google Antigravity CLI",
            provider = "terminal",
          },
        },
      },
    },
  },
}
return M
