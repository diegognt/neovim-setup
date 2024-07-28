local Spec = {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
  },
  event = "VeryLazy",
  opts = {
    ensure_installed = require("diegognt.globals").mason.dap,
  },
}

local function set_keymap()
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

local function set_ui()
  local dapui = require "dapui"
  local dap = require "dap"

  dapui.setup({})

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
  end
end

local function set_python()
  local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path)
  require("dap-python").test_runner = "pytest"
end

local function set_go()
  require("dap-go").setup()
end

local function set_node()
  local dap = require "dap"
  dap.adapters["pwa-node"] = {
    type = "server",
    host = "127.0.0.1",
    port = 8123,
    executable = {
      command = "js-debug-adapter",
    },
  }

  for _, languaje in ipairs({ "javascript", "typescript" }) do
    dap.configurations[languaje] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch File",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "node",
      },
    }
  end
end

function Spec.config(_, opts)
  require("mason-nvim-dap").setup(opts)

  set_ui()
  set_python()
  set_go()
  set_node()
  set_keymap()
end

return Spec
