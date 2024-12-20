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
" Directories
"
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swapfiles//


"
" Overrides
"

let mapleader=','

"
" Settings
"

set autoindent                 " automatically indent based on previous line
set autoread                   " automatically reload if changed outside of vim
set foldmethod=syntax          " folding
set hidden                     " enable switching from unsaved buffers
set history=10000              " set history count
set laststatus=2               " always show a status bar
set winwidth=80                " minimal number of columns for the current window
set mouse=a                    " enable mouse
set nu                         " show line numbers
set ignorecase smartcase       " enable case-sensitive search only if case is detected
set nobackup                   " disable backup files
set noequalalways              " disable resize on close
set nowritebackup              " disable temp backup before overwriting a file
set nojoinspaces               " disable multiple spaces after joining lines ending with punctuation
set showcmd                    " show incomplete commands
set showmatch                  " show closing bracket when a bracket is inserted
set switchbuf=useopen          " jump to buffer window
set wildmenu                   " emacs like tab completion
set wildmode=longest,list      " bash like tab completion

" backspace
set backspace=indent,eol,start " allow backspace over everything in insert mode

" encoding
set encoding=utf-8             " ensure encoding is utf-8
set fileencoding=utf-8         " ensure files written as utf-8

" fix slow O inserts
set timeout
set timeoutlen=1000
set ttimeoutlen=100

" search
set incsearch                  " show live matches
set hlsearch                   " highlight all matches

" soft tabs
set expandtab                  " use spaces to insert tabs
set smarttab                   " tabs in front of a line inserts blanks according to shiftwidth
set shiftround                 " round indents to multiple of shiftwidth
set softtabstop=2              " number of spaces a tab counts for during editing
set shiftwidth=2               " number of spaces to use for each step of (auto) indent
set tabstop=2                  " number of spaces a tab in the file counts for

" status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

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

" Toml
Plug 'cespare/vim-toml', { 'branch': 'main' }

" Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

" Formatters
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'vim-autoformat/vim-autoformat'

call plug#end()

"
" Configurations
"

" close buffer and keep the split
nnoremap <C-c> :bp\|bd #<CR>

" Autoformat
let g:formatdef_autopep8 = "'autopep8 - --max-line-length 120 --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']

au BufWrite *py :Autoformat

" Easy Align

xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" FZF

nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <Leader>f :Ag -g<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" Fugitive

nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gt :Git commit -S -v -q %:p<CR>

" Prettier

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" NERDCommenter

let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" YCM

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

nnoremap <leader>yjd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <silent> <leader>yrr <cmd>execute 'YcmCompleter RefactorRename' input( 'Rename to: ' )<CR>

"
" Utils
"

augroup myvimrc
  au!
  au BufWritePost .vimrc source $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
augroup END
