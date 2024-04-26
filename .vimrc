"
" Enforce
"

if &compatible
	set nocompatible
endif

"
" General
"

color lettuce
"color iceberg

filetype on
filetype indent on
filetype plugin on

syntax on

"
" Overrides
"

let mapleader=','

"
" Settings
"

set autoread              " automatically reload if changed outside of vim
set foldmethod=syntax     " folding
set hidden                " enable switching from unsaved buffers
set history=10000         " set history count
set mouse=a               " enable mouse
set nu                    " show line numbers
set ignorecase smartcase  " enable case-sensitive search only if case is detected
set nojoinspaces          " insert only one space when joining lines that contain sentence-terminating punctuation like `.`.
set showcmd               " show incomplete commands
set switchbuf=useopen
set wildmenu              " emacs like tab completion
set wildmode=longest,list " bash like tab completion

" fix slow O inserts
set timeout
set timeoutlen=1000
set ttimeoutlen=100

"set showmatch
"set incsearch
set hlsearch

" soft tabs
set shiftwidth=2          " eanble soft tabs
set softtabstop=2         " enable soft tabs
set tabstop=2             " enable soft tabs

" status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" close buffer and keep the split
nnoremap <C-c> :bp\|bd #<CR>

"
" Plugins
"

call plug#begin()

" Color
"Plug 'cocopon/iceberg.vim'

" General
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'

" Completion
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --all' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

"
" Plugin's Settings
"

" Easy Align

xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" FZF

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" Fugitive

nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gt :Git commit -v -q %:p<CR>

"
" Utils
"

augroup myvimrc
	au!
	au BufWritePost .vimrc source $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
augroup END
