set nocompatible
filetype off

"" Automatic Vim-Plug Installation -----{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
"" -----}

function! BuildFzF(info)
  if a:info.status == 'installed' || a:info.force
    !./install --all
  endif
endfunction

function! BuildTagbar(info)
  !sudo npm install -g tern
  !sudo npm install -g git+https://github.com/ramitos/jsctags.git
endfunction
"" -----}
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction


call plug#begin('~/.vim/plugged')

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'Shougo/unite.vim'

Plug 'neomake/neomake'   " Code Checker - Liner
"" ------------------}
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'  " Insert or delete brackets, parens, quotes in pair.
Plug 'machakann/vim-highlightedyank'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'antoyo/vim-licenses'
" Colorschemes --------------------------------------------->
Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'
Plug 'ayu-theme/ayu-vim'
" ----------------------------------------------------------
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'pacha/vem-tabline'
""" ------------ FOLDING Plugins -------->
Plug 'zhimsel/vim-stay'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
"" <--------------------------------------
"" Vim and Tmux together ------------------>
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
" <-----------------------------------------
" Status Bar ------------------------------>
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" < ----------------------------------------
"" Git related ---------------------------->
Plug 'airblade/vim-gitgutter'
"  <----------------------------------------
" Python specific ------------------------->
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'vim-python/python-syntax'
Plug 'fisadev/vim-isort', {'do': 'pip install isort --user'}
" <-----------------------------------------
" Syntax Highlighting --------------------->
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'igordejanovic/textx.vim'
Plug 'chr4/nginx.vim'
" <-----------------------------------------

call plug#end()

if has('nvim')
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
endif

filetype plugin indent on
syntax on

"" Load vim config files
for fpath in split(globpath('~/.vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor
exe 'source' '~/.vim/vimrc.d/autocmd.vim'
