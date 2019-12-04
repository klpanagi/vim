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

" Plug 'milkypostman/vim-togglelist'

Plug 'Shougo/unite.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"" Deoplete sources -----{
Plug 'zchee/deoplete-jedi', { 'do': 'pip install jedi --user' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
" Plug 'zchee/deoplete-clang'
" Plug 'wellle/tmux-complete.vim'
" Plug 'zchee/deoplete-zsh'
" Plug 'Shougo/neco-vim'
"" ------------------}

Plug 'morhetz/gruvbox'
" Plug 'chriskempson/base16-vim'

" Plug 'godlygeek/tabular'
"
""  Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'do': function('BuildTagbar') }

"" Code Snippets ---{
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
"" ---------------}

Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'

Plug 'zhimsel/vim-stay'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
" Plug 'tmhedberg/SimpylFold'

Plug 'tpope/vim-surround'

Plug 'PotatoesMaster/i3-vim-syntax'

"" Vim and Tmux together ------------{
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
"" ----------------------------------}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Linting Engine
Plug 'w0rp/ale'
" Plug 'Chiel92/vim-autoformat'
" Plug 'neomake/neomake' | Plug 'dojoteef/neomake-autolint'

"" Git related -----------------{
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
"" -----------------------------}

" insert mode auto-completion for quotes, parens, brackets, etc
Plug 'Raimondi/delimitMate'

" Plug 'Shougo/vimproc.vim', { 'do' : 'make' }

Plug 'jlanzarotta/bufexplorer'
Plug 'ap/vim-buftabline'

Plug 'Vimjas/vim-python-pep8-indent'

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
exec 'source' '~/.vim/vimrc.d/autocmd.vim'
