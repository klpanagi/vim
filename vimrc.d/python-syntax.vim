let python_highlight_all = 1

function! PythonHighlightSelf()
  syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@=" 
endfunction

command! Pyself call PythonHighlightSelf()
