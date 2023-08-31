let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set number
set hlsearch

call plug#begin('~/.vim/plugged')

  Plug 'preservim/nerdtree'

call plug#end()

let mapleader = " "
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
