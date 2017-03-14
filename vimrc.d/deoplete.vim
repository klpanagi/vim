" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
