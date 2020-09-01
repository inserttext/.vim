set tw=100
set colorcolumn=101

" Folding
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
set fillchars=fold:\ "
