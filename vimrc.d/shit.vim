nmap <leader>gr :call GreekLang()<CR>

function! GreekLang()
  if &keymap==""
    set keymap=greek_utf-8
    echo "Greek input enabled"
  else
    set keymap=""
    echo "Greek input disabled"
  endif
endfun
