let mapleader=","
syntax on
filetype on
colorscheme pablo

set nu rnu hls ic is
set autoindent
set autoread
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set laststatus=2

set backspace=indent,eol,start
set noerrorbells
set vb t_vb=
set clipboard+=unnamedplus

set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

" next logical line
nnoremap <S-j> gj
nnoremap <S-k> gk

" map escape key to jk
inoremap <silent> jk <esc>
inoremap <silent> JK <esc>
vnoremap <silent> <leader>jk <esc>
vnoremap <silent> <leader>JK <esc>

" go to next custom <++> marker
nnoremap <leader>l <esc>/<++><cr>c4l

" next and prev tab navigation
nnoremap <silent> <leader>z :tabp<cr>
nnoremap <silent> <leader>a :tabn<cr>

" map console mode to semi-colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
