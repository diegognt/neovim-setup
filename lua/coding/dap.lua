-- DAP unified configuration (lazy.nvim spec)

-- Requirements:
--   • Python: install the `debugpy` package (`uv pip install debugpy`) and ensure the `python` executable is in your PATH.
--   • Go: install Delve (`go install github.com/go-delve/delve/cmd/dlv@latest`) and ensure `dlv` is available in your PATH.
--   • Ensure the corresponding language servers are installed via Mason (e.g., pyright, gopls) for full LSP+DAP experience.
--   • nvim-dap-ui provides UI integration.

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
  },
  keys = {
    { "<F5>", function() require('dap').continue() end, desc = "[D]ebug Continue", mode = "n" },
    { "<F10>", function() require('dap').step_over() end, desc = "[D]ebug Step Over", mode = "n" },
    { "<F11>", function() require('dap').step_into() end, desc = "[D]ebug Step Into", mode = "n" },
    { "<F12>", function() require('dap').step_out() end, desc = "[D]ebug Step Out", mode = "n" },
    { "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "[d]ebug Toggle [b]breakpoint", mode = "n" },
    { "<leader>dB", function() require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "[d]ebug Set Conditional [B]breakpoint", mode = "n" },
    { "<leader>dr", function() require('dap').repl.open() end, desc = "[d]ebug Open REPL", mode = "n" },
    { "<leader>dl", function() require('dapui').eval() end, desc = "[d]ebug Eval", mode = "n" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    require("dap-python").setup()
    require("dap-go").setup()
  end,
}
