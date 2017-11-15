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
Plugin 'davidhalter/jedi-vim'
Plugin 'elzr/vim-json'
Plugin 'amoffat/snake'
Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'myusuf3/numbers.vim'  " breaks with goyo or something
Plugin 'terryma/vim-expand-region'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Rykka/riv.vim'
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
nnoremap <F3> :set nonumber! \| :NumbersToggle<CR> 
nnoremap <Leader>r :source $MYVIMRC<CR>
"map v <Plug>(expand_region_expand)  " vim-expand-region plugin
vmap <C-v> <Plug>(expand_region_shrink)
set encoding=utf-8
set spell
nnoremap <Space> <nop>  " unmap space for remaping to leader later
let mapleader = "\<Space>"
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nnoremap <Leader>k :OnlineThesaurusCurrentWord<CR>
" theme
syntax enable
syntax on
"set t_Co=256
"let g:solarized_termtrans=1                                                   
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"set whichwrap=b,s,<,>,[,],h,l
set scrolloff=4
inoremap <C-BS> <C-W>
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
function! Writing()
	set nonumber
	set nobreakindent
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

au BufNewFile,BufRead *.json
    \ set nospell
