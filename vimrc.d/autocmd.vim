augroup python
  autocmd!
  autocmd FileType python
        \   syn keyword pythonSelf self
        \ | highlight def link pythonSelf Special
augroup end
