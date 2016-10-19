let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs)
  nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
  nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs)
  nunmap <buffer><C-n>
  nunmap <buffer><C-p>
endfunction

nmap <F12> :GrammarousCheck --lang=el<CR>
inoremap <F12><ESC> :GrammarousCheck --lang=el<CR>

nmap <F11> :setlocal spell spelllang=el<CR>
inoremap <F11> <ESC>:setlocal spell spelllang=el<CR>a
