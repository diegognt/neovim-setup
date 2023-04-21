local M = {}

M.neo_ai = {
  ui = {
    output_popup_text = 'Assistant',
    input_popup_text = 'Prompt',
  },
  shortcuts = {
    {
      name = 'gitcommit',
      key = '<leader>ag',
      desc = 'generate git commit message',
      use_context = false,
      prompt = function()
        return [[
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less:
                ]] .. vim.fn.system('git diff --cached')
      end,
      modes = { 'n' },
      strip_function = nil,
    },
  },
}

M.copilot = {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = '<A-Right>',
      next = '<A-Down>',
      prev = '<A-Up>',
      dismiss = '<A-d>',
    },
  },
}

return M
