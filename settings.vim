" Set UTF-8 as default encoding
set encoding=utf-8

" No vi backward compatibility to vi
set nocompatible

" Automatically read files when they were changed on the filesystem
set autoread

" Mute system beep and supress visual bell
autocmd GUIEnter * set vb t_vb=

" Enable syntax highlighting
syntax on

" Set the leader key to comma
let mapleader = ","

" Vim information to keep
" 100 Marks, 1000 Registers, 100 Commands, 100 Searches, Buffer list
set viminfo='100,f1,\"1000,:100,/100,%

" Show line numbers
set number

" Enable spell checking
" set spell

" Spell checking languages
set spelllang=de,en

" Enable cursor to jump into 'invalid' space
"set virtualedit=all

" Activate line wrap and soft wrap
"set wrap
"set linebreak

" Mark line breaks with three dots
set showbreak=...

" Open files on the right side of the current file when using :vs
set splitright

" Improve omni complete menu behaviour
set completeopt=menu,preview

" Show a dollar sign in change mode to mark the end
set cpoptions+=$

" Always show 2 status lines (iuformation line and command line)
set laststatus=2

" My preferred status line layout
set stl=%t\ %m\ %r\ \ %y\ \ %{fugitive#statusline()}\ \ Zeile:\ %l/%L[%p%%]\ \ Spalte:\ %c\ \ Buffer:\ #%n

" Set scroll off to 8 lines
set scrolloff=8

" Enable wild menu - nicer, cleaner and faster tab completion for command and files in command line
set wildmenu

" Enable case insensitivity, but enable case insensitivity if there is at least one upper letter
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Already jump to the first hit during a search process
set incsearch

" Folding depending on indent
set foldmethod=syntax

" Open all folds when opening a new file
set nofoldenable

" Bo backup and swap files
set nobackup
set noswapfile

" Set tab width, tab width on deletion and of course use spaces instead of tabs
set ts=2 sts=2 sw=2 expandtab

" Make the backspace key act like it does in any editor (remove characters, indentation and end of lines)
set backspace=indent,eol,start

" Textwidth to 120 characters (based on this setting, the color column will appear)
set textwidth=120

" Always substitute global
set gdefault

" 'Hidden' buffers -- i.e., don't require saving before editing another file.
" Calling quit will prompt you to save unsaved buffers anyways.
set hidden

" Show current command in the lower right corner
set showcmd

" Automatically load plugins based on file extension
filetype plugin on

" Automatically indent based on file extension
filetype indent on

" Save the file if focus is lost (very handy)
" Attention: Does not work in terminal vim ;-)
au FocusLost * :wa

" Enable syntax highlighting of SQL and HTML within PHP files and set PHP folding and error handling
let php_sql_query=1
let php_htmlInStrings=1
"let php_folding=1 " Slow on macs for some reason, maybe: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
let php_parent_error_close=1
let php_parent_error_open=1

" Open netrw with tree style
let g:netrw_liststyle=3

" Set line spacing
set linespace=3

" Set color scheme
colors solarized

" Black background theme
set background=dark

" If GVIM was opened
if has("gui_running")

    " Font and fontsize
    " Hint: Use 'set guifont=*' to bring up systems font chooser
    "
    " If mac, go for Menlo, otherwise use Monospace
    if has('mac') || has('macunix')
        set guifont=Menlo\ Regular:h10
    else
        set guifont=Monospace\ 10
    endif

    " Disable menu bar
    set guioptions-=m

    " Disable tool bar
    set guioptions-=T

    " Disable left scroll bar (normal and vsplit one)
    set guioptions-=l
    set guioptions-=L

    " Disable right scroll bar (normal and vsplit one)
    set guioptions-=r
    set guioptions-=R
endif

" Special solarized setting to get awesome diffs
let g:solarized_diffmode="high"

" Make solarized show stuff like eol and tabs a bit lighter than normal
let g:solarized_visibility="low"

" Highlight current line
set cursorline

" Indent based on previous line
set autoindent

" Change signs for end of line, trailing whitespaces and tabs (needs :set list)
"set listchars=tab:▸\ ,eol:¬,trail:\·
set listchars=tab:▸\ ,trail:\·

" Show stuff like end of line, tabs and so on
set list

" Detect .phtml and .tpl files as PHP
autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.tpl set ft=php

" 4 space indenting for some specific file types
autocmd BufNewFile,BufRead *.php set ts=4 sts=4 sw=4 expandtab
autocmd BufNewFile,BufRead *.phtml set ts=4 sts=4 sw=4 expandtab


"------------------------------------------------------------------------------
" Plugin settings
" -----------------------------------------------------------------------------

" Initial NERDTree width
let NERDTreeWinSize=50

" Close NERDtree when files was opened
let NERDTreeQuitOnOpen=1

" Show NERDTree bookmarks
let NERDTreeShowBookmarks=1

" Display arrows instead of ascii art in NERDTree
let NERDTreeDirArrows=1

" Start NERDTree in minimal UI mode (No help lines)
let NERDTreeMinimalUI=1

" Open CtrlP window in mixed mode by default
let g:ctrlp_cmd = 'CtrlPMixed'

" Search in folder the contains .git and go upwards from current file to find it
let g:ctrlp_working_path_mode = 'r'

