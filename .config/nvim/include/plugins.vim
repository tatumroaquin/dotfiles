call plug#begin('~/.config/nvim/plugged')
   Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
   Plug 'mattn/emmet-vim', {'branch': 'master'}
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'preservim/nerdtree', {'branch': 'master'}
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
