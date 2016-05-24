if exists("g:loaded_runrspec")
  finish
endif
let g:loaded_runrspec = 1

let s:save_cpo = &cpo
set cpo&vim


command! RunSpec call runrspec#rspec_current_file()
command! RunSpecLine call runrspec#rspec_current_line()
command! RunSpecLastRun call runrspec#rspec_last_run()

"
" run-rspec.vim never provides any key-mappings to you.
" Please add prefered key mappings to your .vimrc file.
" Ex)
" nnoremap <leader>r :RunSpec<CR>
" nnoremap <leader>l :RunSpecLine<CR>
" nnoremap <leader>e :RunSpecLastRun<CR>
"

let &cpo = s:save_cpo
unlet s:save_cpo
