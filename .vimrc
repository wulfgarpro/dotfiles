set number

set tabstop=4
set shiftwidth=4
set expandtab

call pathogen#infect()
syntax on
filetype plugin indent on

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2

" color scheme of the moment:
syntax on
colorscheme slate

set gfn=Ubuntu\ Mono\ 12

