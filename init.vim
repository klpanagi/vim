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

Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
""" ------------ FOLDING Plugins -------->
Plug 'zhimsel/vim-stay'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
"" <--------------------------------------
Plug 'tpope/vim-surround'
"" Vim and Tmux together ------------------>
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
" <-----------------------------------------
" Status Bar ------------------------------>
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" < ----------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Git related ---------------------------->
Plug 'airblade/vim-gitgutter'
"  <----------------------------------------
" insert mode auto-completion for quotes, parens, brackets, etc
Plug 'Raimondi/delimitMate'
Plug 'jlanzarotta/bufexplorer'
" Python specific ------------------------->
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'antoyo/vim-licenses'
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
