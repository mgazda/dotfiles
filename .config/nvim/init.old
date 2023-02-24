set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins management
call plug#begin(stdpath('data') . '/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'itchyny/lightline.vim'

    Plug 'ap/vim-css-color'

    Plug 'vim-scripts/fish-syntax'
call plug#end()

" Colors
colorscheme gruvbox
set background=dark
let g:lightline = { 'colorscheme': 'gruvbox' }
let g:airline_powerline_fonts = 1

" My defaults
syntax on
set backspace=indent,eol,start
set cindent
set colorcolumn=85
set cpoptions="aAeF"
set cursorline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileformats=unix,dos
set foldcolumn=2
set foldmethod=syntax
set gdefault
set hlsearch
set ignorecase
set incsearch
set magic
set mouse=a
set nowrap
set number
set scrolloff=10
set shiftwidth=2
set smartcase
set tabstop=2
set undofile

" My bindings
let mapleader="\\"

nnoremap <leader><space> :noh<CR>
nnoremap <leader>w :setlocal wrap!<CR>
nnoremap <leader>r :setlocal relativenumber!<CR>

noremap <C-l> gt
noremap <C-h> gT

nnoremap <C-n> :NERDTreeToggle<CR>
