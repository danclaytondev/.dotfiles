:inoremap jj <Esc>

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'olimorris/onedarkpro.nvim'

call plug#end()

set number
highlight LineNr ctermfg=grey

colorscheme onedark


