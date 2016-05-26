set nocompatible
set backspace=indent,eol,start

setlocal runtimepath+=.
filetype plugin indent on
syntax on

let g:run_rspec_bin = 'bundle exec rspec'
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>l :RunSpecLine<CR>
nnoremap <leader>e :RunSpecLastRun<CR>
nnoremap <leader>cr :RunSpecCloseResult<CR>
