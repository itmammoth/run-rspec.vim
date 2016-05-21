let g:run_rspec_bin = 'bundle exec rspec'
let g:run_rspec_command_option = ''
let g:run_rspec_result_lines = 15

let s:result_buffer = 'RunRspecResult'
let s:last_full_cmd = ''


function! runrspec#rspec_current_file()
  call s:do_rspec(s:build_rspec_full_cmd())
endfunction

function! runrspec#rspec_current_line()
  let linenum = getpos('.')[1]
  call s:do_rspec(s:build_rspec_full_cmd() . ':' . linenum)
endfunction

function! runrspec#rspec_last_run()
  if s:last_full_cmd ==# ''
    call s:show_warning('Nothing to re-run! You have not run any rspec yet.')
    return
  endif
  call s:do_rspec(s:last_full_cmd)
endfunction


function! s:build_rspec_full_cmd()
  let filepath = expand('%:p')
  return join([
        \ g:run_rspec_bin,
        \ g:run_rspec_command_option,
        \ '--no-colour --format progress',
        \ filepath,
        \ ], ' ')
endfunction

function! s:do_rspec(full_cmd)
  " prepare result buffer
  if bufexists(s:result_buffer)
    silent execute 'bw!' s:result_buffer
  endif
  silent execute 'botright' g:run_rspec_result_lines 'new'
  silent execute 'edit' s:result_buffer
  silent setlocal buftype=nofile
  silent setlocal syntax=rspecresult

  " run rspec
  silent execute 'r!' a:full_cmd
  let s:last_full_cmd = a:full_cmd
  normal gg

  " map in result buffer
  nnoremap <silent> <buffer> q :q<BAR>:wincmd p<CR>
  nnoremap <silent> <buffer> <CR> :call <SID>open_file()<CR>
  nnoremap <buffer> n /^\s\+[0-9][0-9]*)<CR>
  nnoremap <buffer> p ?^\s\+[0-9][0-9]*)<CR>
endfunction

function! s:open_file()
  let spec_file_pattern = '\S\+_spec\.rb:[0-9]\+'
  " \zs$ : Hit at the end of line to include the current line.
  call search(spec_file_pattern . '.*\zs$', 'csW')
  let filepath_with_linenum = matchstr(getline('.'), spec_file_pattern)
  if filepath_with_linenum == ''
    call s:show_warning('Not found spec file path.')
    return
  endif
  " Get back to the position marked when searching.
  normal `'
  let [filepath, linenum] = s:split_into_path_and_linenum(filepath_with_linenum)
  if !s:back_to_spec_window(filepath, linenum)
    call s:open_new_spec_window(filepath, linenum)
  endif
endfunction

function! s:split_into_path_and_linenum(filepath_with_linenum)
  let [filepath, linenum] = split(a:filepath_with_linenum, ':')
  let trimed_filepath = substitute(filepath, '^\./', '', '')
  return [trimed_filepath, linenum]
endfunction

function! s:back_to_spec_window(filepath, linenum)
  let winnum = s:find_winnum(a:filepath)
  if winnum > -1
    silent execute winnum 'wincmd w'
    call cursor(a:linenum, 1)
    return 1
  endif
  return 0
endfunction

function! s:open_new_spec_window(filepath, linenum)
  execute 'e' a:filepath
  call cursor(a:linenum, 1)
endfunction

function! s:find_winnum(filepath)
  for i in range(1, winnr('$'))
    let bname = bufname(winbufnr(i))
    if match(bname, a:filepath) > -1
      return i
    endif
  endfor
  return -1
endfunction

function! s:show_warning(message)
  echohl WarningMsg | echo '[run-rspec] ' . a:message | echohl None
endfunction
