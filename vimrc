set nocompatible
filetype off

"" Automatic Vim-Plug Installation -----{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
"" -----}

"" Plug Hooks -----{
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --tern-completer
  endif
endfunction


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


call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" Deoplete sources -----{
Plug 'zchee/deoplete-jedi', { 'do': 'sudo pip install jedi' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
Plug 'tweekmonster/deoplete-clang2'
Plug 'wellle/tmux-complete.vim'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-vim'
"" ------------------}

Plug 'Shougo/unite.vim'
"" Vim script for text filtering and alignment 
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
""  Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'do': function('BuildTagbar') }

"" Code Snippets ---{
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
"" ---------------}

Plug 'Valloric/ListToggle'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kien/rainbow_parentheses.vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim
   
Plug 'vim-scripts/cscope.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'
Plug 'tmux-plugins/vim-tmux'

Plug 'shime/vim-livedown'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'

Plug 'rakr/vim-one'

Plug 'rhysd/vim-grammarous'
Plug 'kana/vim-operator-user'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

"" Python Plugins --{
Plug 'hdima/python-syntax'
"" --}

"" JavaScript Plugins --{
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'digitaltoad/vim-pug'
"" --}

Plug 'mhinz/vim-rfc'
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }

Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
call plug#end()

filetype plugin indent on
syntax on

"" Load vim config files
for fpath in split(globpath('~/.vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor
