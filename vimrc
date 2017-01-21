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
"" -----}

call plug#begin('~/.vim/plugged')
  Plug 'digitaltoad/vim-pug'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'

  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'on': [] }
  Plug 'SirVer/ultisnips', { 'on': [] } | Plug 'ervandew/supertab' | Plug 'honza/vim-snippets'

  Plug 'scrooloose/syntastic'

  Plug 'Valloric/ListToggle'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'kien/rainbow_parentheses.vim'

  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'


  Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim
     
  Plug 'vim-scripts/cscope.vim'
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'christoomey/vim-tmux-navigator'
  Plug 'wellle/tmux-complete.vim'
  Plug 'tmux-plugins/vim-tmux'

  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'shime/vim-livedown'
  Plug 'Raimondi/delimitMate'
  Plug 'mhinz/vim-startify'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'airblade/vim-gitgutter'
  Plug 'flazz/vim-colorschemes'
  Plug 'lervag/vimtex'
  Plug 'rhysd/vim-grammarous'
  Plug 'Shougo/unite.vim'
  Plug 'kana/vim-operator-user'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': function('BuildFzF') }
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

  "" Python Plugins --{
  Plug 'hdima/python-syntax'

  "" --}

  "" JavaScript Plugins --{
  Plug 'pangloss/vim-javascript'
  Plug 'ternjs/tern_for_vim'
  "" --}

  Plug 'mhinz/vim-rfc'
  Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
call plug#end()

"" Load YCM and Ultisnips first time in insert mode -----{
  augroup load_us_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                       \| autocmd! load_us_ycm
  augroup END
"" -----}

filetype plugin indent on
syntax on

"" Load vim config files
for fpath in split(globpath('~/.vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor

