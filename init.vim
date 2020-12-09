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

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/unite.vim'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"" Deoplete sources -----{
Plug 'zchee/deoplete-jedi', { 'do': 'sudo pip install jedi' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-zsh'
"" ------------------}

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'majutsushi/tagbar'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'antoyo/vim-licenses'
Plug 'jiangmiao/auto-pairs'  " Insert or delete brackets, parens, quotes in pair.
Plug 'Rykka/InstantRst'  " RST preview plugin
" Colorschemes --------------------------------------------->
" Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'
" ----------------------------------------------------------

Plug 'neomake/neomake'   " Code Checker - Liner

Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'pacha/vem-tabline'
""" ------------ FOLDING Plugins -------->
" Plug 'zhimsel/vim-stay'
" Plug 'kalekundert/vim-coiled-snake'
" Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
"" <--------------------------------------
" Plug 'tpope/vim-surround'
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
Plug 'davidhalter/jedi-vim'  " Code jump (go-to) plugin
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
