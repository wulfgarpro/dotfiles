set nocompatible "disable vi compatability
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim.git
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
let g:lightline = { 'colorscheme': 'onehalfdark' }

Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

silent! colorscheme onehalfdark
silent! set termguicolors
set t_Co=256
set cursorline
set laststatus=2
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab "tabs are 4 spaces
" http://vimdoc.sourceforge.net/htmldoc/options.html#'backspace'
set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch
" http://vimdoc.sourceforge.net/htmldoc/options.html#'mouse'
" set mouse="vi"
set pastetoggle=<f3>

" vim-easytags settings
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2 
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" more natural splits
set splitbelow
set splitright

"rebind my favorite commands from Git.vim for Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>

" Allow saving of files as sudo when I forget to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

