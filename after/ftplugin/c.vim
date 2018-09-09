" Highlight past column 80
highlight OverLength guifg=#DC322F
match OverLength /\%81v.\+/

" Set folding style to syntax
" au FileType c set fdm=syntax

" Remove tab expansion
setlocal noexpandtab

setlocal tabstop=4
setlocal shiftwidth=4
