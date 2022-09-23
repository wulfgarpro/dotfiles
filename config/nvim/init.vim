set nocompatible

call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-lualine/lualine.nvim'
    " nvim-web-devicons provides icons for lualine statusline.
    Plug 'kyazdani42/nvim-web-devicons'
    "Plug 'airblade/vim-gitgutter'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vimwiki/vimwiki'
    " plenary includes library of lua functions for nvim and is a dependency for
    " telescope.
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"-Config
"
set encoding=utf-8
filetype plugin indent on
" Hybrid line numbers
set number relativenumber
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
set colorcolumn=80
set spelllang=en_us,en_au

"-ColorScheme
"
set termguicolors
colorscheme dracula
syntax enable

"-NerdTree
"
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NerdTree is only thing left open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
    \ b:NERDTree.isTabTree()) | q | endif
" Toggle with ctrl-t.
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

"-Lualine
"
lua << END
require('lualine').setup()
END

"-Vim Wiki
"
let g:vimwiki_list = [
    \ {'path': '~/code/wiki', 'syntax': 'markdown', 'ext': 'md'}]
" Don't open markdown files outside of wiki as temporary wiki. This prevents
" markdown files outside of the wiki on `vimwiki_list` from being detected as
" filetype `vimwiki`.
let g:vimwiki_global_ext = 0

"-Git signs
"
lua << END
require('gitsigns').setup()
END

"-Other Key Maps
"
" * Leader is '\' by default.
" * nmap is "normal mode" map.
"
" Go to next/prev Coc error.
nmap <silent> <Leader>n <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>p <Plug>(coc-diagnostic-prev-error)
" Find files using Telescope.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"-Highlight
"
" This must go at the end of the file
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"-Other, anything
"
" Turn spelling on and set line length for various file types.
autocmd FileType gitcommit,markdown,rst,toml,vimwiki setlocal spell
