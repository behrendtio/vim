" sudo save
cmap w!! w !sudo tee % >/dev/null

" Move by screen line instead of file line
nmap j gj
nmap k gk

" Exit insert mode with jj
map! jj <Esc>

" Save with CTRL-S both in insert and command mode
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" Close buffer with CTRL-C
map <C-c> :bd<CR>

" Toggle NERDtree with ,n
map <Leader>n :NERDTreeToggle<CR>

" Toggle code comment with NERDCommenter
vmap <Leader>c :call NERDComment("nx", "Toggle")<CR>

" Run all specs for current file
nmap <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
" Run only nearest spec
nmap <Leader>, :w<cr>:call RunNearestSpec()<CR>

" Switch to the alternate buffer with ,SPACE
nnoremap <Leader><space> :<Esc>:b#<CR>

" Open vimrc file with ,v
nmap <leader>v :tabedit $MYVIMRC<CR>

" Search tag with ,s
nmap <Leader>s <Esc>:tag<space>

" Open current file via `open` command (Mac only)
nmap <Leader>o :!open %<CR>

" Jump to tag with ,j
nmap <Leader>j <Esc><C-]>

" Jump to tag in split window with ,js
nmap <Leader>js <Esc>:vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Format whole file with ,f
nmap <Leader>f <Esc>:call FormatFile()<CR>

" Re-open file with windows line endings
nmap <Leader>dos :e ++ff=dos<CR>

" Use tab to toggle between matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Switch between light and dark background with Control-F11
map <C-F11> :call SwitchBackground()<CR>

" Use space to put current line on top
nmap <Space> zt

" Shortcuts for tabular plugin
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /=\zs<CR>

" Disable arrow keys for navigation
" Use left and right arrow key for previous and next buffer
" Use up and down for bubbling lines
nmap <up> [e
nmap <down> ]e
nnoremap <left> <Esc>:bp<CR>
nnoremap <right> <Esc>:bn<CR>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <Esc>:bp<CR>
inoremap <right> <Esc>:bn<CR>

" Use first five tabs like in Chrome (Command-$Number)
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt

" Use CTRL + direction to move from one split to another
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map backtick to single quote and vice versa
" That way single quote act's like backtick for marks,
" hence it jumps to the exact position, not just the beginning
" of the line. To get single quote behaviour, backtick can be used
nnoremap ' `
nnoremap ` '
