"" Autoreload vimrc -----{
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
""  -----}

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
