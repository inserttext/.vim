""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load matchit.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime macros/matchit.vim
endif

" Sets how many lines of history VIM has to remember
set history=500

" Set time for swap updates
set updatetime=250


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor for vertical movement
set scrolloff=7

" Show line numbers
set number

" Configure backspace so it acts as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when cursor is over them
set showmatch
set matchtime=2

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Show cursor line
set cursorline


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable truecolor
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" Enable italics
set t_ZH=[3m
set t_ZR=[23m

set background=dark
colorscheme gruvbox

" Remove background (for terminal transparency)
hi Normal guibg=NONE ctermbg=NONE

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, Backups, and Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on persistent undo
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

" Turn off backups
set nobackup
set nowritebackup
set noswapfile

" Save with <leader><leader>
nmap <silent> <leader><leader> :update<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Browsing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Vexplore with <leader>nn
map <silent> <leader>nn :call ToggleVExplorer()<CR>

" Remove banner
let g:netrw_banner = 0

" Set style to tree
let g:netrw_liststyle = 3

" Open in previous window
let g:netrw_browse_split = 4

" Set width %
let g:netrw_winsize = 15


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act like modern browser search
set incsearch

" Search subfolders
set path+=**


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, and Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs are tabs
set noexpandtab

" Smart tabbing
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap text


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save
if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif

" Parenthesis/bracket automake
inoremap $4 {<esc>o}<esc>O


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving Around, Tabs, Windows, and Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<CR>

" Better window switching
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" Better tab management
nnoremap <silent> <leader>tc :tabnew<CR>
nnoremap <silent> <leader>tx :tabclose<CR>
nnoremap <silent> <leader>[ :tabprevious<CR>
nnoremap <silent> <leader>] :tabnext<CR>

" Quick find file
nnoremap <leader>f :find

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emacs command line mappings
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Command Line size
set cmdheight=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Toggles the file tree
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
