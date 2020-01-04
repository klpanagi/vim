augroup vimrc_defx
  autocmd!
  autocmd FileType defx call s:defx_mappings() " Defx mappings
  autocmd VimEnter * call s:setup_defx()
  " autocmd VimEnter * call fugitive#detect(expand('<afile>')) | call lightline#update()
augroup END

nnoremap <silent><Leader>n :call <sid>defx_open({ 'split': v:true })<CR>
nnoremap <silent><Leader>hf :call <sid>defx_open({ 'split': v:true, 'find_current_file': v:true })<CR>
let s:default_columns = 'indent:git:icons:filename'

function! s:setup_defx() abort
  call defx#custom#option('_', {
        \ 'columns': s:default_columns,
        \ 'split': 'vertical',
        \ 'direction': 'botright',
        \ 'show_ignored_files': 0,
        \ 'buffer_name': '',
        \ 'winwidth': 30,
        \ 'toggle': 1,
        \ 'resume': 1
        \ })

  call defx#custom#column('filename', {
        \ 'min_width': 0,
        \ 'max_width': 100,
        \ })

  call s:defx_open({ 'dir': expand('<afile>') })
endfunction

function s:get_project_root() abort
  let l:git_root = ''
  let l:path = expand('%:p:h')
  let l:cmd = systemlist('cd '.l:path.' && git rev-parse --show-toplevel')
  if !v:shell_error && !empty(l:cmd)
    let l:git_root = fnamemodify(l:cmd[0], ':p:h')
  endif

  if !empty(l:git_root)
    return l:git_root
  endif

  return getcwd()
endfunction

function! s:defx_open(...) abort
  let l:opts = get(a:, 1, {})
  let l:path = get(l:opts, 'dir', s:get_project_root())

  if !isdirectory(l:path) || &filetype ==? 'defx'
    return
  endif

  let l:args = '-winwidth=40 -direction=topleft'

  if has_key(l:opts, 'split')
    let l:args .= ' -split=vertical'
  endif

  if has_key(l:opts, 'find_current_file')
    if &filetype ==? 'defx'
      return
    endif
    call execute(printf('Defx %s -search=%s %s', l:args, expand('%:p'), l:path))
  else
    call execute(printf('Defx -toggle %s %s', l:args, l:path))
    call execute('wincmd p')
  endif

  return execute("norm!\<C-w>=")
endfunction

function! s:defx_context_menu() abort
  let l:actions = ['new_multiple_files', 'rename', 'copy', 'move', 'paste', 'remove']
  let l:selection = confirm('Action?', "&New file/directory\n&Rename\n&Copy\n&Move\n&Paste\n&Delete")
  silent exe 'redraw'

  return feedkeys(defx#do_action(l:actions[l:selection - 1]))
endfunction

function s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('drop')
endfunction

" Toggle between defx window width and longest line
function! g:DefxToggleWidth(context) abort
  let l:max = 0
  let l:original = a:context['winwidth']
  for l:line in range(1, line('$'))
    let l:len = len(getline(l:line))
    if l:len > l:max
      let l:max = l:len
    endif
  endfor
  execute 'vertical resize '.(l:max == winwidth('.') ? l:original : l:max)
endfunction

function! s:defx_mappings() abort
  nnoremap <silent><buffer>m :call <sid>defx_context_menu()<CR>
  nnoremap <silent><buffer><expr> o <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> <CR> <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> <2-LeftMouse> <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> C defx#is_directory() ? defx#do_action('multi', ['open', 'change_vim_cwd']) : 'C'
  nnoremap <silent><buffer><expr> s defx#do_action('open', 'topleft vsplit')
  nnoremap <silent><buffer><expr> S defx#do_action('open', 'topleft split')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> U defx#do_action('multi', [['cd', '..'], 'change_vim_cwd'])
  nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer> J :call search('')<CR>
  nnoremap <silent><buffer> K :call search('', 'b')<CR>
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr>w   defx#do_action('call', 'DefxToggleWidth')
  silent exe 'nnoremap <silent><buffer><expr> tt defx#do_action("toggle_columns", "'.s:default_columns.':size:time")'
endfunction

" From defx-git plugin. Comment out if not used
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 1
let g:defx_git#show_ignored = 0
let g:defx_git#raw_mode = 0
hi Defx_git_Untracked guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
hi Defx_git_Ignored guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
hi Defx_git_Unknown guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
hi Defx_git_Renamed ctermfg=214 guifg=#fabd2f
hi Defx_git_Modified ctermfg=214 guifg=#fabd2f
hi Defx_git_Unmerged ctermfg=167 guifg=#fb4934
hi Defx_git_Deleted ctermfg=167 guifg=#fb4934
hi Defx_git_Staged ctermfg=142 guifg=#b8bb26

" From defx-icons plugin. Comment out if not used
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

nnoremap <silent> <F3> :Defx<Cr>
