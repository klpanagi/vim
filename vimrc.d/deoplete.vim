" Use deoplete.
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang/3.9.1"
let g:deoplete#sources#clang#sort_algo = "priority"
g:deoplete#sources#jedi#show_docstring = 1

imap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
