""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/vim-plug')
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/lervag/vimtex.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-ragtag.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'https://github.com/jpalardy/vim-slime', { 'for': 'python' }
Plug 'https://github.com/hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'https://github.com/Glench/Vim-Jinja2-Syntax.git'
Plug 'https://github.com/jackguo380/vim-lsp-cxx-highlight.git'
Plug 'https://github.com/krisajenkins/vim-projectlocal.git'
Plug 'https://github.com/reconquest/vim-pythonx.git'
Plug 'https://github.com/SirVer/ultisnips.git'
call plug#end()
