"""""""""""""""""""""""""""""""""
"" SECTION: Nerd Tree
"""""""""""""""""""""""""""""""""
let NERDTreeDirArrows=1         " Use + ~ chars for directories
let NERDTreeMinimalUI=1         " Remove excess information bars
let NERDTreeShowBookmarks=1     " Show Bookmarks

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" NERDTress File highlighting --{
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')
" --}

" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Toggle NERDTree sidebar
nmap <F2> :NERDTreeToggle %<CR>
inoremap <F2> <ESC>:NERDTreeToggle %<CR>



""""""""""""""""""""""""""""""""""""""
"" SECTION: Vim-Better-Whitespace
"""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=yellow
let g:better_whitespace_verbosity=1
""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""
"" SECTION: Livedown
"""""""""""""""""""""""""""""
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = "firefox"



"""""""""""""""""""""""""""""
"" SECTION: Cscope
"""""""""""""""""""""""""""""
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>

"s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#findd('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>


"""""""""""""""""""""""""""""
"" SECTION: Folding
"""""""""""""""""""""""""""""
set foldmethod=syntax           " Fold according to syntax type
set foldcolumn=1                " Show fold column next to numbers
set foldlevelstart=20           " Start file with all folds open
set foldminlines=4              " Fold only hunks with mre than 4 lines
let g:SimpylFold_docstring_preview = 1


"""""""""""""""""""""""""""""
"" SECTION: Others
"""""""""""""""""""""""""""""
let g:tmuxcomplete#trigger = 'omnifunc'
let g:plug_url_format = 'git@github.com:%s.git'
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:airline_powerline_fonts = 1
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/bin/jsctags'
\ }

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_new_list_item_indent = 4
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

set complete+=kspell

let python_highlight_all = 1

nmap <silent> <leader>d <Plug>(pydocstring)

let g:markdown_composer_autostart=1
let g:markdown_composer_browser="firefox"
let g:markdown_composer_syntax_theme="atom-one-dark"

" Navigate the completion menu from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>
