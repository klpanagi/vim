let g:ale_linters = { 'python': ['pyls'] }
let g:ale_fixers = { 'python': ['yapf'] }
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_lint_on_text_changed = 'never'

let g:airline#extensions#ale#enabled = 1

let g:ale_fix_on_save = 0

let g:ale_set_highlights = 1

" nnoremap <Leader> :ALEToggle<CR>

nmap <silent> <space>k <Plug>(ale_previous_wrap)
nmap <silent> <space>j <Plug>(ale_next_wrap)


highlight ALEWarning ctermbg=DarkMagenta

