"""""""""""""""""""""""""""""
"" SECTION: Syntastic
"""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1

let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_tex_checkers = []

let g:syntastic_aggregate_errors = 1

" Don't jump automatically.
let g:syntastic_auto_jump = 0

let g:syntastic_error_symbol = "✗"

let g:syntastic_enable_highlighting = 1
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

inoremap <F6> <ESC>:SyntasticToggleMode<CR>
nnoremap <F6> <ESC>:SyntasticToggleMode<CR>
