" Switch into distraction free writing (iA Writer like)
" Requires 'Cousine' font, see: http://www.fontsquirrel.com/fonts/cousine
function! DistractionFreeWriting()
  set laststatus=0
  set noruler
  set linebreak
  set norelativenumber
  set nonumber

  if has("gui_running")
    colorscheme iawriter
    set background=light
    set lines=40 columns=100
    set linespace=5
    set guioptions-=r

    if has("gui_macvim")
      set fuoptions=background:#00f5f6f6
      set fullscreen
      set guifont=Cousine:h14
    elseif has("macunix")
      set guifont=Cousine:h14
    else
      set guifont=Cousine\ h14
    endif
  endif
endfunction

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

" Format whole file according to the filetype and vims syntax settings
function! FormatFile()
    execute "normal! mf"
    execute "normal! gg"
    execute "normal! =G"
    execute "normal! 'f"
endfunction

" Returns true if current file is a spec file
function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1 || match(expand("%"), ".feature$") != -1
endfunction

" Returns true if current file is a ruby test file
function! InRubyTestFile()
  return match(expand("%"), "_test.rb$") != -1
endfunction

" Returns true if current file is a javascript file
function! InJSFile()
  return match(expand("%"), ".js$") != -1
endfunction

" Run current file via rspec or if possible via zeus
function! RunCurrentTest()
  write
  if InSpecFile()
    let l:command = '!echo {runner} % && echo "" && {runner} %'

    " If .zeus.sock is present (in current working directory)
    if !empty(glob('.zeus.sock'))
      let l:runner = 'zeus test'
    else
      let l:runner = 'rspec'
    endif


    " If running in tmux
    if '$TMUX' != expand('$TMUX')
      let command = substitute('call Send_to_Tmux("{runner} {spec}\n")', '{runner}', l:runner, 'g')
      let command = substitute(l:command, '{spec}', expand('%'), 'g')
    else
      let command = substitute(l:command, '{runner}', l:runner, 'g')
    endif

    execute command
  elseif InRubyTestFile()
    execute '!ruby -Ilib -Itest %'
  elseif InJSFile()
    execute '!make test'
  endif
endfunction

" Run XML linter for syntax checking
function! RunXmlLint()
    silent execute ":w"

    let cmd = '!xmllint --noout %'
    execute cmd
endfunction

" Check for vim config update
function! CheckForUpgrade()
    let g:VimConfigUpdateCheck = 1

    let g:VimConfigUpdateCheckLockFile = $HOME . '/.vim/updatecheck.lock' " Not working in windows - who cares...
    let g:VimConfigUpdateCheckDelay = 432000 " 5 days in seconds...

    if !g:VimConfigUpdateCheck
        return
    endif

    let current = localtime()
    if !filereadable(g:VimConfigUpdateCheckLockFile)
        call writefile([current], g:VimConfigUpdateCheckLockFile)
    else
        let content = readfile(g:VimConfigUpdateCheckLockFile)
        let lastcheck = content[0]+0 " Force conversion to number
        let nextcheck = lastcheck+g:VimConfigUpdateCheckDelay

        if current < nextcheck
            return
        else
            call writefile([current], g:VimConfigUpdateCheckLockFile)
        endif
    endif

    let output = "Vim configuration update checker\n--------------------------------\n\n"

    execute 'lcd '.$HOME.'/.vim'

    let remote = system("git ls-remote origin -h refs/heads/master | awk '{print $1}'")
    let local  = system("git rev-parse HEAD")

    if remote == local
        let output .= '**Nothing to update**'
    else
        let output .= '**You need an update!**'
        let output .= "\n\n\nGit output\n----------\n\n"
        let output .= system("git pull origin master")
        let output .= system("git submodule update --init")
        let output .= "\n==========================================\n"
        let output .= "You're up to date now (Please restart Vim)"
        let output .= "\n==========================================" 
    endif

    execute 'lcd '.$HOME.'/.vim'

    execute ':tabnew'

    silent put=output

    set filetype=rst
    set nomodified

    execute ':tabp'
    redraw
endfunction

" Switch between light and dark background
function! SwitchBackground()
    let &background = (&background == "dark"? "light" : "dark")
endfunction

" Returns branch in square brackets or empty string based on fugitive#head output
function! GitBranch()
  if !exists('*fugitive#head')
    return ''
  endif

  let branch = fugitive#head(7)

  if branch == ''
    return ''
  endif

  return '[' . branch . ']'
endfunction
