let mapleader=","

" Yank to the system clipboard
vnoremap <C-c> "*y

" Splitted windows navigation
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Tab windows navigation
noremap <C-W>h :tabprevious<CR>
noremap <C-W>l :tabnext<CR>
noremap <C-W>n :tabnew<CR>
noremap <C-W>q :tabclose<CR>

" Switch between source files and header files quickly
nnoremap <F4> <ESC>:AS<CR>
nnoremap <F6> <ESC>:AS<CR>

" Save file
nmap <F8> :w<CR>
inoremap <F8> <ESC>:w<CR>a

" Quit file
nmap <F3> :q!<CR>
inoremap <F3> <ESC>:q!<CR>

" File tree
nmap <F2> :NERDTreeToggle %<CR>
inoremap <F2> <ESC>:NERDTreeToggle %<CR>

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


"" Indentation
nnoremap <C-t> >>_
nnoremap <C-d> <<_
inoremap <C-t> <C-t>
inoremap <C-d> <C-D>
vnoremap <C-t> >gV
vnoremap <C-d> <gV


nnoremap <leader>c :call NERDComment(0,"toggle")<CR>
vnoremap <leader>c :call NERDComment(0,"toggle")<CR>
inoremap <leader>c <C-o>:call NERDComment(0,"toggle")<C-m>

nnoremap <space> i<space><ESC><right>

nnoremap <leader>sws :StripWhitespace<CR>
