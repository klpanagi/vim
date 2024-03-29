set nocompatible
filetype off

"" Automatic Vim-Plug Installation -----{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
"" -----}

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

Plug 'nvim-lua/plenary.nvim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Plug 'github/copilot.vim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'lukas-reineke/cmp-under-comparator'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'glepnir/dashboard-nvim'
Plug 'preservim/tagbar'
Plug 'kylechui/nvim-surround'

Plug 'kyazdani42/nvim-tree.lua'

" Visual effects for indented blocks
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jiangmiao/auto-pairs'  " Insert or delete brackets, parens, quotes in pair.
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'nvim-lualine/lualine.nvim'  " Status line
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Highlight matches of unde-cursor words
" Comment lines and blocks
Plug 'numToStr/Comment.nvim'
Plug 'ntpeters/vim-better-whitespace'
" Git signs/actions/etc
Plug 'lewis6991/gitsigns.nvim'

Plug 'anuvyklack/fold-preview.nvim'
Plug 'anuvyklack/keymap-amend.nvim'

Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'fisadev/vim-isort', {'do': 'pip install isort --user'}
"" Vim and Tmux together ------------------>
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
" <-----------------------------------------
" Colorschemes --------------------------------------------->
Plug 'srcery-colors/srcery-vim'
Plug 'glepnir/zephyr-nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'dracula/vim', { 'as': 'dracula' }
" ----------------------------------------------------------
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'igordejanovic/textx.vim'
call plug#end()


if has('nvim')
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
endif

filetype plugin indent on
syntax on

"" Load vim config files
exe 'source' '~/.vim/vimrc.d/basic_setup.vim'
exe 'source' '~/.vim/vimrc.d/maps.vim'
exe 'source' '~/.vim/vimrc.d/autocmd.vim'
exe 'source' '~/.vim/vimrc.d/tagbar.vim'
exe 'source' '~/.vim/vimrc.d/plugs.vim'

lua require("plugins")
lua require("lazy")
