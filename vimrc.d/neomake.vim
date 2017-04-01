let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_c_enable_makers = ["clang"]


autocmd! BufWritePost * Neomake
