let mapleader = ","
" <TAB>: completion.
noremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Disable scratchpad
set completeopt-=preview

imap <M-Space> <Esc>

" Remove delay between modes.
set timeoutlen=1000 ttimeoutlen=0

set encoding=utf-8

" Smart case search
set smartcase

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1 
let g:neocomplcache_enable_at_startup = 1

" Disable arrows for navigating
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

" Autocomplete braces and apostrophes and move cursor between them.
""inoremap ( ()<Esc>i
""inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
""inoremap ' ''<Esc>i
""inoremap " ""<Esc>i

nnoremap j gj
nnoremap k gk

" w!! will save file as sudo.
cmap w!! %!sudo tee > /dev/null %

" Create new / change buffer
map <C-t> :tabnew<CR>
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>

" Bigger block size for faster scrolling
set ttyfast

" Undo history between sessions
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Colored column (to see line size violations)
" set colorcolumn=80

" Source .vimrc after saving .vimrc
" autocmd bufwritepost .vimrc source $MYVIMRC

" Highlight current line in insert mode.
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Bundle thingie
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
"
" original repos on github
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'tpope/vim-rails.git'
" vim-scripts repos
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" ...
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-unimpaired'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set background=dark
" Color settings
set t_Co=256
colorscheme tuutti 
" use filetype plugins, e.g. for PHP
" filetype plugin on

" old vim thingies continue
syntax on

"set scrolljump=5
set scrolloff=5

" repair wired terminal/vim settings
set backspace=start,eol,indent

" toggle paste
set pastetoggle=§

set wrap 

" show nice info in ruler
set ruler
set laststatus=2

" set standard setting for pear coding standards
set tabstop=2
set shiftwidth=2

" auto expand tabs to spaces
set expandtab

" auto indent after a {
set autoindent
set smartindent

" show line numbers by default
set number

" use incremental searching
set incsearch

autocmd BufEnter * lcd %:p:h
au BufRead,BufNewFile *.install		set filetype=php
au BufRead,BufNewFile *.module		set filetype=php
au BufRead,BufNewFile *.inc 		set filetype=php
au BufRead,BufNewFile *.test 		set filetype=php
au BufRead,BufNewFile *.twig 		set filetype=html

" Disable pastemode when leaving insert mode.
au InsertLeave * set nopaste

" Search files with unite.vim
nnoremap <C-p> :Unite -start-insert file_rec/async -default-action=tabopen<cr>
nnoremap <space>p :Unite -start-insert file_rec/async<cr>

" Search from yank history.
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" Search content with unite.vim
nnoremap <space>c :Unite grep:.<cr>

" Search buffer with unite.vim
nnoremap <space>b :Unite -quick-match buffer<cr>

nmap ; :CtrlPBuffer<CR>
" Autocenter on ggG
nmap <silent> ggG ggGzz


" Reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" Keep search pattern at the center of the screen. 
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" keep page up/down at the center of the screen
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz

" Toggle tagbar and auto resize existing spit windows to use exactly same
" amount of space
nmap <F8> :TagbarToggle<CR><C-w>=
" Resize tagbar to use 30 chars instead of 40
let g:tagbar_width = 30

" Leave mode handling for airline.vim
"set noshowmode

" Unimpaired: Move line up/down
map <S-Up> [e
map <S-Down> ]e

" fix mistype :W and :Q
command! -bang -range=% -complete=file -nargs=* WQ <line1>,<line2>wq<bang> <args>
command! -bang -complete=file -nargs=* Qa qa<bang>
command! -bang -complete=file -nargs=* QA qa<bang>
command! -bang -range=% -complete=file -nargs=* Wq <line1>,<line2>wq<bang> <args>
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>w<bang> <args>
command! -bang Q quit<bang>
