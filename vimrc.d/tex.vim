set grepprg=grep\ -nH\ $*

autocmd Filetype tex setl updatetime=2
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us
