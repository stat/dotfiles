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
"Plug 'el-iot/buffer-tree-explorer'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Completion
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --all' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Git Other
" Plug 'jonas/tig'
" Plug 'puremourning/vimspector'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

"
" Plugin's Settings
"

" Airline

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD
"let g:airline_theme='iceberg'

""let g:airline#extensions#tabline#excludes = ['branches', 'index']
""let g:airline#extensions#tabline#left_sep = ' '
""let g:airline#extensions#tabline#left_alt_sep = '>'
""let g:airline#extensions#tabline#show_tab_nr = 1
""let g:airline#extensions#tabline#tab_nr_type = 1

""let g:airline_powerline_fonts = 1

""let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
""let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
""let g:airline#extensions#tabline#tabs_label = 'buffers'       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
""let g:airline#extensions#tabline#buffers_label = 'tabs'    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
""let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
""let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
""let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
""let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
"""let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
""let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
""let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

" Easy Align

xmap <leader> a <Plug>(EasyAlign)
nmap <leader> a <Plug>(EasyAlign)

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
