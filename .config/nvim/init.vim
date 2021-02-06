" Plugins management
call plug#begin(stdpath('data') . '/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'itchyny/lightline.vim'

    Plug 'ap/vim-css-color'
call plug#end()


colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }
