" vim:set foldmarker={,} foldlevel=0 foldmethod=marker :
" vimrc
" Structure based on :options command
" Use :help 'option' to see the documentation for the given option.

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vundle - Vim package manager {

filetype off    " Required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required!
Plugin 'gmarik/Vundle.vim'

Plugin 'gcmt/breeze.vim'
Plugin 'docunext/closetag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

" }
" Plugins Settings {
  " Airline {
    let g:airline#extensions#tabline#enabled = 1 	"Smarter tabline
  " }
  " NERDTree {
    " Close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    let NERDTreeShowBookmarks=1	" Open bookmarks by default
    map <C-n> :NERDTreeToggle<CR> 	"Show/Hide NERDTree
    " Make nerdtree look nice
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let g:NERDTreeWinSize = 30
  " }
  " Indent Guides {
    au VimEnter * :IndentGuidesEnable
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
  " }
  " CTRL-P {
    let g:ctrlp_max_files = 0 " Set no max file limit
    " Search from current directory instead of project root
    let g:ctrlp_working_path_mode = 0
  " }
  " Closetag {
    let g:closetag_html_style=1
  " }
  " Tagbar {
    nmap <F8> :TagbarToggle<CR>	"Show/Hide Tagbar
  " }
  " Syntastic {
    "mark syntax errors with :signs
    let g:syntastic_enable_signs=1
    "automatically jump to the error when saving the file
    let g:syntastic_auto_jump=0
    "show the error list automatically
    let g:syntastic_auto_loc_list=1
  " }
" }
" Important {

" Turn on Filetype detection, plugins, and indent
if has('autocmd')
  filetype plugin indent on
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }
" Moving around, searching and patterns {
set incsearch
set whichwrap+=<,>,h,l,[,]
set ignorecase	"Ignore case when searching
set smartcase	"When searching try to be smart about cases

" }
" Tags {

" }
" Displaying text {
if !&scrolloff
  set scrolloff=3
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set number	"Line numbers are good
set listchars=tab:▸\ ,eol:¬ 	" Use the same symbols as TextMate for tabstops and EOLs

" }
" Syntax, highlighting and spelling {
if has('syntax') && !exists('g:syntax_on')
  syntax enable			" Turn on syntax highlighting
endif

set background=dark
colorscheme solarized
set guifont=Anonymous\ Pro:h13

set hlsearch	"Highlight search results

" }
" Multiple windows {
set laststatus=2

" }
" Multiple tab pages {
if &tabpagemax < 50
  set tabpagemax=50
endif

set showtabline=2 	"Always show tab line
set guitablabel=\[%N\]\ %t\ %M

" }
" Terminal {

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" }
" Using the mouse {

" }
" GUI {

" Disable localized menus for now since only some items are translated
set langmenu=none

" }
" Printing {

" }
" Messages and info {
set ruler
set showcmd
set showmode	"Show current mode down the bottom

" }
" Selecting text {
"Operations such as yy, D, and P work with the system clipboard. No need to prefix them with "+ or "*.
set clipboard=unnamed

" }
" Editing text {
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set showmatch 	"Show matching brackets when text indicator is over them

" }
" Tabs and indenting {
set autoindent
set smarttab
set ts=2 sw=2 et

" }
" Folding {
set foldmethod=indent
set nofoldenable

" }
" Diff mode {

" }
" Mapping {
set ttimeout
set ttimeoutlen=100

inoremap <C-U> <C-G>u<C-U>
inoremap jk <Esc>
let mapleader = "\<space>"
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`

"Disable Arrow keys in Normal and Insert Mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>

"Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" }
" Reading and writing files {
set autoread
set fileformats+=mac
set nobackup
set nowb

" }
" Swap file {
set noswapfile

" }
" Command line editing {
set wildmenu

if &history < 1000
  set history=1000
endif

" }
" Executing external commands {
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" }
" Running make and jumping to errors {

" }
" Language specific {

" }
" Multi-byte characters {
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" }
" Various {
if !empty(&viminfo)
set viminfo^=!
endif
set sessionoptions-=options

" Removes trailing spaces
function TrimWhiteSpace()
%s/\s*$//
''
:endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

" Visual mode search
function! s:VSetSearch()
let temp = @@
norm! gvy
let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
" Use this line instead of the above to match matches spanning across lines
"let @/ = '\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>?<CR>

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" }
