"
" Progress line like ....FF.FF.F..
"
syntax match rspecProgress /^[F\.\*]\+$/
syntax match rspecProgressPassed /\.\+/ containedin=rspecProgress contained
syntax match rspecProgressFailure /F\+/ containedin=rspecProgress contained
syntax match rspecProgressPending /\*\+/ containedin=rspecProgress contained
highlight rspecProgressPassed guifg=Green
highlight rspecProgressFailure guifg=Red
highlight rspecProgressPending guifg=Orange

"
" Pending
"
syntax match rspecPending /^Pending:/
highlight rspecPending guibg=Orange

"
" Failures
"
syntax match rspecFailures /^Failures:/
highlight rspecFailures guibg=Red
syntax region rspecFailureSpec start=/^\s\+[0-9]\+)/ end=/^\s\+#/he=e-1
highlight rspecFailureSpec guifg=Red

"
" Spec file
"
syntax match rspecFile /\S*_spec\.rb:[0-9]\+/
highlight rspecFile guifg=Purple guibg=LightGrey

"
" Summary
"
syntax match rspecSummaryAllPassed   /[0-9]\+ examples\?, 0 failures\?/
syntax match rspecSummaryHasPending  /[0-9]\+ examples\?, 0 failures\?, [1-9][0-9]* pendings\?/
syntax match rspecSummaryHasFailures /[0-9]\+ examples\?, [1-9][0-9]* failures\?.*/
highlight rspecSummaryAllPassed guifg=Green
highlight rspecSummaryHasPending guifg=Orange
highlight rspecSummaryHasFailures guifg=Red
