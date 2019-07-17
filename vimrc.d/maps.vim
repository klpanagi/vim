let mapleader=","
let maplocalleader=","

map <Esc>[B <Down>]

" Highlight last inserted text
nnoremap gV `[v`]

" Escape
inoremap jk <esc>

nnoremap qq :bd<CR>

" Yank to the system clipboard
vnoremap <C-c> "*y

" Splitted windows navigation
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j

" Terminfo ASCII Character fix:
" https://github.com/neovim/neovim/issues/2048#issuecomment-78534227
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif

" Tab windows navigation
" noremap <A-Left> :tabprevious<CR>
" noremap <A-Right> :tabnext<CR>
noremap <C-W>n :tabnew<CR>
noremap <C-W>q :tabclose<CR>

" Stamping
nnoremap S diw"0P

"" Indentation --{
nnoremap <C-t> >>_
nnoremap <C-d> <<_
inoremap <C-t> <C-t>
inoremap <C-d> <C-D>
vnoremap <C-t> >gV
vnoremap <C-d> <gV
" --}

" Space character in normal mode
" nnoremap <space> i<space><ESC><right>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
