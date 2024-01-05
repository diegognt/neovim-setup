local GeneralSettingsGroup = vim.api.nvim_create_augroup('GeneralSettings', { clear = true })
local CodeAnalysisGroup = vim.api.nvim_create_augroup('CodeAnalysis', { clear = true })
local AstroGroup = vim.api.nvim_create_augroup('AstroFiles', { clear = true })
local SpelledGroup = vim.api.nvim_create_augroup('SpelledFiles', { clear = true })
local AlphaGroup = vim.api.nvim_create_augroup('AlphaUser', { clear = true })
local ResizeGroup = vim.api.nvim_create_augroup('AutoResize', { clear = true })

vim.api.nvim_create_autocmd('BufUnload', {
  group = AlphaGroup,
  pattern = 'alpha',
  command = 'vim.opt.showtabline = 2',
})

vim.api.nvim_create_autocmd('VimResized', {
  group = ResizeGroup,
  pattern = '*',
  command = 'tabdo wincmd =',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = GeneralSettingsGroup,
  pattern = '*',
  desc = 'Highlight text on yank',
  callback = function()
    require('vim.highlight').on_yank({ higroup = 'Search', timeout = 200 })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = GeneralSettingsGroup,
  pattern = {
    'qf',
    'help',
    'man',
    'notify',
    'lspinfo',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'PlenaryTestPopup',
    'neotest-summary',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = GeneralSettingsGroup,
  pattern = 'qf',
  command = 'set nobuflisted',
})

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufRead', 'BufNewFile' }, {
  group = GeneralSettingsGroup,
  pattern = '*',
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = SpelledGroup,
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Astro filetype
vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  group = AstroGroup,
  pattern = '*.astro',
  command = 'set filetype=astro',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  group = CodeAnalysisGroup,
  pattern = { '.prettierrc', '.stylelintrc' },
  command = 'set filetype=json',
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  group = GeneralSettingsGroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
