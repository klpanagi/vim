set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
"" Nerd Commenter
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on

syntax on

"""""""""""" Working with Unicode """"""""""""""
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

"""""""""""" YouCOompleteMe """"""""""""""""""""

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 0

let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '✭'

let g:ycm_enable_diagnostic_signs = 1
""  highlight regions of text that are related to the diagnostic that is
""  present on a line, if any
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_global_ycm_extra_conf = ''

"let g:ycm_use_ultisnips_completer = 1

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

""""""""""""""""""""""""""""""""""""""""""""""""

"" UltiSnips ""
let g:UltiSnipsExpandTrigger="<s-tab>"

""""""""""""""""" Miscelaneous """""""""""""""""""""""
set number 		"uto_initialization = 0 Show Line Numbers
set nocompatible   	" Stops explicit vi behavior
set bg=dark
set t_Co=256		" Set 256 color setting
set laststatus=2        " Always show status line
set incsearch           " Move through doc, while writing search pattern
set hlsearch            " Highligh search patterns in text

set backspace=indent,eol,start  " Enable backspace deletion mode


let &colorcolumn="80,".join(range(120,999),",")    " Show 80 line vertical line


"" Color Scheme configurations
colorscheme molokai


"""""""""""""""" Filetype Indentation Mode """"""""""""""""
filetype indent on        " Indent document according to filetype

"""""""""""""""" Indentation Behaviour """"""""""""""""
set expandtab             " Use whitespace instead of tab
set shiftwidth=2          " Use two spaces indetation with reindent (<< or >>)
set softtabstop=2         " Use two spaces as tab indetation
set cino=(2               " Behaviour of indentation in unclosed parenthesis
set autoindent            " Keep indentation from previous line
set smartindent           " Automatically inserts indentation in some cases
set cindent               " Like smartindent, but stricter and more customisable
autocmd FileType make setlocal noexpandtab    " No expandtab in Makefile

""""""""""""""""Nerd Tree enable """"""""""""""""
autocmd VimEnter * NERDTree     " Enable Nerdtree when vim starts
autocmd VimEnter * wincmd p
let NERDTreeDirArrows=0         " Use + ~ chars for directories
let NERDTreeMinimalUI=1         " Remove excess information bars
let NERDTreeShowBookmarks=1     " Show Bookmarks


"""""""" Whitespaces Plugin """"""""""
highlight ExtraWhitespace ctermbg=white
"let g:better_whitespace_filetypes_blacklist=['<filetype1>', '<filetype2>']


"""""""""""""""" Folding Code """"""""""""""""
set foldmethod=syntax           " Fold according to syntax type
set foldcolumn=1                " Show fold column next to numbers
set foldlevelstart=20           " Start file with all folds open
set foldminlines=4              " Fold only hunks with mre than 4 lines


"""""""""""""""" Rainbow parenthesis """""""""""""""""

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_loadcmd_toggle = 0

"" Always On
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""" Airline """""""""""""""""""""""""""""
" Show number of non-zero  modifications next to branch name in git repos
"let g:airline#extensions#hunks#enabled = 1
"let g:airline#extensions#hunks#non_zero_only = 1

"let g:airline#extensions#tabline#enabled = 1

"let g:airline_powerline_fonts = 1
"let g:airline_symbols = {}                        " Allow use of custom symbols
"let g:airline_symbols.branch = '⎇''
"let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Pymode """"""""""""""""""""""""
"let g:pymode = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""" Mappings and Defines """"""""""""""""

" Movement Key Mappings
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Switch between source files and header files quickly
nnoremap <F4> <ESC>:AS<CR>
nnoremap <F5> <ESC>:AS<CR>

nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

" Remap commenting
map - <Leader>ci

" Save file
nmap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>a

" Quit file
nmap <F3> :q!<CR>
inoremap <F3> <ESC>:q!<CR>

" File tree
nmap <F8> :NERDTreeToggle<CR>
inoremap <F8> <ESC>:NERDTreeToggle<CR>


" Delete the contents of brackets
imap dd{ <ESC>di{i
imap dd[ <ESC>di[i
imap dd( <ESC>di(i
imap dd' <ESC>di'i
imap dd" <ESC>di"i
imap dd< <ESC>di<i
nmap dd{ di{
nmap dd[ di[
nmap dd( di(
nmap dd' di'
nmap dd" di"
nmap dd< di<
imap dd} <ESC>di}i
imap dd] <ESC>di]i
imap dd) <ESC>di)i
imap dd> <ESC>di>i
nmap dd} di}
nmap dd] di]
nmap dd) di)
nmap dd> di>

" Copy the contents of brackets
imap yy{ <ESC>yi{i
imap yy[ <ESC>yi[i
imap yy( <ESC>yi(i
imap yy' <ESC>yi'i
imap yy" <ESC>yi"i
imap yy< <ESC>yi<i
nmap yy{ yi{
nmap yy[ yi[
nmap yy( yi(
nmap yy' yi'
nmap yy" yi"
nmap yy< yi<
imap yy} <ESC>yi}i
imap yy] <ESC>yi]i
imap yy) <ESC>yi)i
imap yy> <ESC>yi>i
nmap yy} yi}
nmap yy] yi]
nmap yy) yi)
nmap yy> yi>
"
