" Set UTF-8 as default encoding
set encoding=utf-8

" No vi backward compatibility to vi
set nocompatible

" Automatically read files when they were changed on the filesystem
set autoread

" Use new regex engine
set re=1

" Mute system beep and supress visual bell
autocmd GUIEnter * set vb t_vb=

" Enable syntax highlighting
syntax on

" Set the leader key to comma
let mapleader = ","

" Vim information to keep
" 100 Marks, 1000 Registers, 100 Commands, 100 Searches, Buffer list
set viminfo='100,f1,\"1000,:100,/100,%

" Show line numbers (relative ones)
"set relativenumber

" Enable spell checking
" set spell

" Spell checking languages
set spelllang=en

" Enable cursor to jump into 'invalid' space
"set virtualedit=all

" Activate line wrap and soft wrap
"set wrap
"set linebreak

" Mark line breaks with three dots
set showbreak=...

" Natural splitting
set splitbelow
set splitright

" Improve omni complete menu behaviour
set completeopt=menu,preview

" Show a dollar sign in change mode to mark the end
set cpoptions+=$

" Always show 2 status lines (iuformation line and command line)
set laststatus=2

" My preferred status line layout
set stl=%t\ %m\ %r\ \ %y\ \ %{GitBranch()}\ \ %l/%L[%p%%]\ \ Col:\ %c\ \ Buf:\ #%n\ 

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
set foldmethod=indent

" Open all folds when opening a new file
set nofoldenable

" Bo backup and swap files
set nobackup
set noswapfile

" Set tab width, tab width on deletion and of course use spaces instead of tabs
set ts=2 sts=2 sw=2 expandtab

" Make the backspace key act like it does in any editor (remove characters, indentation and end of lines)
set backspace=indent,eol,start

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

" Open netrw with tree style
let g:netrw_liststyle=3

" Well, redraw lazily
set lazyredraw

" Background color
set background=light

" Colors
colors solarized

" If using GVIM/MacVim
if has("gui_running")
    " Different colors in GUI version
    colors onedark
    set background=dark

    " Use interactive shell when running commands through :!
    " This let's the shell load it's configuration, hence
    " aliases and config parameters are available and set, respectively
    set shellcmdflag=-ic

    " Set line spacing
    set linespace=3

    " If mac
    if has("macunix")
      " Use the whole screen
      set lines=99999
      set columns=99999

      set guifont=Menlo\ Regular:h12,Monospace:h12
    else
      " If linux
      set guifont=Ubuntu\ Mono\ 12,Monospace\ 12
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

    " Copy handling
    set guioptions+=a
    set guioptions+=A
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

" Enabled spell checking and set textwidth to 80 characters for markdown and text files
autocmd BufNewFile,BufRead *.md,*.markdown,*.txt setlocal spell textwidth=80

" Textwidth to 72 characters and spell check for git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Use go syntax for .go files
au BufRead,BufNewFile *.go setlocal filetype=go nolist ts=4 sts=4 sw=4 noexpandtab

"------------------------------------------------------------------------------
" Plugin settings
" -----------------------------------------------------------------------------

" Initial NERDTree width
let NERDTreeWinSize=50

" Close NERDtree when files was opened
let NERDTreeQuitOnOpen=1

" Show NERDTree bookmarks
let NERDTreeShowBookmarks=0

" Display arrows instead of ascii art in NERDTree
let NERDTreeDirArrows=1

" Change current working directory based on root directory in NERDTree
let NERDTreeChDirMode=2

" Start NERDTree in minimal UI mode (No help lines)
let NERDTreeMinimalUI=1

" Hide .pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Open CtrlP window in mixed mode by default
let g:ctrlp_cmd = 'CtrlPMixed'

" Search in folder the contains .git and go upwards from current file to find it
let g:ctrlp_working_path_mode = 'r'

" Use silver searcher as CtrlP backend if installed
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Use tab for snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Use C-E and then comma to run emmet
let g:user_emmet_leader_key='<C-E>'

" Allow JSX in normal JS files as well
let g:jsx_ext_required = 0

" Always clear output and use bin/rspec
let g:rspec_command = "!clear && bin/rspec {spec}"

" Heredoc syntax highlighting for GraphQL queries
let g:ruby_heredoc_syntax_filetypes = {
      \ "graphql" : {
      \   "start" : "GRAPHQL",
      \},
      \}
