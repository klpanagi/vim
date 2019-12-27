augroup python
  autocmd!
  autocmd FileType python
        \   syn keyword pythonSelf self
        \ | highlight def link pythonSelf Special
        \ | set foldmethod=indent
        " \ | set tabstop=4
        " \ | set tabstop=4
        " \ | set softtabstop=4
        " \ | set shiftwidth=4
augroup end

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

au FileType python set foldmethod=indent tabstop=4 softtabstop=4 shiftwidth=4 foldlevel=99
