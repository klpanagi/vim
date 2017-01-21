"""""""""""""""""""""""""""""
"" SECTION: Syntastic
"""""""""""""""""""""""""""""

if !has('nvim')
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_enable_balloons = 1

  let g:syntastic_python_checkers=['flake8']
  let g:syntastic_javascript_checkers = ['jshint']
  let g:syntastic_tex_checkers = []

  let g:syntastic_aggregate_errors = 1

  " Don't jump automatically.
  let g:syntastic_auto_jump = 0

  let g:syntastic_error_symbol = "✗"

  let g:syntastic_enable_highlighting = 1
  " Write all buffers before navigating from Vim to tmux pane
  let g:tmux_navigator_save_on_switch = 2

  inoremap <F6> <ESC>:SyntasticToggleMode<CR>
  nnoremap <F6> <ESC>:SyntasticToggleMode<CR>
else
  autocmd! BufReadPost,BufWritePost * Neomake
  let g:neomake_open_list = 2
  let g:neomake_serialize = 1
  let g:neomake_serialize_abort_on_error = 1
  let g:neomake_javascript_jshint_maker = {
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
  let g:neomake_javascript_enabled_makers = ['jshint']

  let g:neomake_python_enabled_makers = ['flake8']
endif
