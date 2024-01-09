local Spec = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "markemmons/neotest-deno",
    "nvim-neotest/neotest-go",
    "thenbe/neotest-playwright",
  },
  version = "v3.x",
}

Spec.config = function()
  require("neotest").setup({
    adapters = {
      require "neotest-vitest",
      require "neotest-python",
      require "neotest-deno",
      require "neotest-go",
      require "neotest-playwright",
    },
  })
end

return Spec
