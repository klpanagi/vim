let g:tagbar_left = 1

autocmd FileType c,cpp,py nested :TagbarOpen

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/bin/jsctags'
\ }

nnoremap <F2> :TagbarToggle<CR>
