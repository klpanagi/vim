let python_highlight_all = 1
let g:flake8_quickfix_location="topleft"

augroup python
  autocmd!
  autocmd FileType python
        \   syn keyword pythonSelf self
        \ | highlight def link pythonSelf Special
augroup end

