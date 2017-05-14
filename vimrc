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

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction


call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake' | Plug 'dojoteef/neomake-autolint'
Plug 'milkypostman/vim-togglelist'

Plug 'Chiel92/vim-autoformat'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
"" Deoplete sources -----{
Plug 'zchee/deoplete-jedi', { 'do': 'sudo pip install jedi' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
Plug 'zchee/deoplete-clang'
Plug 'wellle/tmux-complete.vim'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-vim'
"" ------------------}
Plug 'chriskempson/base16-vim'

Plug 'Shougo/unite.vim'
"" Vim script for text filtering and alignment 
Plug 'godlygeek/tabular'
""  Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'do': function('BuildTagbar') }
"" Code Snippets ---{
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
"" ---------------}
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim

Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'vim-scripts/DoxygenToolkit.vim'

"" Vim and Tmux together ------------{
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
"" ----------------------------------}

"" Git related -----------------{
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
"" -----------------------------}

Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'
Plug 'rhysd/vim-grammarous'
Plug 'kana/vim-operator-user'
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
"" Python Plugins --{
Plug 'hdima/python-syntax'
Plug 'heavenshell/vim-pydocstring'
"" --}
"" JavaScript Plugins --{
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'digitaltoad/vim-pug'
"" --}
Plug 'mhinz/vim-rfc'
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
Plug 'elzr/vim-json'

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'plasticboy/vim-markdown'

Plug 'itchyny/lightline.vim'
call plug#end()

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

filetype plugin indent on
syntax on

"" Load vim config files
for fpath in split(globpath('~/.vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor
