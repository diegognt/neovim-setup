local Spec = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters
    "marilari88/neotest-vitest",
    "markemmons/neotest-deno",
    "nvim-neotest/neotest-go",
    "thenbe/neotest-playwright",
  },
}

local set_keymaps = function()
  local opts = { silent = true, noremap = true }
  local keymap = vim.keymap.set

  keymap("n", "<leader>tn", function()
    require("neotest").run.run()
  end, vim.tbl_deep_extend("force", opts, { desc = "Runs a [n]ear test" }))

  keymap("n", "<leader>tf", function()
    require("neotest").run.run(vim.fn.expand "%")
  end, vim.tbl_deep_extend("force", opts, { desc = "Runs all test in a [f]ile" }))

  keymap("n", "<Leader>to", function()
    require("neotest").output.open()
  end, vim.tbl_deep_extend("force", opts, { desc = "Show test [o]utput" }))

  keymap("n", "<leader>ts", function()
    require("neotest").summary.toggle()
  end, vim.tbl_deep_extend("force", opts, { desc = "Shows tests [s]ummary" }))
end

function Spec.config()
  require("neotest").setup({
    adapters = {
      require "neotest-vitest"({
        -- Filter directories when searching for test files.
        -- Useful in large projects (see Filter directories notes).
        filter_dir = function(name, _, _)
          return name ~= "node_modules"
        end,
      }),
      require "neotest-go",
      require "neotest-deno",
      require("neotest-playwright").adapter({
        options = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
        },
      }),
    },
  })

  set_keymaps()
end

return Spec
