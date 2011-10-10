" Don't let Vim create new lines at the end of file
" Attention: This should be on the very top, because it overrides settings like 'textwidth'
"set binary

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
set stl=%t\ %m\ %r\ \ %y\ \ Zeile:\ %l/%L[%p%%]\ \ Spalte:\ %c\ \ Buffer:\ #%n%=%{strftime('%H:%M')}\ Uhr\ 

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

" Folding depending on indent (maybe use syntax)
set foldmethod=indent

" Open all folds when opening a new file
set nofoldenable

" Bo backup and swap files
set nobackup
set noswapfile

" Set tab width, tab width on deletion and of course use spaces instead of tabs
set ts=4 sts=4 sw=4 expandtab

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

" Enable (the better) PHP completion
au FileType php set omnifunc=phpcomplete#CompletePHP

" Save the file if focus is lost (very handy)
" Attention: Does not work in terminal vim ;-)
au FocusLost * :wa

" Enable syntax highlighting of SQL and HTML within PHP files and set PHP folding and error handling
let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1
let php_parent_error_close=1
let php_parent_error_open=1

" Open netrw with tree style
let g:netrw_liststyle=3

" If GVIM was opened
if has("gui_running")
    " Set window position, width and height for start up
    winpos 0 0
    set lines=95
    au GUIEnter * set columns=350

    " Special solarized setting to get awesome diffs
    let g:solarized_diffmode="high"

    " Set color scheme if using GVim
    colors solarized

    " Light background theme (solarized comes with a dark one, too)
    set background=light

    " Font and fontsize
    " Hint: Use 'set guifont=*' to bring up systems font chooser
    "set guifont=Monaco\ 9
    set guifont=Monospace\ 8

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

" Highlight current line
set cursorline

" Indent based on previous line
set autoindent

" Change signs for end of line and tabs (needs :set list)
set listchars=tab:▸\ ,eol:¬

" Set color column if using Vim 7.3+
if v:version >= 703
    " Set color column to textwidth -39 and +1 (Columns 81 and 121)
    "set colorcolumn=-39,+1

    " Set color column color
    "hi ColorColumn ctermbg=233 guibg=#3C3C3C
endif

" Detect .phtml files as PHP
autocmd BufNewFile,BufRead *.phtml set ft=php



"------------------------------------------------------------------------------
" Plugin settings
" -----------------------------------------------------------------------------

" Open VCSCommand's splut function vertical
"let VCSCommandSplit = 'vertical'

" Set latex output format to PDF
let g:Tex_DefaultTargetFormat = "pdf"

" Detect empty .tex file as latex
let g:tex_flavor='latex'

" Automatically compile to dvi and pdf when comiling a tex file
let g:Tex_MultipleCompileFormats = "dvi,pdf"

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

" Show only class name, constants and class methods on taglist
let tlist_php_settings='php;c:Class;d:Constants;f:Methods'

" Show taglist on the right side
let g:Tlist_Use_Right_Window=1 

" Just show the tags for the current file in taglist
let g:Tlist_Show_One_File=1

" Set taglist width
let g:Tlist_WinWidth=50
