"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast closing
nmap <leader>q :q!<cr>

" Better command-line completion
set wildmenu

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Line numbers
set number

" Mouse
set mouse=a

" Visual block mode
set virtualedit+=block

" Spelling
set spelllang=en_us

" Title
set title

" Switch - https://github.com/AndrewRadev/switch.vimone
nnoremap - :Switch<cr>

" Sideways
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSS splitting/joining
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split one-line declarations
nmap " <Esc>:s/\([{;]\)[ ^I]*\(}*\)/\1\r\2  /g<CR> 
" Join multi-line declarations
vmap " :s/\([;{]\)\n[ ^I]*/\1 /g<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PDV -- phpDoc for Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/plugin/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Unless I'm editing CSS
autocmd FileType css setlocal shiftwidth=2 tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Position fold at indent
function! MyFoldText()
	let n = v:foldend - v:foldstart + 1
	let i = indent(v:foldstart)
	let istr = ''
	while i > 0
		let istr = istr . ' '
		let i = i - 1
	endwhile
	return istr . "+-" . v:folddashes . " " . n . " lines "
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme miso
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" PHP
let php_sql_query          = 1
let PHP_removeCRwhenUnix   = 1
let php_show_semicolon     = 0

let g:debuggerPort = 9999

" Javascript
let javaScript_alternateSwitch = 1
"let javaScript_fold            = 1

" JSON
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.json set filetype=javascript

" LessCSS
au BufNewFile,BufRead *.less set filetype=less

" HTML Syntax Conversion Options
let html_use_css	= 1
let html_no_hyperlinks	= 1
let use_xhtml		= 1
let html_ignore_folding	= 1
if exists('html_no_pre')
	unlet html_no_pre
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
