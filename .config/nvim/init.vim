:inoremap jj <Esc>

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'olimorris/onedarkpro.nvim'
Plug 'bullets-vim/bullets.vim'

call plug#end()

set number
highlight LineNr ctermfg=grey

colorscheme onedark


