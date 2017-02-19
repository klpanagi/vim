set grepprg=grep\ -nH\ $*

autocmd Filetype tex setl updatetime=2
autocmd FileType tex noremap <F8> :w<CR><leader>ll

let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'all'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_CompileRule_dvi = ''
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_UseMakefile=1
