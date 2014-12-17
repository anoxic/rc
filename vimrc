"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

filetype plugin on               " Enable filetype plugins
filetype indent on

let mapleader = ","              " Set a convenient leader
let g:mapleader = ","            
                                 
set title                        " Display a title
set spelllang=en_us              " Dictionary Language
set wildmenu                     " Better command-line completion
set number                       " Line numbers
set virtualedit+=block           " Visual block mode
set scrolloff=8                  " scroll 8 lines befores the edge
set pastetoggle=<F11>            " Use <F11> to toggle between 'paste' and 'nopaste'
                                 
set mouse=a                      " Mouse
set ttymouse=xterm               " Mouse
                                 
" Backups and undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set nobackup " Turn off backups, since we use version control
set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast shortcuts
map <leader>w :w!<cr>
map <leader>W :wa!<cr>
map <leader>q :q!<cr>
map <leader>Q :qa!<cr>
map <leader>z :w!<cr>:q!<cr>
map <leader>Z :wa!<cr>:qa!<cr>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Map Y to act like D/C and yank to EOL, rather than act as yy
nnoremap Y y$

" Move a line down with <c-j>
nnoremap <c-j> <Esc>ddp
" Move a line up with <c-k>
nnoremap <c-k> <Esc>ddkkp
" Move a visual block down with <c-j>
vnoremap <c-j> :m '>+1<CR>gv=gv
" Move a visual up with <c-k>
vnoremap <c-k> :m '<-2<CR>gv=gv

" Make return add a newline
nnoremap <Return> o<Esc>
nnoremap <s-Return> O<Esc>       
                                 
" Switch - https://github.com/AndrewRadev/switch.vim
nnoremap - :Switch<cr>

" Sideways - https://github.com/AndrewRadev/sideways.vim
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" Restrict repetitive navigation keys and up/down arrow keys
nmap jj :<C-u>echo 'Use <Num>j!'<CR>
nmap kk :<C-u>echo 'Use <Num>k!'<CR>
nmap <Down> :<C-u>echo 'Use <Num>j!'<CR>
nmap <Up> :<C-u>echo 'Use <Num>k!'<CR>

" Split CSS one-line declarations
nmap " <Esc>:s/\([{;]\)[ ^I]*\(}*\)/\1\r\2  /g<CR> 
" Join CSS multi-line declarations
vmap " :s/\([;{]\)\n[ ^I]*/\1 /g<CR>               

match Todo '\v^(\<|\=|\>){7}([^=].+)?$' " Highlight merge conflict markers

" Jump to next/previous merge conflict marker
nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab    " Use spaces instead of tabs
set shiftwidth=4 " Set tabwidth to 4
set tabstop=4    " Set tabwidth to 4
set smarttab     " Be smart when using tabs ;)

set ai   "Auto indent
set si   "Smart indent
set wrap "Wrap lines
                 
" Set tabwidth to 2 for certain languages
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType elixer setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Enable syntax highlighting

colorscheme miso
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

set ffs=unix,dos,mac " Use Unix as the standard file type



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP
let php_sql_query          = 1
let PHP_removeCRwhenUnix   = 1
let php_show_semicolon     = 0

let g:debuggerPort = 9999

" Javascript
let javaScript_alternateSwitch = 1

" JSON
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.json set filetype=javascript

" LessCSS
au BufNewFile,BufRead *.less set filetype=less

" HTML Syntax Conversion Options
let html_use_css        = 1
let html_no_hyperlinks  = 1
let use_xhtml           = 1
let html_ignore_folding	= 1
au BufNewFile,BufRead *.mustache set filetype=html
if exists('html_no_pre')
	unlet html_no_pre
endif

