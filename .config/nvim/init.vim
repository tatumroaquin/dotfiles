source $XDG_CONFIG_HOME/nvim/include/plugins.vim

let mapleader=","
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

syntax on
filetype on
set syntax=zsh

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

" nerd tree
nnoremap <C-t> :NERDTreeToggle<cr>
inoremap <C-t> :NERDTreeToggle<cr>

" vim fzf
nnoremap <C-f> :FZF<cr>
inoremap <C-f> <esc>:FZF<cr>

" invocation
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>x :x<cr>

" codeblock brackets {}
nnoremap <leader>/ A<space>{<cr>}<++><esc>ko
inoremap <leader>/ <esc>A{<cr>}<++><esc>ko

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
inoremap <leader>l <esc>/<++><cr>c4l

" next and prev tab navigation
nnoremap <silent> <leader>z :tabp<cr>
nnoremap <silent> <leader>a :tabn<cr>

" vim split screen navigation
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

" map console mode to semi-colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
