augroup python
  autocmd!
  autocmd FileType python
        \ set autoindent
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

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
