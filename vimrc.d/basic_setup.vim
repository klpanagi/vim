syntax on
set ruler
set number

let no_buffers_menu=1

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme gruvbox
let g:srcery_italic = 1
colorscheme srcery
" let ayucolor="dark"
" colorscheme ayu

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
"" Working with Unicode
if has('multi_byte')
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  setglobal bomb
  set binary
  set ttyfast
  set fileencodings=ucs-bom,utf-8,latin1
endif

set encoding=utf-8
set number
set nocompatible
set bg=dark
set laststatus=2        " Always show status line
set incsearch           " Move through doc, while writing search pattern
set hlsearch            " Highligh search patterns in text
set cursorline          " Highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

set clipboard=unnamedplus  " Use system clipboard to copy and paste

if has('gui_running')
  nnoremap <C-V> "+gP
  inoremap <C-V> <ESC><C-V>i
  vnoremap <C-C> "+y
  " set clipboard=unnamedplus
  " set guioptions+=a
  set guifont=FantasqueSansMono\ Nerd\ Font\ Mono\ 11
endif

set backspace=indent,eol,start  " Enable backspace deletion mode
set mouse=a

filetype indent on        " Indent document according to filetype
set expandtab             " Use whitespace instead of tab
set shiftwidth=4          " Use two spaces indetation with reindent (<< or >>)
set softtabstop=4         " Use two spaces as tab indetation
set cino=(4               " Behaviour of indentation in unclosed parenthesis
set autoindent            " Keep indentation from previous line
set smartindent           " Automatically inserts indentation in some cases
set cindent               " Like smartindent, but stricter and more customisabl

set textwidth=80  " Wrap at 80 characters like a valid human
set colorcolumn=80
highlight ColorColumn ctermbg=DarkRed guibg=DarkRed
"""""""""""""""""""""""""""""
"" SECTION: Folding
"""""""""""""""""""""""""""""
" set foldmethod=syntax           " Fold according to syntax type
" set foldmethod=indent           " Fold according to syntax type
" set foldcolumn=1                " Show fold column next to numbers
" set foldlevelstart=20           " Start file with all folds open
" set foldminlines=2              " Fold only hunks with mre than 4 lines
"""""""""""""""""""""""""""""
"" SECTION: Searching
"""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase
"""""""""""""""""""""""""""""
set fileformats=unix
set showcmd
set shell=zsh

"" Map leader to ,
let mapleader=','

"" Disable annoying beeping and flashing -----{
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
"" -----}
