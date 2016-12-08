set number

set tabstop=4
set shiftwidth=4
set expandtab

call pathogen#infect()
syntax on
filetype plugin indent on

set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
" color scheme of the moment:
syntax on
colorscheme onehalfdark
" let g:airline_theme='onehalflight'

set gfn=Ubuntu\ Mono\ 12

set backspace=indent,eol,start

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
