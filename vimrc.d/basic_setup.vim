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
set shiftwidth=2          " Use two spaces indetation with reindent (<< or >>)
set softtabstop=2         " Use two spaces as tab indetation
set cino=(2               " Behaviour of indentation in unclosed parenthesis
set autoindent            " Keep indentation from previous line
set smartindent           " Automatically inserts indentation in some cases
set cindent               " Like smartindent, but stricter and more customisabl

"" highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")    " Show 80 line vertical line

"""""""""""""""""""""""""""""
"" SECTION: Folding
"""""""""""""""""""""""""""""
set foldmethod=syntax           " Fold according to syntax type
set foldcolumn=1                " Show fold column next to numbers
set foldlevelstart=20           " Start file with all folds open
set foldminlines=4              " Fold only hunks with mre than 4 lines
let g:SimpylFold_docstring_preview = 1

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
set shell=/bin/sh

"" Map leader to ,
let mapleader=','

"" Disable annoying beeping and flashing -----{
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
"" -----}
