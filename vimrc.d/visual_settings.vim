syntax on
set ruler
set number
"set t_Co=256
set term=xterm-256color

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  "set background=dark
  "let g:rehash256=1
  "let g:molokai_original=0
  "colorscheme molokai
endif

"" Colorscheme configuration ----{
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_theme='onedark'
"let g:onedark_terminal_italics=1
colorscheme onedark
"" ------------------}

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
endif

if &term =~ '256color'
  set t_ut=
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

augroup python
  autocmd!
  autocmd FileType python
        \   syn keyword pythonSelf self
        \ | highlight def link pythonSelf Special
augroup end


