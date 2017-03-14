let g:neomake_python_enabled_makers = ['flake8', 'pep8']


autocmd! BufWritePost * Neomake
