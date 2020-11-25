syntax on
set ruler
set number

let no_buffers_menu=1

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme gruvbox
set background=light
set termguicolors " if you want to run vim in a terminal
let python_highlight_all=1
colorscheme breezy

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
