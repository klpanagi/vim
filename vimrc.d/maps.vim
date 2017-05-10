let mapleader=","
let maplocalleader="`"

map <Esc>[B <Down>]

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Highlight last inserted text
nnoremap gV `[v`]

" Escape
inoremap jk <esc>

" Yank to the system clipboard
vnoremap <C-c> "*y

" Splitted windows navigation
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Terminfo ASCII Character fix:
" https://github.com/neovim/neovim/issues/2048#issuecomment-78534227
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif

" Tab windows navigation
noremap <S-Left> :tabprevious<CR>
noremap <S-Right> :tabnext<CR>
noremap <C-W>n :tabnew<CR>
noremap <C-W>q :tabclose<CR>

" Switch between source files and header files quickly
nnoremap <F4> <ESC>:AS<CR>
nnoremap <F6> <ESC>:AS<CR>

" Save file
nmap <F8> :w<CR>
inoremap <F8> <ESC>:w<CR>a

" Quit file
" nmap <F3> :q!<CR>
" inoremap <F3> <ESC>:q!<CR>

" Stamping
nnoremap S diw"0P


" Delete the contents of brackets
imap dd{ <ESC>di{i
imap dd[ <ESC>di[i
imap dd( <ESC>di(
imap dd' <ESC>di'i
imap dd" <ESC>di"i
imap dd< <ESC>di<i
nmap dd{ di{
nmap dd[ di[
nmap dd( di(
nmap dd' di'
nmap dd" di"
nmap dd< di<
imap dd} <ESC>di}i
imap dd] <ESC>di]i
imap dd) <ESC>di)i
imap dd> <ESC>di>i
nmap dd} di}
nmap dd] di]
nmap dd) di)
nmap dd> di>

" Copy the contents of brackets
imap yy{ <ESC>yi{i
imap yy[ <ESC>yi[i
imap yy( <ESC>yi(i
imap yy' <ESC>yi'i
imap yy" <ESC>yi"i
imap yy< <ESC>yi<i
nmap yy{ yi{
nmap yy[ yi[
nmap yy( yi(
nmap yy' yi'
nmap yy" yi"
nmap yy< yi<
imap yy} <ESC>yi}i
imap yy] <ESC>yi]i
imap yy) <ESC>yi)i
imap yy> <ESC>yi>i
nmap yy} yi}
nmap yy] yi]
nmap yy) yi)
nmap yy> yi>

" Select the contents of brackets
imap vv{ <ESC>vi{i
imap vv[ <ESC>vi[i
imap vv( <ESC>vi(i
imap vv' <ESC>vi'i
imap vv" <ESC>vi"i
imap vv< <ESC>vi<i
nmap vv{ vi{
nmap vv[ vi[
nmap vv( vi(
nmap vv' vi'
nmap vv" vi"
nmap vv< vi<
imap vv} <ESC>vi}i
imap vv] <ESC>vi]i
imap vv) <ESC>vi)i
imap vv> <ESC>vi>i
nmap vv} yi}
nmap vv] vi]
nmap vv) vi)
nmap vv> vi>


"" Indentation --{
nnoremap <C-t> >>_
nnoremap <C-d> <<_
inoremap <C-t> <C-t>
inoremap <C-d> <C-D>
vnoremap <C-t> >gV
vnoremap <C-d> <gV
" --}

nnoremap <leader>c :call NERDComment(0,"toggle")<CR>
vnoremap <leader>c :call NERDComment(0,"toggle")<CR>
inoremap <leader>c <C-o>:call NERDComment(0,"toggle")<C-m>

" Space character in normal mode
nnoremap <space> i<space><ESC><right>

nnoremap <leader>sws :StripWhitespace<CR>
