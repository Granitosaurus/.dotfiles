" VUNDLE SETTINGS
" --------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-wheel'
Plugin 'reedes/vim-wordy'
Plugin 'junegunn/goyo.vim'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" --------------------------------------------------------
set number
set encoding=utf-8
" theme
syntax enable
syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
"set whichwrap=b,s,<,>,[,],h,l
set scrolloff=4
inoremap <C-BS> <C-W>
function! Writing()
	set nonumber
	set nobreakindent
	nnoremap j gj
	nnoremap k gk
	nnoremap 0 g0
	nnoremap $ g$
	"set guioptions-=r
	"set guioptions-=L
	set guicursor=a:blinkon0
	set laststatus=1
	set spell
	let g:wheel#map#mouse = 1
	call pencil#init({'wrap': 'soft'})
	let g:pencil#textwidth = 80
	Goyo
endfunction
cabbrev writing call Writing()

set guioptions-=m
set guioptions-=T
set guioptions-=r
set tabstop=4 shiftwidth=4 expandtab
" Navivgation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" File types
" -----------------------------------------------
au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=120|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
"broken au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|
