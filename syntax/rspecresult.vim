"
" Progress line like ....FF.FF.F..
"
syntax match rspecProgress /^[F\.\*]\+$/
syntax match rspecProgressPassed /\.\+/ containedin=rspecProgress contained
syntax match rspecProgressFailure /F\+/ containedin=rspecProgress contained
syntax match rspecProgressPending /\*\+/ containedin=rspecProgress contained
highlight rspecProgressPassed ctermfg=46 cterm=bold guifg=Green gui=bold
highlight rspecProgressFailure ctermfg=Red cterm=bold guifg=Red gui=bold
highlight rspecProgressPending ctermfg=brown cterm=bold guifg=Orange gui=bold

"
" Pending
"
syntax match rspecPending /^Pending:/
highlight rspecPending ctermfg=Black ctermbg=brown cterm=bold guifg=Black guibg=Orange gui=bold

"
" Failures
"
syntax match rspecFailures /^Failures:/
highlight rspecFailures ctermfg=Black ctermbg=Red cterm=bold guifg=Black guibg=Red gui=bold
syntax region rspecFailureSpec start=/^\s\+[0-9]\+)/ end=/^\s\+#/he=e-1
highlight rspecFailureSpec ctermfg=Red guifg=Red

"
" Spec file
"
syntax match rspecFile /\S*_spec\.rb:[0-9]\+/
highlight rspecFile ctermfg=93 cterm=underline guifg=Purple gui=underline

"
" Summary
"
syntax match rspecSummaryAllPassed   /[0-9]\+ examples\?, 0 failures\?/
syntax match rspecSummaryHasPending  /[0-9]\+ examples\?, 0 failures\?, [1-9][0-9]* pendings\?/
syntax match rspecSummaryHasFailures /[0-9]\+ examples\?, [1-9][0-9]* failures\?.*/
highlight rspecSummaryAllPassed ctermfg=46 guifg=Green
highlight rspecSummaryHasPending ctermfg=brown guifg=Orange
highlight rspecSummaryHasFailures ctermfg=Red guifg=Red
