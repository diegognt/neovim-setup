return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "marilari88/neotest-vitest",
    {
      "thenbe/neotest-playwright",
      dependencies = "nvim-telescope/telescope.nvim",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require "neotest-python",
        require "neotest-vitest"({
          filter_dir = function(name, _, _)
            return name ~= "node_modules"
          end,
        }),
        require("neotest-playwright").adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        }),
      },
    })
  end,
}
