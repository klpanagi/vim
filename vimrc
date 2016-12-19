set nocompatible
filetype off

"" Automatic Vim-Plug Installation {

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"" }

"" Plug Hooks {

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

"" }


" set the runtime path to include Vundle and initialize
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'Valloric/ListToggle'
Plug 'scrooloose/syntastic'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'https://github.com/vim-scripts/cscope.vim.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'shime/vim-livedown'
Plug 'hynek/vim-python-pep8-indent'
"" https://github.com/search?utf8=%E2%9C%93&q=delimit
Plug 'Raimondi/delimitMate'
Plug 'python-mode/python-mode'

Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
"" https://github.com/digitaltoad/vim-pug
Plug 'digitaltoad/vim-pug'

Plug 'mhinz/vim-startify'

Plug 'tmux-plugins/vim-tmux'

Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'airblade/vim-gitgutter'

"Plug 'altercation/vim-colors-solarized'

Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'kana/vim-operator-user'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': function('BuildFzF') }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on

syntax on

"" Load vim config files
for fpath in split(globpath('~/.vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor

