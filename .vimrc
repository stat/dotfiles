set encoding=utf-8
set fileencoding=utf-8

let s:dirname = expand("<sfile>:p:h")

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
exe "source " . s:dirname . "/.vim/.vundles"
call vundle#end()

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:set t_Co=256 " 256 colors
:set background=dark
:color lettuce
":color grb256

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITING CONFIGURATION
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set nu
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000

set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
" set cursorline
set cmdheight=1
set switchbuf=useopen
"set showtabline=2
set winwidth=79
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Don't make backups at all
set nobackup
set nowritebackup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.

hi LineNr ctermfg=241 guifg=#626262 "rgb=98,98,98

filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off for real, hopefully
set foldmethod=syntax
"set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MACROS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let @1 = 'Akl                                                                                079ldwj'
let @2 = 'Akl                                                          039ldwj'

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%82v.*/
" augroup END

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: CTRLP
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.un~  " MacOSX/Linux

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

"let g:ctrlp_custom_ignore = {
"\ 'dir':  '\.git$\|\.hg$\|\.svn$',
"\ 'file': '\.exe$\|\.so$\|\.dll$',
"\ 'link': 'some_bad_symbolic_links',
"\ }

" let g:ctrlp_max_files = 0
" let g:ctrlp_max_depth = 50

" nmap <leader>f :CtrlPBuffer<CR>
" inoremap <leader><leader> <C-x><C-o>

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: Fugitive
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>ga :Git add %<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Git commit -v -q<CR>
nnoremap <Leader>gt :Git commit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiffsplit <CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl git pull<CR>

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: NERDCommenter
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

let g:NERDCustomDelimiters = {
      \ 'c': { 'left': '//'},
      \ 'rust': { 'left': '//'},
      \ 'ruby': { 'left': '#'}
      \ }

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: Rust
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rust_recommended_style = 0

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: YCM
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <leader>yjd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>yrr <cmd>execute 'YcmCompleter RefactorRename' input( 'Rename to: ' )<CR>







nnoremap <C-b> :center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.


let g:go_addtags_transform = 'camelcase'
:command -range -nargs=* GoTagsAdd <line1>,<line2>call GoTagsAdd(<f-args>)
function! GoTagsAdd(...) range
  let filename = expand('%:t')
  let line = a:firstline . ',' . a:lastline
  let cmds = ['!gomodifytags']
  call add(cmds, '-file')
  call add(cmds, filename)
  call add(cmds, '-line')
  call add(cmds, line)
  call add(cmds, '--skip-unexported')
  call add(cmds, '-w --quiet')
  let cmd = join(cmds, " ")

  if a:0 > 0
    let tags = a:1
    if tags != '--'
      call add(cmds, '-add-tags')
      call add(cmds, tags)
    endif
  else
    call add(cmds, '-add-tags json')
  endif

  if a:0 > 1
    let options = a:2
    if options != '--'
      call add(cmds, '-add-options')
      call add(cmds, options)
    endif
  else
    call add(cmds, '-add-options json=omitempty')
  endif

  if a:0 > 2
    let transform = a:2
    if transform != '--'
      call add(cmds, '-transform')
      call add(cmds, transform)
    endif
  else
    call add(cmds, '-transform camelcase')
  endif

  execute join(cmds, " ")
endfunction
