local Spec = {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        handlers = {},
      }
    },
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
  },
  event = "VeryLazy",
}

Spec.set_keymap = function()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<C-b>", ':lua require("dap").toggle_breakpoint()<CR>', opts) -- Toggle Breakpoint
  keymap("n", "<F1>", ':lua require("dapui").eval(vim.fn.input "[Expression] > ")<CR>', opts) -- Evaluate Input
  keymap("n", "<F2>", ':lua require("dap").set_breakpoint(vim.fn.input "[Condition] > ")<CR>', opts) -- Conditional Breakpoint
  keymap("n", "<F4>", ':lua require("dap.ui.widgets").hover()<CR>', opts) --Hover Variables
  keymap("n", "<F5>", ':lua require("dap").pause.toggle()<CR>', opts) --Pause
  keymap("n", "<F6>", ':lua require("dap").step_out()<CR>', opts) --Step Out
  keymap("n", "<F7>", ':lua require("dap").step_back()<CR>', opts) -- Step Back
  keymap("n", "<F8>", ':lua require("dap").continue()<CR>', opts) -- Continue
  keymap("n", "<F9>", ':lua require("dap").step_over()<CR>', opts) --Step Over
  keymap("n", "<F10>", ':lua require("dap").step_into()<CR>', opts) --Step Into
  keymap("n", "<F11>", ':lua require("dap").close()<CR>', opts) --Quit
  keymap("n", "<F12>", ':lua require("dap").terminate()<CR>', opts) --Terminate
  keymap("n", "<C-d>", ':lua require("dap").disconnect()<CR>', opts) --Disconnect
  keymap("n", "<C-U>", ':lua require("dapui").toggle()<CR>', opts) --Toggle UI
end

function Spec.config()
  local dap = require "dap"
  local dapui = require "dapui"
  require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"
  require("dap-python").test_runner = "pytest"
  require("dap-go").setup()

  dapui.setup {}

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open {}
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close {}
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close {}
  end

  Spec.set_keymap()
end

return Spec
