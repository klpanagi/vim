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

"" }


" set the runtime path to include Vundle and initialize
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
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

Plug 'airblade/vim-gitgutter'

"Plug 'altercation/vim-colors-solarized'

Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'kana/vim-operator-user'

call plug#end()

filetype plugin indent on

syntax on

"" Load vim config files
for fpath in split(globpath('~/.vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor

