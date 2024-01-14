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
}

function Spec.set_keymaps()
  require("which-key").register({
    -- ["<leader>td"] = {
    --   '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>',
    --   "Debug nearest",
    -- },
    ["<leader>tr"] = {
      '<cmd>lua require("neotest").run.run()<CR>',
      "Run nearest",
    },
    ["<leader>tf"] = {
      '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
      "Run File",
    },
    ["<leader>tp"] = {
      '<cmd>lua require("neotest").output_panel.open()<CR>',
      "Panel",
    },
    ["<leader>ts"] = {
      '<cmd>lua require("neotest").summary.open()<CR>',
      "Tests Summary",
    },
  })
end

function Spec.config()
  require("neotest").setup({
    adapters = {
      require "neotest-vitest",
      require "neotest-python",
      require "neotest-deno",
      require "neotest-go",
      require "neotest-playwright",
    },
  })

  Spec.set_keymaps()
end

return Spec
