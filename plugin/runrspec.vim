"
" run-rspec.vim is TODO
" TODO
"
" Version: 0.0.0
" Maintainer: itmammoth <itmammoth@gmail.com>
" License: MIT License
"

if exists("g:loaded_runrspec")
  finish
endif
let g:loaded_runrspec = 1

let s:save_cpo = &cpo
set cpo&vim


command! RunSpec call runrspec#rspec_current_file()
command! RunSpecLine call runrspec#rspec_current_line()
command! RunSpecLastRun call runrspec#rspec_last_run()


let &cpo = s:save_cpo
unlet s:save_cpo
