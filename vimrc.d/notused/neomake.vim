
let g:neomake_python_flake8_maker = {
      \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
      \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#',
      \ }
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_c_enable_makers = ["clang"]
let g:neomake_sh_enabled_makers = ['spellcheck', 'sh']
let g:neomake_zsh_enabled_makers = ['zsh']

let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
      \   'text': '⚠',
      \   'texthl': 'NeomakeWarningSign',
      \ }
let g:neomake_message_sign = {
      \   'text': '➤',
      \   'texthl': 'NeomakeMessageSign',
      \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

let g:neomake_list_height = 8

let g:neomake_open_list = 0

augroup my_neomake_signs
  au!
  autocmd ColorScheme *
        \ hi NeomakeErrorSign ctermfg=white |
        \ hi NeomakeWarningSign ctermfg=yellow
augroup END


augroup my_neomake_highlights
  au!
  autocmd ColorScheme *
        \ hi link NeomakeError SpellBad |
        \ hi link NeomakeWarning SpellCap
augroup END

" set makeprg=shellcheck\ -fgcc\ %
" autocmd! BufWritePost * Neomake!
autocmd! BufWritePost * Neomake
