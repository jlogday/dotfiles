set nocompatible                 " use vim settings
execute pathogen#infect()

" zo    Open fold under cursor
" zR    Open all folds
" zc    Close fold under cursor
" zM    Close all folds

" Statusline {{{1
set laststatus=2                         " always show statusline
set statusline=
"set statusline+=%#CursorColumn#              " color
"set statusline+=\ %n\                        " current buffer number
set statusline+=%#CursorLine#                " color
"set statusline+=\ %f\                        " path to file in the buffer
set statusline+=%f\                           " path to file in the buffer
set statusline+=%m                           " modified flag
set statusline+=%r                           " readonly flag
set statusline+=%h                           " help flag
set statusline+=%w                           " preview flag
set statusline+=%#Title#                     " color
set statusline+=%{FugitiveStatusline()}      " current git branch
set statusline+=%#CursorLine#                " color
set statusline+=[%{&ff}]                     " current fileformat
"set statusline+=%y                          " current syntax
set statusline+=[%L]                         " number of lines
set statusline+=%=                           " switch to right side
set statusline+=%#CursorLine#                " color
set statusline+=%Y                           " current syntax
set statusline+=%#CursorIM#                  " color
set statusline+=\ %l:%v\                     " current line and column
set statusline+=%#Cursor#                    " color
set statusline+=\ %3p%%\                     " current percent into file
" }}}1

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
syntax on                        " enable syntax processing
filetype plugin indent on        " enable filetype detection and indenting
set diffopt=filler,vertical
set hidden                       " allow :argdo to work with buffers
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
set wildignore+=*.class,.svn,target/**
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
    autocmd FileType xml setlocal textwidth=9999
    autocmd FileType jinja setlocal textwidth=9999
    autocmd FileType groovy setlocal textwidth=120
    autocmd BufEnter Makefile setlocal noexpandtab

    " jump to last known cursor position when opening a file
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END

" automatically open quickfix window after :make or :grep
augroup qfgroup
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END
" }}}1

" Aliases {{{1
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap gb :ls<CR>:b<SPACE>

nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

set pastetoggle=<Leader>z
" }}}1

" Commands {{{1
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}1

" Fugitive {{{1
let g:fugitive_gitlab_domains = ['http://c-bravovm.nuance.com', 'http://c-bravovm.corporate.nsirad.com']
" }}}1


" vim:foldmethod=marker:foldlevel=0
