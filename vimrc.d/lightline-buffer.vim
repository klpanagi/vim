set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" use lightline-buffer in lightline
let g:lightline = {
        \ 'colorscheme': 'powerline',
        \ 'active': {
              \ 'left': [ [ 'mode', 'paste' ],
                        \ [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'tabline': {
              \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
              \ 'right': [ [ 'close' ], ],
        \ },
        \ 'component_expand': {
                \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
                \ },
        \ 'component_type': {
                \ 'buffercurrent': 'tabsel',
                \ },
        \ 'component_function': {
                \ 'bufferbefore': 'lightline#buffer#bufferbefore',
                \ 'bufferafter': 'lightline#buffer#bufferafter',
                \ 'bufferinfo': 'lightline#buffer#bufferinfo',
                \ 'gitbranch': 'fugitive#head'
                \ },
        \ }

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

" remap arrow keys
nnoremap <S-Left> :bprev<CR>
nnoremap <S-Right> :bnext<CR>
