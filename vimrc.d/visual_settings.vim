syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  "set background=dark
  "let g:rehash256=1
  "let g:molokai_original=0
  "colorscheme molokai
endif

if (has("termguicolors"))
  set termguicolors
endif

"" Colorscheme configuration ----{
"if (empty($TMUX))
" if (has("nvim"))
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
"endif

"let g:onedark_termcolors=16
" let g:one_allow_italics = 1
" colorscheme one
" set background=dark
"" ------------------}

colorscheme base16-default-dark
" colorscheme base16-onedark
" colorscheme base16-tomorrow-night

let base16colorspace=256

set mousemodel=popup
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  let g:CSApprox_loaded = 1

  if $TERM == 'xterm'
    set term=xterm-256color
  endif

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
else
  set t_Co=256
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff

let g:airline_theme='simple'
