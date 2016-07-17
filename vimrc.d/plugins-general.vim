""""""""""""""""""""""""""""""""""
"" SECTION: Rainbow parenthesis
""""""""""""""""""""""""""""""""""

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

"" Always On
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons



"""""""""""""""""""""""""""""""""
"" SECTION: Nerd Tree
"""""""""""""""""""""""""""""""""

autocmd VimEnter * NERDTree     " Enable Nerdtree when vim starts
autocmd VimEnter * wincmd p
let NERDTreeDirArrows=0         " Use + ~ chars for directories
let NERDTreeMinimalUI=1         " Remove excess information bars
let NERDTreeShowBookmarks=1     " Show Bookmarks

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" NERDTress File highlighting
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

" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree



"""""""""""""""""""""""""""""
"" SECTION: Vim-Better-Whitespace
"""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red
let g:better_whitespace_verbosity=1




"""""""""""""""""""""""""""""
"" SECTION: Livedown
"""""""""""""""""""""""""""""

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" " should the browser window pop-up upon previewing
let g:livedown_open = 1
" " the port on which Livedown server will run
let g:livedown_port = 1337
" " the system command to launch a browser (ex. on linux)
let g:livedown_browser = "chromium"



"""""""""""""""""""""""""""""
"" SECTION: Cscope
"""""""""""""""""""""""""""""
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>

"s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>



"""""""""""""""""""""""""""""
"" SECTION: Folding
"""""""""""""""""""""""""""""

set foldmethod=indent           " Fold according to syntax type
set foldcolumn=1                " Show fold column next to numbers
set foldlevelstart=20           " Start file with all folds open
set foldminlines=4              " Fold only hunks with mre than 4 lines
" Enable folding with the spacebar
nnoremap <leader>f za
let g:SimpylFold_docstring_preview = 1



"""""""""""""""""""""""""""""
"" SECTION: Syntastic
"""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1

let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_javascript_checkers = ['jshint']

