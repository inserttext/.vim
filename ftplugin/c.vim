""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => C
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight past column 80
au FileType c highlight OverLength guifg=#DC322F
au FileType c match OverLength /\%81v.\+/

" Set folding style to syntax
" au FileType c set fdm=syntax

" Remove tab expansion
au FileType c set noexpandtab
