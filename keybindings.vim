" sudo save
cmap w!! w !sudo tee % >/dev/null

" Exit insert mode with jj
map! jj <Esc>

" Save with CTRL-S both in insert and command mode
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" Close buffer with CTRL-C
map <C-c> :bd<CR>

" Gundo side bar with ,g
map <Leader>g :GundoToggle<CR>

" Toggle NERDtree with ,n
map <Leader>n :NERDTreeToggle<CR>

" Toggle code comment with NERDCommenter
vmap <Leader>c :call NERDComment("nx", "Toggle")<CR>

" Run specs for current file
nmap <Leader>t :call RunCurrentSpec()<CR>
" Since tests are soo awesome, use leader+leader to run tests as well
nmap <Leader>, :call RunCurrentSpec()<CR>

" Switch to the alternate buffer with ,SPACE
nnoremap <leader><space> :<Esc>:b#<CR>

" Open vimrc file with ,v
nmap <leader>v :tabedit $MYVIMRC<CR>

" Search tag with ,s
nmap <Leader>s <Esc>:tag<space>

" Jump to tag with ,j
nmap <Leader>j <Esc><C-]>

" Format whole file with ,f
nmap <Leader>f <Esc>:call FormatFile()<CR>

" Run XML file through linter with ,xl
nmap <Leader>xl :call RunXmlLint()<CR>

" Re-open file with windows line endings
nmap <Leader>dos :e ++ff=dos<CR>

" Insert Rst Headline marks under the current line
map <Leader>h1 yypVr=o
map <Leader>h2 yypVr-o
map <Leader>h3 yypVr~o

" Use tab to toggle between matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Switch between light and dark background with Control-F11
map <C-F11> :call SwitchBackground()<CR>

" Shortcuts for tabular plugin
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /=\zs<CR>

" Disable arrow keys for navigation
" Use left and right arrow key for previous and next buffer
" USe up and down to bubbling lines
nmap <up> [e
nmap <down> ]e
nnoremap <left> <Esc>:bp<CR>
nnoremap <right> <Esc>:bn<CR>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <Esc>:bp<CR>
inoremap <right> <Esc>:bn<CR>

" Use first five tabs like in Chrome or Sublime (Command-$Number)
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt

" Map backtick to single quote and vice versa
" That way single quote act's like backtick for marks,
" hence it jumps to the exact position, not just the beginning
" of the line. To get single quote behaviour, backtick can be used
nnoremap ' `
nnoremap ` '
