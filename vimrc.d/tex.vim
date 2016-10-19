set grepprg=grep\ -nH\ $*
let g:tex_flavor = "xelatex"
let g:Tex_ViewRule_pdf='epdfview'  " Or any other pdf-viewer
let g:Tex_CompileRule_pdf = 'xelatex --interaction=nonstopmode thesis_klpanagi.tex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
