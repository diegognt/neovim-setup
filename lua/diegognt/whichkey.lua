local function set_keymaps()
  local opts = { silent = true, noremap = true }
  local keymap = vim.keymap.set

  keymap(
    "n",
    "<leader>F",
    "<cmd>Telescope find_files<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "[F]ind files" })
  )
  keymap(
    "n",
    "<leader>f",
    "<cmd>Telescope git_files<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "[f]ind git files" })
  )
  keymap(
    "n",
    "<leader>h",
    "<cmd>Telescope help_tags<CR>",
    vim.tbl_deep_extend("force", opts, { desc = "Find on nvim [h]elp" })
  )
  keymap("n", "<leader>M", "<cmd>Mason<CR>", vim.tbl_deep_extend("force", opts, { desc = "[M]ason" }))
  keymap("n", "<leader>L", "<cmd>Lazy<CR>", vim.tbl_deep_extend("force", opts, { desc = "[L]azy" }))
end

-- A = {
--   name = "Asistant",
--   p = { "<cmd>NeoAIToggle<CR>", "Prompt" },
-- },
-- C = {
--   name = "Copilot",
--   d = { "<cmd>Copilot disable<CR>", "Disable" },
--   e = { "<cmd>Copilot enable<CR>", "Enable" },
-- },

local Spec = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    show_help = true, -- show help message on the command line when the popup is visible
  },
}

function Spec.config(_, opts)
  local whichkey = require "which-key"

  whichkey.setup(opts)
  set_keymaps()
end

return Spec
