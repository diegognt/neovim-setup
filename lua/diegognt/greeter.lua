local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  vim.notify('The `goolord/alpha-nvim` plugin was not found.')
  return
end

local M = {}

M.dashboard = require('alpha.themes.dashboard')
-- TODO: Find a better ASCII art.
M.dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

M.dashboard.section.buttons.val = {
  M.dashboard.button(
    'f',
    '  Find file',
    '<cmd>lua require("telescope.builtin").git_files(require("telescope.themes").get_dropdown({previewer = false}))<CR>'
  ),
  M.dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  M.dashboard.button('p', '  Find project', ':Telescope projects <CR>'),
  M.dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
  M.dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
  M.dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua <CR>'),
  M.dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
}

M.dashboard.section.header.opts.hl = 'Include'
M.dashboard.section.buttons.opts.hl = 'Keyword'

M.dashboard.opts.opts.noautocmd = true

return M
