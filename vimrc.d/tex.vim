set grepprg=grep\ -nH\ $*
autocmd Filetype tex setl updatetime=1
let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'all'
let g:Tex_CompileRule_dvi = 'dvi'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_UseMakefile=1
