vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup END
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup END
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup END
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup END
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup END
]])

vim.cmd([[ autocmd BufRead,BufEnter *.astro set filetype=astro ]])
vim.cmd([[ autocmd BufRead,BufEnter .prettierrc set filetype=json ]])
vim.cmd([[ autocmd BufRead,BufEnter .stylelintrc set filetype=json ]])
