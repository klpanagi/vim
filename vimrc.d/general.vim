"" Working with Unicode
if has('multi_byte')
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif


set number 		"uto_initialization = 0 Show Line Numbers
set nocompatible   	" Stops explicit vi behavior
set bg=dark
set t_Co=256		" Set 256 color setting
set laststatus=2        " Always show status line
set incsearch           " Move through doc, while writing search pattern
set hlsearch            " Highligh search patterns in text

set backspace=indent,eol,start  " Enable backspace deletion mode
set mouse=a

"" Autoreload vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

autocmd FileType make setlocal noexpandtab    " No expandtab in Makefile

" ColorScheme
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme jellybeans


"""""""""""""""""""""""""""""
" SECTION: INDENTATION
"""""""""""""""""""""""""""""
filetype indent on        " Indent document according to filetype
set expandtab             " Use whitespace instead of tab
set shiftwidth=2          " Use two spaces indetation with reindent (<< or >>)
set softtabstop=2         " Use two spaces as tab indetation
set cino=(2               " Behaviour of indentation in unclosed parenthesis
set autoindent            " Keep indentation from previous line
set smartindent           " Automatically inserts indentation in some cases
set cindent               " Like smartindent, but stricter and more customisabl

" Add the proper PEP8 (Python) indentation
"au BufNewFile,BufRead *.py
    "\ set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix


let &colorcolumn="80,".join(range(120,999),",")    " Show 80 line vertical line
