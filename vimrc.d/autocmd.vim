augroup python
  autocmd!
  autocmd FileType python
        \   syn keyword pythonSelf self
        \ | highlight def link pythonSelf Special
augroup end

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
