set number

" set smartindent

" tabstop tells vim how many columns a tab counts for
set tabstop=4
" shiftwidth sets how many columns << and >> count for, also reindent
set shiftwidth=4
" converts tab's into spaces
set expandtab

" pathogen is a plugin to more easily handle vim scripts/plugins
call pathogen#infect()
syntax on
filetype plugin indent on

" set my color scheme to wombat
" colo wombat
