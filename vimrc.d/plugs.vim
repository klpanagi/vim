""""""""""""""""""""""""""""""""""""""
"" SECTION: Vim-Better-Whitespace
"""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red
let g:better_whitespace_verbosity=1
""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
"" SECTION: Others
"""""""""""""""""""""""""""""
let g:tmuxcomplete#trigger = 'omnifunc'
let g:plug_url_format = 'git@github.com:%s.git'
let g:airline_powerline_fonts = 1

set complete+=kspell

nmap <silent> <leader>d <Plug>(pydocstring)

" Navigate the completion menu from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

nnoremap <F2> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/bin/jsctags'
\ }
