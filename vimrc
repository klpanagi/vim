set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ervandew/supertab'
"" Nerd Commenter
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'SirVer/ultisnips'
"" Snippets
Plug 'honza/vim-snippets'
"" CScope
Plug 'git@github.com:vim-scripts/cscope.vim.git'
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

filetype plugin indent on

syntax on

"""""""""""" Working with Unicode """"""""""""""
if has('multi_byte')
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
set mouse=a


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

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" NERDTress File highlighting
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


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

"" Cscope
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>

"s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


"""""""""""""""" Mappings and Defines """"""""""""""""

" Splitted windows navigation
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Tab windows navigation
noremap <C-W>h :tabprevious<CR>
noremap <C-W>l :tabnext<CR>
noremap <C-W>n :tabnew<CR>
noremap <C-W>q :tabclose<CR>

" Switch between source files and header files quickly
nnoremap <F4> <ESC>:AS<CR>
nnoremap <F6> <ESC>:AS<CR>

" Remap commenting
map , <Leader>ci

" Save file
nmap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>a

" Quit file
nmap <F3> :q!<CR>
inoremap <F3> <ESC>:q!<CR>

" File tree
nmap <F8> :NERDTreeToggle<CR>
inoremap <F8> <ESC>:NERDTreeToggle<CR>

" Stamping
nnoremap S diw"0P

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

