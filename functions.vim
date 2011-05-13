" Acts as :!command but shows the output in a seperate buffer
function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! execute 'resize ' . line('$')
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

" Opens the regarding Unit Test to a PHP file (needs ZF like folder stucture)
function! OpenPHPUnitTest()
    let file = 'tests/' . substitute(expand('%s'), '.php', '', '') . 'Test.php'
    let cmd  = 'vs ' . file
    execute cmd
endfunction

" Opens scratch markdown file
function! OpenScratchRst()
    let cmd = 'vs ~/Desktop/Scratch.rst'
    execute cmd
endfunction

" Format whole file according to the filetype and vims syntax settings
function! FormatFile()
    execute "normal! mf"
    execute "normal! gg"    
    execute "normal! =G"    
    execute "normal! 'f"
endfunction

" Compile rst document and open pdf file
function! CompileRst()
    let cmd = '!rst2pdf ' . expand('%s')
    let outfile = substitute(expand('%s'), '.rst', '.pdf', '')
    silent! execute cmd

    let open = '!evince ' . outfile . ' &'
    silent! execute open
endfunction

" Run XML linter for syntax checking
function! RunXmlLint()
    silent execute ":w"

    let cmd = '!xmllint --noout %'
    execute cmd
endfunction
