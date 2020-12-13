let g:neomake_python_enabled_makers = ['pylint']
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

let g:neomake_open_list = 2
let g:neomake_verbose = 1
let g:neomake_list_height = 8

" augroup my_neomake_signs
"   au!
"   autocmd ColorScheme *
"         \ hi NeomakeErrorSign ctermfg=white |
"         \ hi NeomakeWarningSign ctermfg=yellow
" augroup END

" augroup my_neomake_highlights
"   au!
"   autocmd ColorScheme *
"         \ hi link NeomakeError SpellBad |
"         \ hi link NeomakeWarning SpellCap
" augroup END

call neomake#configure#automake('w')
