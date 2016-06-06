" VUNDLE SETTINGS
" --------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-wheel'
Plugin 'reedes/vim-wordy'
Plugin 'junegunn/goyo.vim'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'nelstrom/vim-markdown-folding'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" --------------------------------------------------------
set number
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
