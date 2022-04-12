lua << EOF

require('nvim-treesitter.configs').setup {
    pyfold = {
        enable = true,
        custom_foldtext = true
    }
}

EOF
