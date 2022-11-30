lua require('plugins')

set relativenumber
set showmatch
set ignorecase
set hlsearch
set incsearch
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set number
filetype plugin indent on
filetype plugin on
syntax on
set cursorline
set ttyfast
set autochdir
"set background=light
set mouse=

" File type mapping
au BufNewFile,BufRead /*.rasi setf css

" w!! will save file as sudo.
cmap w!! %!sudo tee > /dev/null %

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

function! Copy()
  %w !xclip -i -sel c
endfunc

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" Undo history between sessions
set undodir=~/.nvim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Clear hlsearch on insert mode
for key in ['i','I','o','O','a','A']
  exe 'nnoremap <silent>' key ':noh<CR>'.key
endfor

" fix mistype :W and :Q
command! -bang -range=% -complete=file -nargs=* WQ <line1>,<line2>wq<bang> <args>
command! -bang -complete=file -nargs=* Qa qa<bang>
command! -bang -complete=file -nargs=* QA qa<bang>
command! -bang -range=% -complete=file -nargs=* Wq <line1>,<line2>wq<bang> <args>
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>w<bang> <args>
command! -bang Q quit<bang>

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

autocmd VimEnter * PackerCompile
