
"""""""""""" YouCOompleteMe """"""""""""""""""""
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1

""@ Diagnostics
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '✭'
"" highlight regions of text that are related to the diagnostic that is
"" present on a line, if any
let g:ycm_enable_diagnostic_highlighting = 1
""  turns on YCM's diagnostic display features
let g:ycm_show_diagnostics_ui = 1

let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_global_ycm_extra_conf = ''

let g:ycm_use_ultisnips_completer = 1

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

"" which Vim filetypes (see :h filetype) should the YCM semantic completion.
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1
      \}

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

""@ Preview Window
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<tab>" " you can use <c-j>
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" UltiSnip
" ---------
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-l>"
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff
