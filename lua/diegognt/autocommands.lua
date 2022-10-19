local GeneralSettingsGroup = vim.api.nvim_create_augroup('GeneralSettings', { clear = true })
local CodeAnalysisGroup = vim.api.nvim_create_augroup('CodeAnalysis', { clear = true })
local AstroGroup = vim.api.nvim_create_augroup('AstroFiles', { clear = true })
local SpelledGroup = vim.api.nvim_create_augroup('SpelledFiles', { clear = true })
local AlphaGroup = vim.api.nvim_create_augroup('AlphaUser', { clear = true })
local ResizeGroup = vim.api.nvim_create_augroup('AutoResize', { clear = true })

vim.api.nvim_create_autocmd('User AlphaReady', {
  group = AlphaGroup,
  pattern = 'alpha',
  command = 'vim.opt.showtabline = 0',
})

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

vim.api.nvim_create_autocmd('FileType', {
  group = GeneralSettingsGroup,
  pattern = { 'qf', 'help', 'man', 'lspinfo', 'lsp-installer', 'null-ls-info' },
  command = 'nnoremap <silent> <buffer> q :close<CR>',
})

vim.api.nvim_create_autocmd('FileType', {
  group = GeneralSettingsGroup,
  pattern = 'qf',
  command = 'set nobuflisted',
})

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufRead', 'BufNewFile' }, {
  group = GeneralSettingsGroup,
  pattern = '*',
  command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
})

vim.api.nvim_create_autocmd('FileType', {
  group = SpelledGroup,
  pattern = { 'gitcommit', 'markdown' },
  command = 'setlocal wrap spell',
})

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
