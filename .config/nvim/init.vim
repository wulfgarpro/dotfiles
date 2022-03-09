set nocompatible

call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-lualine/lualine.nvim'
    " Icons in lualine statusline
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vimwiki/vimwiki'
call plug#end()

"-Config
"
set encoding=utf-8
filetype plugin indent on
" Hybrid line numbers
set number relativenumber
set textwidth=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

"-ColorScheme
set termguicolors
colorscheme dracula
syntax enable

"-NerdTree
"
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle with ctrl-t
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

"-Lualine
"
lua << END
require('lualine').setup()
END

"-Highlight
"
" This must go at the end of the file
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"-Vim Wiki
"
let g:vimwiki_list = [{'path': '~/code/wiki', 'syntax': 'markdown'}]
au FileType vimwiki setlocal shiftwidth=4 tabstop=4 noexpandtab
