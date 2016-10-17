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
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'git@github.com:vim-scripts/cscope.vim.git'
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'shime/vim-livedown'
Plug 'tmhedberg/SimpylFold'
Plug 'hynek/vim-python-pep8-indent'
Plug 'Raimondi/delimitMate'

Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'digitaltoad/vim-pug'

Plug 'mhinz/vim-startify'

Plug 'tmux-plugins/vim-tmux'

Plug 'PotatoesMaster/i3-vim-syntax'

call plug#end()

filetype plugin indent on

syntax on

"" Load vim config files
for fpath in split(globpath('~/vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor

