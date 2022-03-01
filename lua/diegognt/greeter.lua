local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  vim.notify('The `goolord/alpha-nvim` plugin was not found.')
	return
end

local dashboard = require('alpha.themes.dashboard')
-- TODO: Find a better ASCII art.
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
	dashboard.button(
    'f',
    '  Find file',
    '<cmd>lua require("telescope.builtin").git_files(require("telescope.themes").get_dropdown({previewer = false}))<CR>'
  ),
	dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
	dashboard.button('p', '  Find project', ':Telescope projects <CR>'),
	dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
	dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
	dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua <CR>'),
	dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
}

dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
