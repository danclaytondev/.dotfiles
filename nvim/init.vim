:inoremap jj <Esc>

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'

call plug#end()

set number
highlight LineNr ctermfg=grey
