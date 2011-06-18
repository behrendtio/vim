" sudo save
cmap w!! w !sudo tee % >/dev/null

" Exit insert mode with jj
map! jj <Esc>

" Use Enter for omni complete as same as in eclipse/netbeans
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Save with CTRl-S
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" Close buffer with CTRL-C
map <C-c> :bd<CR>

" Open FuzzyFinder (and load all files in all sub directories) with ,o
map <Leader>o :FufFile **/<CR>

" Buffer FuzzyFinder with ,b
map <Leader>b :FufBuffer<CR>

" Gundo side bar with ,g
map <Leader>g :GundoToggle<CR>

" Toggle NERDtree with ,n
map <Leader>n :NERDTreeToggle<CR>

" Switch to the alternate buffer with ,SPACE
nnoremap <leader><space> :<Esc>:b#<CR>

" Open vimrc file with ,v
nmap <leader>v :tabedit $MYVIMRC<CR>

" Show recently opened files with ,u
map <leader>u <Esc>:MRU<CR>

" Toggle taglist with ,l
map <silent> <leader>l <Esc>:TlistToggle<CR>

" Create PHPDoc blocks with ,d
noremap <leader>d <Esc>:call PhpDoc()<CR>

" Search tag with ,s
nmap <Leader>s <Esc>:tag<space>

" Run exuberant-ctags with ,c (in the current folder)
nmap <Leader>c <Esc>:w<CR>:call BuildTags()<CR>

" Jump to tag with ,j
nmap <Leader>j <Esc><C-]>

" Run current PHP file in interpreter
nmap <Leader>r <Esc>:w<CR>:!clear; php %:p<CR>

" Run current PHP file through linter
nmap <Leader>rl <Esc>:w<CR>:!php -l %<CR>

" Start unit test of the current test with ,p
nmap <Leader>p <Esc>:w<CR>:!clear; cd tests/; phpunit %:p; cd ..<CR>

" Run all unit tests with ,P
nmap <Leader>P <Esc>:w<CR>:!clear; cd tests/; phpunit; cd ..<CR>

" Jump to the unit test of the current file with ,op
nmap <Leader>op <Esc>:w<CR>:call OpenPHPUnitTest()<CR>

" Open scratch markdown buffer with ,xx
nmap <Leader>xx <Esc>:call OpenScratchRst()<CR>

" Format whole file with ,f
nmap <Leader>f <Esc>:call FormatFile()<CR>

" Compile rst file and open according pdf
nmap <Leader>qq <Esc>:w<CR>:call CompileRst()<CR>

" Run XML file through linter with ,xl
nmap <Leader>xl :call RunXmlLint()<CR>

" Open ToDo file from dropbox
nmap <Leader>t :tabnew ~/Dropbox/Todo.rst<CR>

" Re-open file with windows line endings
nmap <Leader>dos :e ++ff=dos<CR>

" Insert Rst Headline marks under the current line
map <Leader>h1 yypVr=o
map <Leader>h2 yypVr-o
map <Leader>h3 yypVr~o

" Use tab to toggle between matching brackets
nnoremap <tab> %
vnoremap <tab> %

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
