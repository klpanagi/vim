augroup python
  autocmd!
  autocmd FileType python
        \   syn keyword pythonSelf self
        \ | highlight def link pythonSelf Special
augroup end

autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall | q
  \| endif

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
