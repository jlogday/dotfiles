execute pathogen#infect()
set nocompatible                 " use vim settings
syntax on                        " enable syntax processing
filetype plugin indent on        " enable filetype detection and indenting
set hidden                       " allow :argdo to work with buffers

" zo    Open fold under cursor
" zR    Open all folds
" zc    Close fold under cursor
" zM    Close all folds

" Colors {{{1
set t_Co=256                     " enable 256 colors
colorscheme zenburn              " zenburn colorscheme
" }}}1

" Tabs and Spaces {{{1
set tabstop=8                    " number of visual spaces per TAB
set softtabstop=8                " number of spaces per TAB when editing
set expandtab                    " use spaces instead of TAB character
set shiftwidth=4                 "
" }}}1

" UI Layout {{{1
set backup                       " use backup files
set history=200                  " keep 200 lines of command history
set ruler                        " show the cursor position all the time
set showcmd                      " display commands in bottom bar
set cursorline                   " highlight current line
set lazyredraw                   " redraw less often
set showmatch                    " highlight matching [{()}]
set textwidth=78                 " default text width
set modeline                     " use a modeline
set modelines=1                  " only 1 line needed for modeline
set fileformats=unix,mac,dos     " recognized line ending styles
set list                         " use list mode
set listchars=tab:>-             " mark tabs and eols in list mode
set wildmenu                     " visual autocomplete for command line
" ignore additional files in wildmenu
set wildignore+=*.class,.git,.svn,target/**
" }}}1

" Search {{{1
set incsearch                    " incremental search
set hlsearch                     " highlight all matches
" turn off search highlight
:nnoremap <silent> <Space> :nohlsearch<CR>
" }}}1

" AutoGroups {{{1
augroup configgroup
    autocmd!
    autocmd FileType text setlocal textwidth=78
    autocmd FileType xml setlocal textwidth=120
    autocmd FileType groovy setlocal textwidth=120
    autocmd BufEnter Makefile setlocal noexpandtab

    " jump to last known cursor position when opening a file
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

augroup END
" }}}1

" Aliases {{{1
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
set pastetoggle=<Leader>z
" }}}1

let g:ackprg='ag --nogroup --nocolor --column'
let g:fugitive_gitlab_domains = ['http://c-bravovm.nuance.com', 'http://c-bravovm.corporate.nsirad.com']

" vim:foldmethod=marker:foldlevel=0
