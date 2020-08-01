augroup python
  autocmd!
  autocmd FileType python
        \   syn keyword pythonSelf self
        \ | highlight def link pythonSelf Special
        \ | set autoindent
        \ | set tabstop=4
        \ | set softtabstop=4
        \ | set shiftwidth=4
augroup end

au BufNewFile,BufRead *.py set foldmethod=indent

autocmd FileType json syntax match Comment +\/\/.\+$+

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall | q
  \| endif

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
