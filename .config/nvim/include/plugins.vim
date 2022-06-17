call plug#begin('~/.config/nvim/plugged')
   Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
   Plug 'mattn/emmet-vim', {'branch': 'master'}
   "Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'preservim/nerdtree', {'branch': 'master'}
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()
