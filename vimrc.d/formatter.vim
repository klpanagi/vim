autocmd FileType vim,tex let b:autoformat_autoindent=0
let g:formatter_yapf_style = 'pep8'

noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat
